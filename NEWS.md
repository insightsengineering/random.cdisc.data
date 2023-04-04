# random.cdisc.data 0.3.13.9056

### New features
* Added new random dataset generator: Anti-Drug Antibody Analysis Dataset (`radab`).

### Bug fixes
* Updated all the `ANL01FL` `NA` values to `""` in `adae`.
* Updated `DVDECOD` and `DVSCAT` values in `addv`.
* Fixed `adtm` calculations so that records with same `AVISIT` have the same `ADTM` for each patient.
* Fixed checks for `na_percentage` argument that is in most datasets.
* Updated package for breaking changes in `tidyselect`.

### Enhancements
* Added variables `ASTDY`, `AENDY`, `EXDOSFRQ`, `EXROUTE`, `VISIT`, `VISITDY`, `EXSTDTC`, `EXENDTC`, `EXSTDY`, 
  `EXENDY`, `TRTSDT`, and `TRTEDT` to `adex`.
* Added more default `PARAM`s and new variables `PPSTINT`, `PPENINT`, `REGIMEN`, and `PKARMCD` to `adpp`.
* Added `TNE` to `PARAMCD`, `Total Number of Exacerbations` to `PARAM`, and new variable `lgTMATRSK` to `adtte`.
* Added more default `PARAM`s and post-baseline visits to `adab` and enhanced variables `ADAPBLFL`, `ABLFL`,
  `ADABLFL`, `PARCAT1`, and `RELTMU`.
* Added variables `AEWITHFL` and `ADTHAUT` to `adsl`.
* Added variable `ATIREL` to `admh`.
* Added variables `CMSTRTPT`, `CMENRTPT`, `ADURN`, and `ADURU` to `adcm`.
* Added variables `AESCONG`, `AESDISAB`, `AESHOSP`, `AESLIFE`, `AESMIE`, and `LDOSEDTM` to `adae`.
* Added parameter `with_trt02` to `radsl` to make the second treatment period available. When `with_trt02 = TRUE` 
  (default), add variables `TRT02A`, `TRT02P`, `TRT02SDTM`, `TRT02EDTM`, `AP02SDTM`, `AP02EDTM`, `TRT01SDTM`, 
  `TRT01EDTM`, `AP01SDTM`, and `AP01EDTM` to `adsl`, and set `TRTSDTM` as `TRT01SDTM`, `TRTEDTM` as `TRT02EDTM`.
* Added variable `LDRELTM` to `adae`.
* Aligned logic for `ADTM`, `ADY`, and `ONTRTFL` variables with `AVISIT` where applicable within `adeg`, `adlb`, 
  `adqs`, `adsub`, `adtr`, and `advs`.
* Made `AVAL` values more realistic and updated derivations of `ANRIND`, `*STRESC`, and `LOQFL` to depend on value 
  of `PARAMCD` in `adlb` and `advs`.
* Added tests to increase package test coverage.
* Added "datetime" and "date" as valid variable types to apply in `apply_metadata`.
* Implemented the `lubridate` package in all date/datetime variable derivations.

### Miscellaneous
* Updated installation method and aligned with other packages.
* Updated tests to use `testthat` 3rd edition and added snapshot testing for random rows.
* Implemented `lifecycle` package with stable badge for exported functions, and tagged internal functions.
* Combined ADQLQC helper functions into the same documentation file.
* Improved usability of examples.
* Renamed `random.cdisc.data.R` file to `package.R` and cleaned up contents.
* Added more detailed documentation for function parameters.
* Converted all dataset names to lowercase/snake case for consistency with other NEST packages.

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
* Updated required R version to >= 3.6.
* Removed deprecated package `utils.nest` from imports and now use `checkmate` for validation functions.
* Removed deprecated dependency `test.nest`.

# random.cdisc.data 0.3.12

### Enhancements
* Added `EOTSTT` variable to ADSL dataset.
* Enabled users to define mean analysis value for each lab test in `radlb` with new argument `aval_mean`.
* Added `AERELNST` and `AEACNOTH` variables to ADAE dataset.

### Miscellaneous
* Updated `LICENCE` and `README` with new package references.
* Corrected the `EVNTDESC` and `CNSR` variable values for the "OS" parameter in ADTTE dataset.
* Fixed typo in label for `BASE2` variable in ADQS dataset.
* Added `error_on_lint: TRUE` to `.lintr`.

# random.cdisc.data 0.3.11

### Enhancements
* Added `AECONTRT` variable to ADAE dataset.
* Added new parameters in ADAETTE dataset.
* Added new parameters in ADHY dataset.
* Added period variables `APERIOD` and `APERIODC` to ADHY dataset.

# random.cdisc.data 0.3.10
* Added parameters to ADHY data.
* Fix bug to make internal helper `rel_var` work with `tibbles`.
* Added new random dataset generator: Hys Law Analysis Dataset (`radhy`) .
* Updated the sampling of `TRTSDTM` in `radsl` to be more efficient.

# random.cdisc.data 0.3.9
* Fix warnings of binding factors to characters.

# random.cdisc.data 0.3.8
* Added variables `ATC1CD`, `ATC2CD`, `ATC3CD`, and `ATC4CD` to ADCM data.
* Enhanced ADAETTE data set generation via `radaette()`:
  - `lookup` argument now takes the parameters `CATCD` and `CAT` instead of `PARAMCD` and `PARAM`.
    `CATCD` specifies the code for study specific treatment emergent adverse events (e.g. "1")
    and `CAT` specifies the corresponding text (e.g. "any adverse event").
  - The resulting data set contains now the number of total occurrences per patient of each specific
    AE category (`PARAMCD` starting with `AETOT` and ending with `CATCD`).
  - Added parameter `AEREPTTE`, the time to end of the AE reporting period.
  - Generation of the time to and number of adverse events now is conditional on the censoring information,
    i.e. no longer possible to have a situation with patient censored but time to first AE larger than the AE reporting period.
* Updated examples to not use `cached = TRUE`.
* Added ADSUB dataset.

# random.cdisc.data 0.3.7

* Added parameters BNRIND and ONTRTFL to ADVS data set.
* Added new parameter "Duration of Confirmed Response" to ADTTE data set.

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
* Updated lists of dataset columns.
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
