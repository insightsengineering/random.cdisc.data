# Helper functions
#
flatten_list_of_deps <- function(updated_data, data_deps) {
  # Get higher deps fnc
  get_higher_deps <- function(cur_dep, data_deps) {
    sapply(seq_along(data_deps), function(x) {
      if (any(cur_dep %in% data_deps[[x]])) {
        names(data_deps)[x]
      }
    })
  }

  # Get lower deps fnc
  get_lower_deps <- function(cur_dep, data_deps) {
    data_deps[sapply(cur_dep, function(x) which(x == names(data_deps)))]
  }

  # Sort data_deps
  sort_data_deps <- function(upd_data, data_deps) {
    iup <- upd_data
    for (ud in upd_data) {
      up <- unlist(get_lower_deps(ud, data_deps))
      if (any(up %in% upd_data)) {
        iup <- unique(unlist(c(up[up %in% upd_data], iup)))
      }
    }
    iup
  }

  # Firstly, lets sort by dependencies the initial updated data
  fin_up <- sort_data_deps(updated_data, data_deps)

  # Extracting higher dependencies for each value
  cnt <- 1
  while (cnt <= length(fin_up)) {
    cur_deps <- unlist(
      get_higher_deps(fin_up[cnt], data_deps)
    )
    if (!is.null(cur_deps)) {
      cur_deps <- sort_data_deps(cur_deps, data_deps)
      fin_up <- unique(c(fin_up[seq_len(cnt)], cur_deps, fin_up[-seq_len(cnt)]))
    }
    cnt <- cnt + 1
  }

  fin_up
}


library(random.cdisc.data)
library(diffdf)
library(dplyr)

# Call function to match random number generation from previous R versions
RNGkind(sample.kind = "Rounding")

# Datasets must be listed after all of their dependencies
# e.g. adsl is a dependency for all other datasets so it is listed first.

pkg_dir <- dirname(getwd())
# Listing source files and extraction of datasets' names
src_files <- list.files(paste0(pkg_dir, "/R"))
data_nms <- src_files[grepl("^ra*", src_files)] %>%
  stringr::str_remove(pattern = "^r") %>%
  stringr::str_remove(pattern = ".R$") %>%
  sort()
# Exception handling
data_nms <- data_nms[data_nms != "adsaftte"] # Unbuilt for now

# Construction of dependency tree based on formals
data_deps <- sapply(
  data_nms,
  function(x) {
    dat_args <- names(formals(paste0("r", x)))
    dat_args[dat_args %in% data_nms]
  }
)

git_call <- "bash data-raw/git_diff_main.sh https://github.com/insightsengineering/random.cdisc.data/"
updated_files <- tryCatch(
  system(git_call, intern = TRUE),
  error = function(e) e
)
status_uf <- attr(updated_files, "status")
if (is(updated_files, "error") || (!is.null(status_uf) && status_uf == 1)) {
  message("Found following error in git call: ", git_call)
  message(e)
  message(
    "The calculation continues as default by recreating all datasets ",
    "and updating the cached data if any change is found."
  )
  updated_data <- data_nms
} else {
  updated_data <- updated_files[grepl("^R\\/", updated_files)] %>%
    stringr::str_remove("^R\\/") %>%
    stringr::str_remove(pattern = "^r") %>%
    stringr::str_remove(pattern = ".R$")
}

if (length(updated_data) != 0) {
  stopifnot(all(updated_data %in% names(data_deps)))

  data_to_update <- flatten_list_of_deps(updated_data, data_deps)
  default_args <- list(seed = 1, na_vars = list(), who_coding = TRUE, percent = 80, number = 2)

  # Generate and save updated cached datasets
  for (dat in data_to_update) {
    # Match arguments with defaults
    dat_args <- default_args[names(default_args) %in% names(formals(paste0("r", dat)))]

    # Get the data deps cache that is already there (if adsl returns list())
    dat_deps <- lapply(data_deps[[dat]], function(x) get(paste0("c", x)))

    # Main call to creation function
    cdataset <- do.call(paste0("r", dat), c(dat_args, dat_deps))

    # Preview differences
    cat("\nSaving cached data for dataset", paste0("*", dat, "*"), "with the following changes found (diffdf):\n")
    diff_test <- diffdf(get(paste0("c", dat)), cdataset)
    print(diff_test)

    # Check if there is any actual change to the data
    if (length(diff_test) > 0) { # If no difference -> list()
      # Save new cached dataset
      assign(paste0("c", dat), cdataset)
      fl_save <- paste0(dirname(getwd()), "/data/c", dat, ".RData")
      attr(cdataset, "creation date") <- lubridate::date() # This should NOT be updated if no changes in diffdf
      save(list = paste0("c", dat), file = fl_save, compress = "xz")
      cat("Cached dataset updated for", paste0("*", dat, "*"), "in", paste0("data/", basename(fl_save), "."), "\n")
    } else {
      message("No update detected on the final data. No cached data was updated for *", dat, "*.")
    }
  }
} else {
  message("No source files changed: no cached datasets currently require updates.")
}
