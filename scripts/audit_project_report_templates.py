#!/usr/bin/env python3
"""Audit the fixed layout contract of the two public report templates."""

from __future__ import annotations

import argparse
from pathlib import Path
from zipfile import ZipFile

from lxml import etree


W = "http://schemas.openxmlformats.org/wordprocessingml/2006/main"
NS = {"w": W}


def attr(node, name):
    return node.get(f"{{{W}}}{name}") if node is not None else None


def require(condition, message, issues):
    if not condition:
        issues.append(message)


def audit(path):
    issues = []
    with ZipFile(path) as archive:
        document = etree.fromstring(archive.read("word/document.xml"))
        styles = etree.fromstring(archive.read("word/styles.xml"))
        numbering = etree.fromstring(archive.read("word/numbering.xml"))

    section = document.find(".//w:sectPr", NS)
    page = section.find("w:pgSz", NS)
    margins = section.find("w:pgMar", NS)
    require((attr(page, "w"), attr(page, "h")) == ("12240", "15840"), "page must be US Letter", issues)
    for name, expected in {
        "top": "1440",
        "right": "1440",
        "bottom": "1440",
        "left": "1440",
        "header": "708",
        "footer": "708",
    }.items():
        require(attr(margins, name) == expected, f"page margin {name} must be {expected} DXA", issues)

    first_paragraph = document.find(".//w:body/w:p", NS)
    first_style = first_paragraph.find("w:pPr/w:pStyle", NS)
    require(attr(first_style, "val") != "Title", "title must not use the Word Title style", issues)

    expected_styles = {
        "Normal": {"font": "Arial", "size": "22", "after": "160", "line": "276"},
        "Heading1": {"font": "Arial", "size": "40", "before": "400", "after": "120", "line": "276"},
        "Heading2": {"font": "Arial", "size": "32", "before": "360", "after": "120", "line": "276"},
        "Heading3": {"font": "Arial", "size": "28", "before": "320", "after": "80", "line": "276"},
    }
    for style_id, expected in expected_styles.items():
        style = styles.find(f".//w:style[@w:styleId='{style_id}']", NS)
        require(style is not None, f"missing style {style_id}", issues)
        if style is None:
            continue
        fonts = style.find("w:rPr/w:rFonts", NS)
        size = style.find("w:rPr/w:sz", NS)
        spacing = style.find("w:pPr/w:spacing", NS)
        require(attr(fonts, "ascii") == expected["font"], f"{style_id} font mismatch", issues)
        require(attr(size, "val") == expected["size"], f"{style_id} size mismatch", issues)
        if "before" in expected:
            require(attr(spacing, "before") == expected["before"], f"{style_id} before spacing mismatch", issues)
        require(attr(spacing, "after") == expected["after"], f"{style_id} after spacing mismatch", issues)
        require(attr(spacing, "line") == expected["line"], f"{style_id} line spacing mismatch", issues)

    tables = document.findall(".//w:tbl", NS)
    require(bool(tables), "at least one table is expected", issues)
    for table_index, table in enumerate(tables, start=1):
        width = table.find("w:tblPr/w:tblW", NS)
        indent = table.find("w:tblPr/w:tblInd", NS)
        layout = table.find("w:tblPr/w:tblLayout", NS)
        grid = [int(attr(node, "w")) for node in table.findall("w:tblGrid/w:gridCol", NS)]
        require((attr(width, "type"), attr(width, "w")) == ("dxa", "9360"), f"table {table_index} width mismatch", issues)
        require((attr(indent, "type"), attr(indent, "w")) == ("dxa", "0"), f"table {table_index} indent mismatch", issues)
        require(attr(layout, "type") == "fixed", f"table {table_index} must use fixed layout", issues)
        require(sum(grid) == 9360, f"table {table_index} grid does not sum to 9360", issues)
        rows = table.findall("w:tr", NS)
        require(rows[0].find("w:trPr/w:tblHeader", NS) is not None, f"table {table_index} first row is not a header", issues)
        for row_index, row in enumerate(rows, start=1):
            require(row.find("w:trPr/w:trHeight", NS) is None, f"table {table_index} row {row_index} has a fixed height", issues)
            require(row.find("w:trPr/w:cantSplit", NS) is not None, f"table {table_index} row {row_index} can split", issues)
            widths = [int(attr(cell.find("w:tcPr/w:tcW", NS), "w")) for cell in row.findall("w:tc", NS)]
            require(widths == grid, f"table {table_index} row {row_index} widths do not match grid", issues)
            for cell in row.findall("w:tc", NS):
                margins = cell.find("w:tcPr/w:tcMar", NS)
                actual = tuple(attr(margins.find(f"w:{side}", NS), "w") for side in ("top", "bottom", "start", "end"))
                require(actual == ("80", "80", "120", "120"), f"table {table_index} cell margin mismatch", issues)

    for num_id in ("91", "92"):
        num = numbering.find(f".//w:num[@w:numId='{num_id}']", NS)
        require(num is not None, f"missing real numbering definition {num_id}", issues)

    if issues:
        print(f"FAIL {path}")
        for issue in issues:
            print(f"  - {issue}")
        return 1
    print(f"OK {path}: preset geometry, styles, numbering, and {len(tables)} tables verified")
    return 0


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("docx", type=Path, nargs="+")
    args = parser.parse_args()
    raise SystemExit(sum(audit(path) for path in args.docx) > 0)


if __name__ == "__main__":
    main()
