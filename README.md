# random.cdisc.data 

The `random.cdisc.data` is a package for creating random cdisc data. 
The random datasets available to create are:

 - Subject-Level Analysis Dataset (radsl)
 - Adverse Event Analysis Dataset (radae)
 - Previous and Concomitant Medications Analysis Dataset (radcm)
 - Laboratory Data Analysis Dataset (radlb)
 - Questionnaires Analysis Dataset (radqs)
 - Time-to-Event Dataset (radtte)
 - Tumor Response Analysis Dataset (radrs)
 - Vital Signs Analysis Dataset (radvs)

# Installation

```r
devtools::install_github(
  repo = "Rpackages/random.cdisc.data",
  host = "https://github.roche.com/api/v3",
  upgrade_dependencies = FALSE
)
```


# TODO

* Update the `README.md` file - done

* Document the `radxx` functions - done 

* Use medra data for `adae` (in sysdat, see `aae` in `R/deprecated.R`)

* Create `radqs` (see `aqs` in `R/deprecated.R`) - done

* Create a web documentation with `pkgdown::build_site()` - done

* Make the lookup tables and other scoped data objects arguments of the functions


