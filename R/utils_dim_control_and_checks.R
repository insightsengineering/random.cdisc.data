# Dimension control and df checks ----------------------------------------------

#' Reduce number of levels in a column of a `data.frame`
#'
#' @description `r lifecycle::badge("experimental")`
#'
#' Use this function to reduce the number of levels in a `data.frame` column called `variable`.
#' This function calculates the frequency distribution of levels and sets either a soft threshold
#' based on the probability cut-off (`p_to_keep`) and/or an hard threshold (`num_max_values`).
#' Consider checking the number of unique values in each pivotal data column with [describe_cols()].
#'
#' @param df (`data.frame`)\cr data.frame with too many levels for a `variable`.
#' @param variable (`character(1)`)\cr string with the name of the column to be reduced.
#' @param p_to_keep (`numeric(1)`)\cr probability cut-off to keep the most frequent levels. If `num_max_values` is
#'   specified (i.e. not `NULL`) this is not used.
#' @param num_max_values (`integer(1)`)\cr maximum number of levels to keep. This encompasses only
#'   rare values (`num_of_rare_values`) but not additional desired values (`add_specific_value`)
#'   and rows (`keep_spec_rows`).
#' @param num_of_rare_values (`integer(1)`)\cr number of additional rare values to keep. These are selected
#'   from the least frequent levels.
#' @param add_specific_value (`character`)\cr specific values to keep.
#' @param keep_spec_rows (`integer`)\cr specific rows to keep.
#' @param explorative (`logical(1)`)\cr if `TRUE`, a plot with the frequency distribution of levels is shown.
#' @param verbose (`logical(1)`)\cr if `TRUE`, messages are printed.
#'
#' @details
#' If necessary, a number of additional rare values can be picked from the least represented levels
#' (`num_of_rare_values`). For general use it is also possible to keep certain values
#' (`add_specific_value`) and rows (`keep_spec_rows`). Exploratory plots can be also appreciated with
#' `explorative = TRUE`.
#'
#' @return A modified `data.frame` or a plot if `explorative = TRUE`.
#'
#' @examples
#' # real case scenario: trimming of variables with too many levels
#' random.cdisc.data::cadae %>%
#'   reduce_num_levels_in_df(adae_pharmaverse, "AEDECOD",
#'     num_max_values = 7, num_of_rare_values = 1,
#'     add_specific_value = c(
#'       "VOMITING", "NAUSEA", "SKIN IRRITATION", "HEADACHE", # For SMQ01NAM, SMQ02NAM, CQ01NAM
#'       "MYOCARDIAL INFARCTION" # for aet07 AESDTH == "Y"
#'     )
#'   )
#'
#' @export
reduce_num_levels_in_df <- function(df,
                                    variable,
                                    p_to_keep = 0.7,
                                    num_max_values = NULL,
                                    num_of_rare_values = 0,
                                    add_specific_value = NULL,
                                    keep_spec_rows = NULL,
                                    explorative = FALSE,
                                    verbose = TRUE) {
  checkmate::assert_number(p_to_keep, lower = 0, upper = 1)
  checkmate::assert_data_frame(df)
  checkmate::assert_string(variable)
  checkmate::assert_character(add_specific_value, null.ok = TRUE)
  checkmate::assert_choice(variable, names(df))
  checkmate::assert_integerish(keep_spec_rows,
    null.ok = TRUE,
    lower = 1, upper = nrow(df), unique = TRUE
  )
  checkmate::assert_flag(explorative)
  checkmate::assert_flag(verbose)
  cur_vec <- df[[variable]]

  if (is.factor(cur_vec)) {
    cur_vec <- as.character(cur_vec)
  }

  lev_freq <- sort(table(cur_vec), decreasing = TRUE)

  # Explorative plot
  if (explorative) {
    require(ggplot2)
    plot_tbl <- tibble(
      level = names(lev_freq),
      freq = lev_freq
    ) %>%
      arrange(desc(freq)) %>%
      mutate(level = factor(level, levels = level))

    how_many_to_plot <- min(10, nrow(plot_tbl))
    spacing <- round(nrow(plot_tbl) / how_many_to_plot)
    gg <- ggplot(plot_tbl) +
      geom_col(aes(x = level, y = freq), width = 1) +
      theme_classic() +
      labs(title = paste0("Frequency of levels in ", variable), x = "Level", y = "Frequency") +
      scale_x_discrete(
        breaks = plot_tbl$level[seq(1, nrow(plot_tbl), by = spacing)],
        labels = seq(1, nrow(plot_tbl))[seq(1, nrow(plot_tbl), by = spacing)]
      )

    # Adding % annotation
    annot_x <- tail(plot_tbl$level[cumsum(plot_tbl$freq) <= sum(plot_tbl$freq) * p_to_keep], 1)
    annot_y <- 0.9 * max(plot_tbl$freq)
    annot_label <- paste0(
      "Desired: ", round(p_to_keep * 100, 1), "%",
      "\n", "Levels to keep: ", sum(cumsum(plot_tbl$freq) <= sum(plot_tbl$freq) * p_to_keep)
    )
    gg <- gg + geom_vline(aes(xintercept = tail(level[cumsum(freq) <= sum(freq) * p_to_keep], 1)), color = "red") +
      annotate("text", x = annot_x, y = annot_y, label = annot_label, vjust = 0, hjust = 0)

    if (!is.null(num_max_values)) {
      annot_x <- num_max_values - num_of_rare_values
      annot_y <- 0.5 * max(plot_tbl$freq)
      annot_label <- paste0(
        "Desired: ", num_max_values - num_of_rare_values,
        "\n Kept: ",
        round(sum(plot_tbl$freq[seq(1, num_max_values - num_of_rare_values)]) * 100 / sum(plot_tbl$freq), 1),
        "%"
      )
      gg <- gg + geom_vline(aes(xintercept = num_max_values - num_of_rare_values), color = "blue") +
        annotate("text", x = annot_x, y = annot_y, label = annot_label, vjust = 0, hjust = 0)
    }

    if (!is.null(add_specific_value)) {
      xint <- which(plot_tbl$level %in% add_specific_value)
      annot_x <- tail(which(plot_tbl$level %in% add_specific_value), 1)
      annot_y <- 0.1 * max(plot_tbl$freq)
      if (length(add_specific_value) == 1L) {
        annot_label <- paste0(
          "Specific value: ", add_specific_value,
          "\nAdded freq: ",
          round(plot_tbl$freq[which(plot_tbl$level == add_specific_value)] * 100 / sum(plot_tbl$freq), 1),
          "%\n",
          "Rank: ", which(plot_tbl$level == add_specific_value)
        )
      } else {
        xint <- max(xint)
        annot_label <- paste0(
          "Num spec values: ", length(add_specific_value),
          "\nAdded freq: ",
          round(sum(plot_tbl$freq[which(plot_tbl$level %in% add_specific_value)]) * 100 / sum(plot_tbl$freq), 1),
          "%\n",
          "Max rank: ", max(which(plot_tbl$level %in% add_specific_value))
        )
      }
      gg <- gg +
        geom_vline(aes(xintercept = xint), color = "black") +
        annotate("text", x = annot_x, y = annot_y, label = annot_label, vjust = 0, hjust = 0)
    }

    return(gg)

    #  Effective calculations
  }
  checkmate::assert_int(num_of_rare_values, lower = 0, upper = length(lev_freq))
  checkmate::assert_int(num_max_values, lower = num_of_rare_values, upper = length(lev_freq), null.ok = TRUE)

  if (!is.null(num_max_values)) {
    lev_to_keep <- names(lev_freq)[seq(1, num_max_values - num_of_rare_values)]

    if (num_of_rare_values > 0) {
      lev_to_keep <- c(
        lev_to_keep,
        names(lev_freq)[seq(length(lev_freq) - num_of_rare_values + 1, length(lev_freq))]
      )
    }
  } else {
    cum_freq <- cumsum(lev_freq) / sum(lev_freq)
    if (p_to_keep < min(cum_freq)) {
      stop(paste0("p_to_keep is too low. The minimum value of p_to_keep is ", round(min(cum_freq), 3)))
    }
    lev_to_keep <- names(lev_freq)[cum_freq <= p_to_keep]
  }

  if (!is.null(add_specific_value)) {
    checkmate::assert_subset(add_specific_value, names(lev_freq))
    lev_to_keep <- unique(c(lev_to_keep, add_specific_value))
  }
  out <- df %>% filter(!!sym(variable) %in% lev_to_keep)

  if (!is.null(keep_spec_rows)) {
    lev_new_rows <- cur_vec[keep_spec_rows]
    what_is_new_row <- which(!lev_new_rows %in% lev_to_keep)
    lev_new_rows <- lev_new_rows[what_is_new_row]
    keep_spec_rows <- keep_spec_rows[what_is_new_row]

    if (length(keep_spec_rows) > 0) {
      out <- rbind(out, df %>% slice(keep_spec_rows))
    }
  }

  if (verbose) {
    if (length(keep_spec_rows) > 0) {
      core_msg <- paste0(
        length(lev_to_keep), " + ", length(keep_spec_rows), " (from keep_spec_rows) levels out of ",
        length(lev_freq), " levels. Total rows kept (%): ",
        round((sum(lev_freq[lev_to_keep]) + length(keep_spec_rows)) * 100 / sum(lev_freq), 1)
      )
    } else {
      core_msg <- paste0(
        length(lev_to_keep), " levels out of ", length(lev_freq), " levels. Total rows kept (%): ",
        round(sum(lev_freq[lev_to_keep]) * 100 / sum(lev_freq), 1)
      )
    }
    msg <- paste0(
      "Reducing levels of ", deparse(substitute(df)), " for variable ",
      variable, ": keeping ", core_msg
    )
    message(msg)
  }

  # Simple check of filtering
  stopifnot(nrow(out) == sum(cur_vec %in% lev_to_keep) + length(keep_spec_rows))

  # We want a factor anyway (drop unused levels)
  out <- out %>%
    mutate(!!sym(variable) := factor(!!sym(variable)))

  invisible(out)
}


