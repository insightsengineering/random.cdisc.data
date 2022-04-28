# random.cdisc.data 0.3.13.9001

### Bug fix
* Update all the NA and "" to "" in `ADAE$ANL01FL`.
* Updated `DVDECOD` and `DVSCAT` values in ADDV Dataset (`raddv`, `caddv`).

### Enhancements
* Enhanced `radpp` with additional default `PARAM`s.

# random.cdisc.data 0.3.13

### New features
* Added new random dataset generator: PK Analysis Dataset (`radpc`).
* Added new random dataset generator: PK Parameter Dataset (`radpp`).

### Enhancements
* Added new variables `AGEU`, `TRT01P`, `TRT01A` to `ADSL`.
* Added new variables `CMINDC`, `CMDOSE`, `CMTRT`, `CMDOSU`, `CMROUTE`, `CMDOSFRQ` to `ADCM`.
* Added `ANRLO` and `ANRHI` column to `ADLB` and `ADVS`.
* Added `AERELNST` column to `ADAE`.
* Added `MHDISTAT` column to `ADMH`.
* Enhanced `radpc` to add an argument to set the duration in number of days.

### Bug fix
* Fixed a typo in `ADSL$BMRKR1`'s label.

### Miscellaneous
* Updated R version requirement to >= 3.6.
* Removed deprecated package `utils.nest` from imports and now use `checkmate` for validation functions.
* Removed deprecated dependency `test.nest`.

# random.cdisc.data 0.3.12

### Enhancements
* Added `EOTSTT` variable to ADSL dataset.
* Enabled users to define mean analysis value for each lab test in `radlb` with new argument `aval_mean`.
* Added `AERELNST` and `AEACNOTH` variables to ADAE dataset.

### Miscellaneous
* Updated `LICENCE` and `README` with new package references.
* Corrected the `EVNTDESC` and `CNSR` variable values for the "Overall Survival parameter" in ADTTE dataset.
* Fixed typo in label for `BASE2` variable in ADQS dataset.
* Added `error_on_lint: TRUE` to `.lintr`.

# random.cdisc.data 0.3.11

### Enhancements
* Added `AECONTRT` variable to ADAE dataset.
* Added new parameters in ADAETTE dataset.
* Added new parameters in ADHY dataset.
* Added period variables `APERIOD` and `APERIODC` to ADHY dataset.

# random.cdisc.data 0.3.10
* Added additional parameters to ADHY data.
* Fix bug to make internal helper `rel_var` work with `tibbles`.
* Added new random dataset generator: Hys Law Analysis Dataset (`radhy`) .
* Updated the sampling of `TRTSDTM` in `radsl` to be more efficient.

# random.cdisc.data 0.3.9
* Fix warnings of binding factors to characters.

# random.cdisc.data 0.3.8
* Four variables `ATC1CD`, `ATC2CD`, `ATC3CD`, `ATC4CD` have been added to ADCM data.
* ADAETTE data set generation via `radaette()` has been enhanced:
  - `lookup` argument now takes the parameters `CATCD` and `CAT` instead of `PARAMCD` and `PARAM`.
    `CATCD` specifies the code to be used for study specific treatment emergent adverse events (e.g. "1")
    and `CAT` specifies the corresponding text (e.g. "any adverse event").
  - The resulting data set contains now the number of total occurrences per patient of each specific
    AE category (`PARAMCD` starting with `AETOT` and ending with `CATCD`), in addition to the already
    available time to first occurrence (`PARAMCD` starting with `AETTE` and ending with `CATCD`).
  - An additional parameter included is `AEREPTTE`, the time to end of the AE reporting period.
  - Generation of the time to and number of adverse events now is conditional on the censoring information,
    i.e. it is no longer possible to have a situation where the patient is censored but the time to first AE
    is larger than the AE reporting period.
* Updated examples to not use `cached = TRUE`.
* Added ADSUB dataset.

# random.cdisc.data 0.3.7

* ADVS data set was updated. Two additional parameters were included: BNRIND and ONTRTFL.
* ADTTE data set was updated. There is a new parameter in this data set: "PARAM == Duration of Confirmed Response".

# random.cdisc.data 0.3.6

* Fixed `radsl` where `N < 4`.

# random.cdisc.data 0.3.5

* Added ADTR dataset from osprey.
* Added 10 variables to ADAE dataset: AEOUT, AEACN, AESDTH, TRTEMFL, ANL01FL, SMQ01NAM, SMQ02NAM, SMQ01SC, SMQ02SC, CQ01NAM.
* Added WORS02FL (Worst Post-Baseline Observation) to ADEG dataset.
* Added ADEG dataset.
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
