# Data

Only commit datasets that are public, openly licensed, or created for the course.

For project work, students should cite the data source and include enough information for the instructor to reproduce the analysis. Do not commit private, sensitive, or copyrighted datasets without permission.

## Week 9 Teaching Data

`week09-campus-energy-wide.csv` is a small synthetic teaching dataset created
for MATH 346. It represents monthly building-energy totals for six fictional
campus buildings. The wide monthly columns and two missing-value encodings are
intentional features of the import-and-tidy exercise; the file is not real
campus data and must not be presented as such.

## Week 10 Teaching Data

`week10-building-registry.csv` and `week10-service-events.csv` are synthetic
teaching tables for relational-data practice. The registry has one row per
fictional building. The event log deliberately contains inconsistent key case
and spacing, inconsistent issue and severity labels, repeated events for some
buildings, one event whose building is absent from the registry, and one
registered building with no event. The timestamps and response durations are
invented. Neither file contains observations from a real campus.