# Descriptive tools ------------------------------------------------------------
#' Describe columns of a data frame
#'
#' @description
#' This function uses some simple descriptor to describe the columns of a data frame. It is an indicative
#' function and it is not intended to be used for a full description or analysis of the data.
#'
#' @param df (`data.frame`)\cr Data like `random.cdisc.data::cadae`.
#' @param additional_checks (named `list` of functions)\cr List of functions that take in input a column
#'   and return a vector of logicals. List names are used as column names for the returning `tibble`. Needs
#'   to have at least a `"column"` parameter. See [check_long_strings()] for an example.
#' @param max_desc_length (`integer(1)`)\cr Maximum length of the description of any column name. You can retrieve this
#'   attribute using [formatters::var_labels()] on the data. `NA` is returned when absent.
#' @param column (`character`)\cr Column to describe. If using a custom function, please consider how to handle
#'   all types and missing values (`NA`).
#' @param max_length (`integer(1)`)\cr Maximum length of a string.
#' @param special_chr (`character(1)`)\cr Regular expression to detect special characters.
#'
#' @return A `tibble` with the following columns:
#' \itemize{
#'  \item `col.name`: column name. We do not expect this code name to be longer than 5 - 10 characters.
#'  \item `desc`: description of the column (output of [formatters::var_labels()]).
#'  \item `long_desc`: `TRUE` if `desc` is longer than 80 characters. Use `max_desc_length` to change this variable.
#'  \item `nrows`: number of elements or rows (useful when having multiple data to compare).
#'  \item `type`: type of the column.
#'  \item `is_numeric`: logical indicating if the column is numeric.
#'  \item `n_na`: number of missing values.
#'  \item `n_empty`: number of empty strings.
#'  \item `n_unique`: number of unique values (everything is casted as factor).
#'  \item `n_levels`: number of levels (if factor) or number of unique values (if character).
#'  \item `n_empty_levels`: number of empty levels if > 0. If it is -1 the column is a factor that
#'    contains some missing values (`NA`).
#'  \item `additional_checks` list names: output of additional checks functions.
#'  \item `mean`: mean of the column (if numeric).
#'  \item `sd`: standard deviation of the column (if numeric).
#'  \item `quartiles`: quartiles of the column (if numeric).
#' }
#'
#' @seealso [reduce_num_levels_in_df()] for how to reduce pivotal values when `n_unique` is too high.
#'
#' @examples
#' # Describe columns of a data frame
#' describe_cols(random.cdisc.data::cadae)
#'
#' adae <- random.cdisc.data::cadae
#' adae$STUDYID[1] <- "missing" # We search for this string
#' adae$USUBJID[2] <- paste0(rep("a", 40), collapse = "_") # Too long for us!!
#'
#' # Let's add one custom check function (additional_checks param)
#' check_spec_missing_str <- function(column, missing_str) {
#'   # We want characters
#'   column <- as.character(column)
#'   # We do not want NAs (already taken into account before)
#'   if (anyNA(column)) {
#'     column[is.na(column)] <- "NA"
#'   }
#'   # Checking if it is "missing"
#'   if (is.character(column)) {
#'     return(column == missing_str)
#'   } else {
#'     return(0) # not applicable (e.g. is numeric)
#'   }
#' }
#'
#' # Our description function
#' out <- describe_cols(
#'   adae,
#'   additional_checks = list(
#'     "very_long" = check_long_strings,
#'     "n_missing" = check_spec_missing_str
#'   ),
#'   extra_args = list( # extra arguments for our additional_checks functions
#'     "max_length" = 70,
#'     "missing_str" = "missing"
#'   )
#' )
#' out[out$n_missing > 0, ] # STUDYID has 1 "missing" value
#' out[out$very_long > 0, ] # USUBJID has 1 long string
#'
#' @export
describe_cols <- function(df,
                          additional_checks = list(
                            "too_long" = check_long_strings,
                            "special_chars" = check_special_chars
                          ),
                          extra_args = list(max_length = 80, special_chr = "outlier"),
                          max_desc_length = 80) {
  checkmate::assert_data_frame(df)
  checkmate::assert_list(additional_checks, any.missing = FALSE)
  checkmate::assert_list(extra_args, unique = TRUE)
  checkmate::assert_int(max_desc_length, lower = 1, upper = 500)

  if (is.null(names(additional_checks))) {
    names(additional_checks) <- paste0("check_", seq_along(additional_checks))
  }

  # Values of columns
  var_lb <- formatters::var_labels(df)
  lb_tb <- tibble::tibble(
    col.name = names(var_lb),
    desc = as.character(var_lb),
    long_desc = nchar(desc) > max_desc_length
  )

  # main descriptor
  lb_tb2 <- dplyr::bind_cols(lb_tb,
    "nrows" = nrow(df),
    "type" = df %>% dplyr::summarise_all(~ class(.)[1]) %>% t() %>% c(),
    "is_numeric" = df %>% dplyr::summarise_all(~ is.numeric(.)) %>% t() %>% c(),
    "n_na" = df %>% dplyr::summarise_all(~ sum(is.na(.))) %>% t() %>% c(),
    "n_empty" = df %>% dplyr::summarise_all(~ sum(is_empty_string(.))) %>% t() %>% c(),
    "n_unique" = df %>% dplyr::summarise_all(~ length(unique(as.character(.)))) %>% t() %>% c(),
    "n_levels" = df %>% dplyr::summarise_all(~ {
      ifelse(is.factor(.), length(levels(.)), length(unique(.)))
    }) %>% t() %>% c()
  ) %>% dplyr::mutate(
    "n_empty_levels" = n_levels - n_unique # 0 if character, -1 if NAs are present
  )

  # Adding custom checks
  for (custom_function_i in seq_along(additional_checks)) {
    col_fun_name <- names(additional_checks)[custom_function_i]
    lb_tb2 <- dplyr::bind_cols(
      lb_tb2,
      "very_tmp_name" = df %>% dplyr::summarise_all(~ {
        col <- .
        cur_fun <- additional_checks[[custom_function_i]]

        cur_extra_args <- as.list(args(cur_fun))
        drop_empty_params <- names(cur_extra_args) == ""
        cur_extra_args <- cur_extra_args[!drop_empty_params]
        if (names(cur_extra_args)[1] != "column") {
          stop("The first element of additional_checks must have a column parameter.")
        }
        cur_extra_args$column <- col
        param_overload <- names(cur_extra_args) %in% names(extra_args)

        if (any(param_overload)) {
          cur_extra_args[param_overload] <- extra_args[names(cur_extra_args)[param_overload]]
        }

        sum(do.call(cur_fun, args = cur_extra_args))
      }) |> t() |> c()
    )
    lb_tb2 <- dplyr::rename(lb_tb2, !!col_fun_name := very_tmp_name)
  }

  if (any(lb_tb2$is_numeric)) {
    lb_tb2 <- dplyr::mutate(lb_tb2,
      "mean" = NA_real_,
      "sd" = NA_real_,
      "quantile" = NA_real_
    )
    # for numeric
    lb_tb2$mean[lb_tb2$is_numeric] <- apply(df[, lb_tb2$is_numeric], 2, function(i) {
      mean(i, na.rm = TRUE)
    })
    lb_tb2$sd[lb_tb2$is_numeric] <- apply(df[, lb_tb2$is_numeric], 2, function(i) {
      sd(i, na.rm = TRUE)
    })
    lb_tb2$quantile[lb_tb2$is_numeric] <- apply(df[, lb_tb2$is_numeric], 2, function(i) {
      as.list(quantile(i, na.rm = TRUE))
    })
  }

  # return
  return(lb_tb2)
}

