# random.cdisc.data

The `random.cdisc.data` is a package for creating random CDISC data.
The random datasets available to create are:

 - Subject-Level Analysis Dataset (`radsl`)
 - Adverse Event Analysis Dataset (`radae`)
 - Time to Adverse Event Analysis Dataset (`radaette`)
 - Previous and Concomitant Medications Analysis Dataset (`radcm`)
 - ECG Analysis Dataset (`radeg`)
 - Exposure Analysis Dataset (`radex`)
 - Laboratory Data Analysis Dataset (`radlb`)
 - Medical History Analysis Dataset (`radmh`)
 - Questionnaires Analysis Dataset (`radqs`)
 - Response Analysis Dataset (`radrs`)
 - Tumor Response Analysis Dataset (`radtr`)
 - Time-to-Event Dataset (`radtte`)
 - Vital Signs Analysis Dataset (`radvs`)
 - Subcategory Analysis Dataset (`radsub`)
 
  Please note that changes to random data functions requires rebuild of cached data. Please read the "Rebuilding Random CDISC Cached Data" article.

# Installation

Please refer to the quick start section in agile-R [here](https://go.roche.com/agile-R).

The latest version of `random.cdisc.data` can be installed locally with:

```r
devtools::install_github(
  repo = "NEST/random.cdisc.data",
  host = "https://github.roche.com/api/v3",
  upgrade_dependencies = FALSE
)
```
