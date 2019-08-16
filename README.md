# random.cdisc.data


The `random.cdisc.data` is a package for creating random CDISC data. 
The random datasets available to create are:

 - Subject-Level Analysis Dataset (`radsl`)
 - Adverse Event Analysis Dataset (`radae`)
 - Time to Adverse Event Analysis Dataset (`radaette`)
 - Previous and Concomitant Medications Analysis Dataset (`radcm`)
 - Laboratory Data Analysis Dataset (`radlb`)
 - Questionnaires Analysis Dataset (`radqs`)
 - Time-to-Event Dataset (`radtte`)
 - Tumor Response Analysis Dataset (`radrs`)
 - Vital Signs Analysis Dataset (`radvs`)

# Installation

```r
devtools::install_github(
  repo = "Rpackages/random.cdisc.data",
  host = "https://github.roche.com/api/v3",
  upgrade_dependencies = FALSE
)
```

# TODO

* Use MedDRA data for `adae` (in sysdat, see `aae` in `R/deprecated.R`)

* Make the lookup tables and other scoped data objects arguments of the functions

* Add date variables and associated analysis date/study day to all domains

* Ensure related variable and related record values maintain data integrity. Both within and across domains


