#!/usr/bin/env python3
"""Build the offline project data dictionary distributed in starter ZIPs."""

from __future__ import annotations

import argparse
from pathlib import Path

from reportlab.lib import colors
from reportlab.lib.enums import TA_LEFT
from reportlab.lib.pagesizes import letter
from reportlab.lib.styles import ParagraphStyle, getSampleStyleSheet
from reportlab.lib.units import inch
from reportlab.platypus import (
    ListFlowable,
    ListItem,
    PageBreak,
    Paragraph,
    SimpleDocTemplate,
    Table,
    TableStyle,
)


NAVY = colors.HexColor("#264653")
TEAL = colors.HexColor("#2A9D8F")
LIGHT = colors.HexColor("#EEF4F4")
GRID = colors.HexColor("#C8D2D4")
MUTED = colors.HexColor("#4F5B5D")


def styles():
    base = getSampleStyleSheet()
    return {
        "title": ParagraphStyle(
            "DictionaryTitle",
            parent=base["Title"],
            fontName="Helvetica",
            fontSize=24,
            leading=29,
            textColor=NAVY,
            alignment=TA_LEFT,
            spaceAfter=8,
        ),
        "subtitle": ParagraphStyle(
            "DictionarySubtitle",
            parent=base["Normal"],
            fontName="Helvetica",
            fontSize=11,
            leading=15,
            textColor=MUTED,
            spaceAfter=18,
        ),
        "h1": ParagraphStyle(
            "DictionaryH1",
            parent=base["Heading1"],
            fontName="Helvetica",
            fontSize=15,
            leading=18,
            textColor=NAVY,
            spaceBefore=12,
            spaceAfter=7,
        ),
        "body": ParagraphStyle(
            "DictionaryBody",
            parent=base["BodyText"],
            fontName="Helvetica",
            fontSize=9.5,
            leading=13.5,
            textColor=colors.black,
            spaceAfter=8,
        ),
        "bullet": ParagraphStyle(
            "DictionaryBullet",
            parent=base["BodyText"],
            fontName="Helvetica",
            fontSize=9.2,
            leading=12.2,
            textColor=colors.black,
            spaceAfter=3,
        ),
        "small": ParagraphStyle(
            "DictionarySmall",
            parent=base["BodyText"],
            fontName="Helvetica",
            fontSize=8.2,
            leading=10.5,
            textColor=colors.black,
        ),
        "small_bold": ParagraphStyle(
            "DictionarySmallBold",
            parent=base["BodyText"],
            fontName="Helvetica-Bold",
            fontSize=8.2,
            leading=10.5,
            textColor=colors.white,
        ),
        "note": ParagraphStyle(
            "DictionaryNote",
            parent=base["BodyText"],
            fontName="Helvetica-Oblique",
            fontSize=9,
            leading=12.5,
            textColor=MUTED,
            leftIndent=10,
            borderColor=TEAL,
            borderWidth=0,
            borderPadding=0,
            spaceBefore=7,
            spaceAfter=7,
        ),
    }


def p(text, style):
    return Paragraph(text, style)


def variable_table(rows, column_widths, style_map):
    data = [
        [
            p("Variable", style_map["small_bold"]),
            p("Type", style_map["small_bold"]),
            p("Unit or values", style_map["small_bold"]),
            p("Meaning", style_map["small_bold"]),
        ]
    ]
    for variable, kind, unit, meaning in rows:
        data.append(
            [
                p(f"<font name='Courier'>{variable}</font>", style_map["small"]),
                p(kind, style_map["small"]),
                p(unit, style_map["small"]),
                p(meaning, style_map["small"]),
            ]
        )
    table = Table(data, colWidths=column_widths, repeatRows=1, hAlign="LEFT")
    table.setStyle(
        TableStyle(
            [
                ("BACKGROUND", (0, 0), (-1, 0), NAVY),
                ("GRID", (0, 0), (-1, -1), 0.35, GRID),
                ("VALIGN", (0, 0), (-1, -1), "MIDDLE"),
                ("LEFTPADDING", (0, 0), (-1, -1), 6),
                ("RIGHTPADDING", (0, 0), (-1, -1), 6),
                ("TOPPADDING", (0, 0), (-1, -1), 3),
                ("BOTTOMPADDING", (0, 0), (-1, -1), 3),
                ("BACKGROUND", (0, 1), (-1, -1), colors.white),
            ]
        )
    )
    return table


def footer(canvas, document):
    canvas.saveState()
    canvas.setStrokeColor(GRID)
    canvas.setLineWidth(0.5)
    canvas.line(document.leftMargin, 0.56 * inch, letter[0] - document.rightMargin, 0.56 * inch)
    canvas.setFont("Helvetica", 8)
    canvas.setFillColor(MUTED)
    canvas.drawString(document.leftMargin, 0.36 * inch, "MATH 346 | Synthetic course data")
    canvas.drawRightString(
        letter[0] - document.rightMargin,
        0.36 * inch,
        f"Page {canvas.getPageNumber()}",
    )
    canvas.restoreState()


