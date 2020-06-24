# random.cdisc.data 0.3.4.9000

* Added 11 variables to ADLB dataset: BNRIND, SHIFT1, ATOXGR, BTOXGR, WOS01FL, ANL01FL, WGRHIFL, WGRLOFL, WGRHIVFL, WGRLOVFL, ONTRTFL.

# random.cdisc.data 0.3.4

* Simple refactor for examples.

# random.cdisc.data 0.3.3

* Remove `test.nest` dependency.

# random.cdisc.data 0.3.2

* Added ADMH dataset.
* Renamed AREL column in ADAE to AEREL.

# random.cdisc.data 0.3.1

* Refactored after renaming functions in `utils.nest`.
* Added ADEX dataset.

# random.cdisc.data 0.3.0

* Columns classes configuration in `.yml` file.
* Added Medical History Analysis Dataset (`radmh`).
* Added missing columns based on Roche standards.
* Introduced missing values in random datasets generators (i.e. `r<name>`).
* Updating list of created columns in multiple datasets.
* Enhanced auto-testing.

# random.cdisc.data 0.2.1

* Added cached versions of the datasets `c<name>`.

# random.cdisc.data 0.2.0

* New consistent approach of creating random data for the different domains.
* Switch to new CDISC names (e.g. `ADSL` instead of `ASL`).
* Random dataset generators are:
    - Subject-Level Analysis Dataset (`radsl`).
    - Adverse Event Analysis Dataset (`radae`).
    - Time to Adverse Event Analysis Dataset (`radaette`).
    - Previous and Concomitant Medications Analysis Dataset (`radcm`).
    - Laboratory Data Analysis Dataset (`radlb`).
    - Questionnaires Analysis Dataset (`radqs`).
    - Time-to-Event Dataset (`radtte`).
    - Tumor Response Analysis Dataset (`radrs`).
    - Vital Signs Analysis Dataset (`radvs`).

# random.cdisc.data 0.1.0

* Initial release.
