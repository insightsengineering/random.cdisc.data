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

### Clone and install manually

1. Clone the repository

   The repository can be downloaded directly from the `github.com` site as an archive (see [Github tutorial on cloning to learn more](https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/cloning-a-repository-from-github/cloning-a-repository)).
Alternatively, Git command line tools offer the same functionality, without the need for manual downloading and unpacking the archive, but require to authenticate to Github. You can authenticate using a key pair or a Personal Access Token (PAT).
Please refer to excellent Github tutorials on [connecting to Github using SSH](https://docs.github.com/en/github/authenticating-to-github) or [creating and using PAT](https://docs.github.com/en/github/authenticating-to-github/keeping-your-account-and-data-secure/creating-a-personal-access-token).
   1. Using PAT. Input in the Git Bash console, PowerShell or any Linux shell:

      ```sh
      $ git clone https://github.com/insightsengineering/random.cdisc.data.git
      Username: your_username_goes_here
      Password: your_token_goes_here
      ```

   1. Using SSH. If set up properly, the repository is ready to be cloned executing:

       ```sh
       git clone https://github.com/insightsengineering/random.cdisc.data.git
       ```

   This creates a subdirectory `random.cdisc.data` containing the cloned repository.

2. Build and install

   The native R tools provide a quick way to install a package. Run in PowerShell or any Linux shell:

   ```sh
   R CMD build random.cdisc.data
   ```

   This command builds the package and creates an archive. The name of the archive is output by the command at then of building. Then input in the shell:

   ```sh
   Rscript -e 'install.packages("name_of_the_archive")
   ```

   Here is an example of a real command (with name_of_the_archive substituted by the output of the build command):

   ```sh
   $ Rscript -e 'install.packages("random.cdisc.data_0.9.5.9000.tar.gz")'


## Acknowledgment

This package is a result of a joint efforts by many developers and stakeholders. We would like to thank everyone who contributed so far!
