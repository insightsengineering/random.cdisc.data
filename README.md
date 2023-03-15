# random.cdisc.data

<!-- start badges -->
[![Check 🛠](https://github.com/insightsengineering/random.cdisc.data/actions/workflows/check.yaml/badge.svg)](https://github.com/insightsengineering/random.cdisc.data/actions/workflows/check.yaml)
[![Docs 📚](https://github.com/insightsengineering/random.cdisc.data/actions/workflows/docs.yaml/badge.svg)](https://insightsengineering.github.io/random.cdisc.data/)
[![Code Coverage 📔](https://raw.githubusercontent.com/insightsengineering/random.cdisc.data/_xml_coverage_reports/data/main/badge.svg)](https://raw.githubusercontent.com/insightsengineering/random.cdisc.data/_xml_coverage_reports/data/main/coverage.xml)

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

- Subject-Level Analysis Dataset (`radsl`)
- Adverse Event Analysis Dataset (`radae`)
- Time to Adverse Event Analysis Dataset (`radaette`)
- Previous and Concomitant Medications Analysis Dataset (`radcm`)
- ECG Analysis Dataset (`radeg`)
- Exposure Analysis Dataset (`radex`)
- Laboratory Data Analysis Dataset (`radlb`)
- Medical History Analysis Dataset (`radmh`)
- PK Analysis Dataset (`radpc`)
- Questionnaires Analysis Dataset (`radqs`)
- Response Analysis Dataset (`radrs`)
- Tumor Response Analysis Dataset (`radtr`)
- Time-to-Event Dataset (`radtte`)
- Vital Signs Analysis Dataset (`radvs`)
- Subcategory Analysis Dataset (`radsub`)
- Anti-drug Antibody Analysis Dataset (`radab`)
- Pharmacokinetics Parameters Analysis Dataset (`radpp`)

Please note that changes to random data functions requires rebuild of cached data. Please read the "Rebuilding Random CDISC Cached Data" article.

## Installation

For releases from August 2022 it is recommended that you [create and use a Github PAT](https://docs.github.com/en/github/authenticating-to-github/keeping-your-account-and-data-secure/creating-a-personal-access-token) to install the latest version of this package. Once you have the PAT, run the following:

```r
Sys.setenv(GITHUB_PAT = "your_access_token_here")
if (!require("remotes")) install.packages("remotes")
remotes::install_github("insightsengineering/random.cdisc.data@*release")
```

A stable release of all `NEST` packages from June 2022 is also available [here](https://github.com/insightsengineering/depository#readme).

## Acknowledgment

This package is a result of a joint efforts by many developers and stakeholders. We would like to thank everyone who contributed so far!

## Stargazers and Forkers

### Stargazers over time

[![Stargazers over time](https://starchart.cc/insightsengineering/random.cdisc.data.svg)](https://starchart.cc/insightsengineering/random.cdisc.data)

### Stargazers

[![Stargazers repo roster for @insightsengineering/random.cdisc.data](https://reporoster.com/stars/insightsengineering/random.cdisc.data)](https://github.com/insightsengineering/random.cdisc.data/stargazers)

### Forkers

[![Forkers repo roster for @insightsengineering/random.cdisc.data](https://reporoster.com/forks/insightsengineering/random.cdisc.data)](https://github.com/insightsengineering/random.cdisc.data/network/members)
