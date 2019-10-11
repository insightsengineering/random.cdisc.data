# random.cdisc.data

The `random.cdisc.data` is a package for creating random CDISC data. 
The random datasets available to create are:

 - Subject-Level Analysis Dataset (`radsl`)
 - Adverse Event Analysis Dataset (`radae`)
 - Time to Adverse Event Analysis Dataset (`radaette`)
 - Previous and Concomitant Medications Analysis Dataset (`radcm`)
 - Laboratory Data Analysis Dataset (`radlb`)
 - Medical History Analysis Dataset (`radmh`)
 - Questionnaires Analysis Dataset (`radqs`)
 - Time-to-Event Dataset (`radtte`)
 - Tumor Response Analysis Dataset (`radrs`)
 - Vital Signs Analysis Dataset (`radvs`)
 
  Please note to update cached data on changes to random data function via data/script.R

# Installation

```r
devtools::install_github(
  repo = "NEST/random.cdisc.data",
  host = "https://github.roche.com/api/v3",
  upgrade_dependencies = FALSE
)
```