def build(path):
    path.parent.mkdir(parents=True, exist_ok=True)
    style_map = styles()
    doc = SimpleDocTemplate(
        str(path),
        pagesize=letter,
        rightMargin=0.72 * inch,
        leftMargin=0.72 * inch,
        topMargin=0.68 * inch,
        bottomMargin=0.76 * inch,
        title="MATH 346 Project Data Dictionary",
        author="",
        subject="Variables and units for the synthetic building-energy projects",
        creator="",
    )

    story = [
        p("Project data dictionary", style_map["title"]),
        p(
            "Variables, units, file sizes, and controlled data-quality features for the MATH 346 synthetic building-energy projects.",
            style_map["subtitle"],
        ),
        p("Scenario and unit of analysis", style_map["h1"]),
        p(
            "Each file describes a different <b>synthetic university teaching building</b>. One row represents one calendar day. The values are simulated for this course; they are not observations from an actual campus building or actual people.",
            style_map["body"],
        ),
        p(
            "All teams receive the same variables and a comparable amount of missingness, noise, and unusual behavior. Building characteristics, weather realizations, model coefficients, and numerical answers differ by group.",
            style_map["body"],
        ),
        p("Project 1: MATLAB file", style_map["h1"]),
        p(
            "Each file contains 121 daily records from 1 January through 30 April 2024. One heating-energy value is missing, and a small number of observations are deliberately unusual. Handle these features through code rather than editing the CSV manually.",
            style_map["body"],
        ),
        variable_table(
            [
                ("observation_id", "text", "none", "Unique record identifier, such as P1-001"),
                ("date", "date", "YYYY-MM-DD", "Calendar date of the daily observation"),
                ("outdoor_temp_c", "numeric", "degrees C", "Simulated mean outdoor temperature"),
                (
                    "heating_energy_kwh",
                    "numeric",
                    "kilowatt-hours",
                    "Simulated daily heating-energy consumption; one value is missing",
                ),
            ],
            [1.35 * inch, 0.75 * inch, 1.05 * inch, 3.9 * inch],
            style_map,
        ),
        p(
            "The accompanying assignment file contains the group identifier and the temperature at which the fitted model must make a prediction. The assigned temperature lies inside the observed temperature range.",
            style_map["note"],
        ),
        PageBreak(),
        p("Project 2: R training file", style_map["h1"]),
        p(
            "Each training file contains 301 rows representing 300 distinct days from 1 January through 27 October 2025. It contains one repeated record and a small, controlled number of missing values. Identifying and handling these records is part of the required R workflow.",
            style_map["body"],
        ),
        variable_table(
            [
                ("observation_id", "text", "none", "Daily record identifier; unique after cleaning"),
                ("date", "date", "YYYY-MM-DD", "Calendar date of the daily observation"),
                ("outdoor_temp_c", "numeric", "degrees C", "Simulated mean outdoor temperature"),
                ("occupancy_count", "numeric", "people", "Simulated daily building occupancy"),
                ("wind_speed_m_s", "numeric", "metres/second", "Simulated mean wind speed"),
                ("day_type", "category", "weekday, weekend", "Building operating-day category"),
                (
                    "heating_energy_kwh",
                    "numeric",
                    "kilowatt-hours",
                    "Simulated daily heating-energy consumption",
                ),
            ],
            [1.35 * inch, 0.75 * inch, 1.05 * inch, 3.9 * inch],
            style_map,
        ),
        p("Project 2: R validation file", style_map["h1"]),
        p(
            "Each validation file contains 65 complete daily records from 28 October through 31 December 2025. It uses the same variables and units as the training file and contains one row for every required prediction.",
            style_map["body"],
        ),
        p(
            "The validation file is released only after the group has submitted its frozen model plan. Apply the recorded model to these observations, calculate the required metrics, and save one prediction per <font name='Courier'>observation_id</font>.",
            style_map["note"],
        ),
        p("Interpretation boundaries", style_map["h1"]),
        ListFlowable(
            [
                ListItem(p("The data support association and prediction, not causal claims.", style_map["bullet"])),
                ListItem(p("The response is heating energy, not total building electricity use.", style_map["bullet"])),
                ListItem(p("Occupancy values are simulated counts and contain no personal information.", style_map["bullet"])),
                ListItem(p("A model that fits one synthetic building need not transfer to another.", style_map["bullet"])),
                ListItem(
                    p(
                        "Unusual observations should be investigated and included in a documented sensitivity analysis; do not delete them merely because they are inconvenient.",
                        style_map["bullet"],
                    )
                ),
            ],
            bulletType="bullet",
            leftIndent=17,
            bulletFontName="Helvetica",
            bulletFontSize=7,
            spaceAfter=4,
        ),
    ]

    doc.build(story, onFirstPage=footer, onLaterPages=footer)
    print(f"Built {path}")


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("output", type=Path)
    args = parser.parse_args()
    build(args.output)


if __name__ == "__main__":
    main()
