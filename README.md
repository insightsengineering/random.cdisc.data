# this is a very early draft with functions for creating random cdisc data

# Installation

```r
devtools::install_github(
  repo = "Rpackages/random.cdisc.data",
  host = "https://github.roche.com/api/v3",
  upgrade_dependencies = FALSE
)
```


# TODO

* Update the `README.md` file

* Document the `radxx` functions

* Use medra data for `adae` (in sysdat, see `aae` in `R/deprecated.R`)

* Create `radqs` (see `aqs` in `R/deprecated.R`)

* Create a web documentation with `pkgdown::build_site()`

* Make the lookup tables and other scoped data objects arguments of the functions


