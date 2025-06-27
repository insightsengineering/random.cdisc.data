# random.cdisc.data

<!-- start badges -->
[![Check 🛠](https://github.com/insightsengineering/random.cdisc.data/actions/workflows/check.yaml/badge.svg)](https://insightsengineering.github.io/random.cdisc.data/main/unit-test-report/)
[![Docs 📚](https://github.com/insightsengineering/random.cdisc.data/actions/workflows/docs.yaml/badge.svg)](https://insightsengineering.github.io/random.cdisc.data/)
[![Code Coverage 📔](https://raw.githubusercontent.com/insightsengineering/random.cdisc.data/_xml_coverage_reports/data/main/badge.svg)](https://insightsengineering.github.io/random.cdisc.data/main/coverage-report/)

![GitHub forks](https://img.shields.io/github/forks/insightsengineering/random.cdisc.data?style=social)
![GitHub Repo stars](https://img.shields.io/github/stars/insightsengineering/random.cdisc.data?style=social)

![GitHub commit activity](https://img.shields.io/github/commit-activity/m/insightsengineering/random.cdisc.data)
![GitHub contributors](https://img.shields.io/github/contributors/insightsengineering/random.cdisc.data)
![GitHub last commit](https://img.shields.io/github/last-commit/insightsengineering/random.cdisc.data)
![GitHub pull requests](https://img.shields.io/github/issues-pr/insightsengineering/random.cdisc.data)
![GitHub repo size](https://img.shields.io/github/repo-size/insightsengineering/random.cdisc.data)
![GitHub language count](https://img.shields.io/github/languages/count/insightsengineering/random.cdisc.data)
[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![Current Version](https://img.shields.io/github/r-package/v/insightsengineering/random.cdisc.data/main?color=purple\&label=package%20version)](https://github.com/insightsengineering/random.cdisc.data/tree/main)
[![Open Issues](https://img.shields.io/github/issues-raw/insightsengineering/random.cdisc.data?color=red\&label=open%20issues)](https://github.com/insightsengineering/random.cdisc.data/issues?q=is%3Aissue+is%3Aopen+sort%3Aupdated-desc)
<!-- end badges -->

The `random.cdisc.data` is a package for creating random CDISC data.
The random datasets available to create are:

- `radsl`: Subject-Level Analysis Dataset (ADSL)
- `radab`: Anti-Drug Antibody Analysis Dataset (ADAB)
- `radae`: Adverse Event Analysis Dataset (ADAE)
- `radaette`: Time to Adverse Event Analysis Dataset (ADAETTE)
- `radcm`: Previous and Concomitant Medications Analysis Dataset (ADCM)
- `raddv`: Protocol Deviations Analysis Dataset (ADDV)
- `radeg`: ECG Analysis Dataset (ADEG)
- `radex`: Exposure Analysis Dataset (ADEX)
- `radhy`: Hys Law Analysis Dataset (ADHY)
- `radlb`: Laboratory Data Analysis Dataset (ADLB)
- `radmh`: Medical History Analysis Dataset (ADMH)
- `radpc`: Pharmacokinetics Analysis Dataset (ADPC)
- `radpp`: Pharmacokinetics Parameters Dataset (ADPP)
- `radqlqc`: EORTC QLQ-C30 V3 Analysis Dataset (ADQLQC)
- `radqs`: Questionnaires Analysis Dataset (ADQS)
- `radrs`: Response Analysis Dataset (ADRS)
- `radsaftte`: Time to Safety Event Analysis Dataset (ADSAFTTE, wrapper of `radaette`)
- `radsub`: Subcategory Analysis Dataset (ADSUB)
- `radtr`: Tumor Response Analysis Dataset (ADTR)
- `radtte`: Time-to-Event Dataset (ADTTE)
- `radvs`: Vital Signs Analysis Dataset (ADVS)

Please note that changes to random data functions requires rebuild of cached data. Please read the "Rebuilding Random CDISC Cached Data" article.

## Installation

```r
install.packages("random.cdisc.data")
```

Alternatively, you might also use the development version.


```r
# install.packages("pak")
pak::pak("insightsengineering/random.cdisc.data")
```

## Acknowledgment

This package is a result of a joint efforts by many developers and stakeholders. We would like to thank everyone who contributed so far!

## Stargazers and Forkers

### Stargazers over time

[![Stargazers over time](https://starchart.cc/insightsengineering/random.cdisc.data.svg)](https://starchart.cc/insightsengineering/random.cdisc.data)

### Stargazers

[![Stargazers repo roster for @insightsengineering/random.cdisc.data](https://reporoster.com/stars/insightsengineering/random.cdisc.data)](https://github.com/insightsengineering/random.cdisc.data/stargazers)

### Forkers

[![Forkers repo roster for @insightsengineering/random.cdisc.data](https://reporoster.com/forks/insightsengineering/random.cdisc.data)](https://github.com/insightsengineering/random.cdisc.data/network/members)