# Any element of column is an empty string? columns are vectors
#' @rdname describe_cols
#' @export
is_empty_string <- function(column) {
  if (anyNA(column)) {
    column[is.na(column)] <- "NA"
  }
  return(as.character(column) == "")
}
# Function to check for long strings
#' @rdname describe_cols
#' @export
check_long_strings <- function(column, max_length = 80) {
  checkmate::assert_int(max_length, lower = 1, upper = 500, null.ok = FALSE)
  column <- as.character(column)
  if (anyNA(column)) {
    column[is.na(column)] <- "NA"
  }
  long_strings <- nchar(column) > max_length
  if (any(long_strings, na.rm = TRUE)) {
    return(long_strings)
  } else {
    return(NULL)
  }
}

# Function to check for specific special characters
#' @rdname describe_cols
#' @export
check_special_chars <- function(column, special_chr = "[\\n\\r\\{\\}\\[\\]]") {
  checkmate::assert_character(special_chr, null.ok = FALSE)
  column <- as.character(column)
  if (anyNA(column)) {
    column[is.na(column)] <- "NA"
  }
  special_chars <- stringr::str_detect(column, stringr::regex(special_chr))
  if (any(special_chars, na.rm = TRUE)) {
    return(special_chars)
  } else {
    return(NULL)
  }
}

#' @examples
#' # Lets find those values that are too long
#'
#' @rdname describe_cols
#' @export
detect_issues <- function(df,
                          additional_checks = list(
                            "too_long" = check_long_strings,
                            "special_chars" = check_special_chars
                          ),
                          extra_args = list(max_length = 80, special_chr = "outlier"),
                          max_desc_length = 80) {
  checkmate::assert_int(max_desc_length, lower = 1, upper = 500, null.ok = FALSE)
  df_col_desc <- describe_cols(df = df, additional_checks = additional_checks, extra_args = extra_args)
  condition_v <- list(
    "have_long_desc" = ifelse(is.na(df_col_desc$desc), FALSE, nchar(df_col_desc$desc) > max_desc_length),
    "have_empty_levels" = df_col_desc$n_empty_levels > 0,
    "have_nas_not_levels" = df_col_desc$n_empty_levels < 0
  )
  if (any(condition_v$have_long_desc)) {
    cur_c <- condition_v$have_long_desc
    message(
      "The following columns have long descriptions: ",
      paste(df_col_desc$col.name[cur_c], collapse = ", ")
    )
  }
  if (any(condition_v$have_empty_levels)) {
    cur_c <- condition_v$have_empty_levels
    message(
      "The following columns are ", unique(df_col_desc$type[cur_c]), " and have empty levels: ",
      paste(df_col_desc$col.name[cur_c], collapse = ", ")
    )
  }
  if (any(condition_v$have_nas_not_levels)) {
    cur_c <- condition_v$have_nas_not_levels
    message(
      "The following columns are ", unique(df_col_desc$type[cur_c]), " and have NAs that are not levels: ",
      paste(df_col_desc$col.name[cur_c], collapse = ", ")
    )
  }
}
