
# _Dimension control and df checks ----------------------------------------------

#' Reduce number of levels in a column of a df
#'
#' @description `r lifecycle::badge("stable")`
#'
#' Use this function to reduce the number of levels in a `data.frame` column called `variable`.
#' This function calculates the frequency distribution of levels and sets either a soft threshold
#' based on the probability cut-off (`p_to_keep`) and/or an hard threshold (`num_max_values`).
#'
#' @param dt (`data.frame`)\cr data.frame with too many levels for a `variable`.
#' @param variable (`character`)\cr
#'
#' @details
#' If necessary, a number of additional rare values can be picked from the least represented levels
#' (`num_of_rare_values`). For general use it is also possible to keep certain values
#' (`add_specific_value`) and rows (`keep_spec_rows`). Exploratory plots can be also inspectioned with
#' `explorative = TRUE`.
#'
#'
#' @return A modified `data.frame` and a plot if `exporative = TRUE`.
#'
#' @examples
#' # real case scenario: trimming of variables with too many levels
# random.cdisc.data::cadae %>%
#   reduce_num_levels_in_df(adae_pharmaverse, "AEDECOD",
#     num_max_values = 7, num_of_rare_values = 1,
#     add_specific_value = c(
#       "VOMITING", "NAUSEA", "SKIN IRRITATION", "HEADACHE", # For SMQ01NAM, SMQ02NAM, CQ01NAM
#       "MYOCARDIAL INFARCTION" # for aet07 AESDTH == "Y"
#     )
#   )
#'
#' @export
reduce_num_levels_in_df <- function(dt, variable, p_to_keep = 0.7,
                                    num_max_values = NULL, num_of_rare_values = 0, explorative = FALSE,
                                    add_specific_value = NULL, keep_spec_rows = NULL) { # Latter no exploration
  checkmate::assert_number(p_to_keep, lower = 0, upper = 1)
  checkmate::assert_data_frame(dt)
  checkmate::assert_string(variable)
  checkmate::assert_character(add_specific_value, null.ok = TRUE)
  checkmate::assert_choice(variable, names(dt))
  checkmate::assert_integer(keep_spec_rows,
                            null.ok = TRUE,
                            lower = 1, upper = nrow(dt), unique = TRUE
  )
  checkmate::assert_flag(explorative)
  cur_vec <- dt[[variable]]

  if (is.factor(cur_vec)) {
    cur_vec <- as.character(cur_vec)
  }

  lev_freq <- sort(table(cur_vec), decreasing = TRUE)

  # Explorative plot
  if (explorative && interactive()) {
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

    print(gg)

    #  Effective calculations
  } else {
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

    if (!is.null(keep_spec_rows)) {
      lev_to_keep <- c(lev_to_keep, keep_spec_rows)
      filter1 <- which(cur_vec %in% lev_to_keep)
      keep_spec_rows <- keep_spec_rows[!keep_spec_rows %in% filter1]
    }

    if (interactive()) {
      msg <- paste0(
        "Reducing levels of ", deparse(substitute(dt)), " for variable ",
        variable, ": keeping ", length(lev_to_keep),
        " levels out of ", length(lev_freq), " levels. Total kept (%): ",
        round(sum(lev_freq[lev_to_keep]) * 100 / sum(lev_freq), 1)
      )
      if (length(keep_spec_rows) > 0) {
        msg <- paste0(
          msg, "\n", "Keeping other rows for a total: ",
          round((sum(lev_freq[lev_to_keep]) + length(keep_spec_rows)) * 100 / sum(lev_freq), 1)
        )
      }
      message(msg)
    }

    out <- dt %>% filter(!!sym(variable) %in% lev_to_keep)

    if (length(keep_spec_rows) > 0) {
      out <- rbind(out, dt %>% slice(keep_spec_rows))
    }

    # Simple check of filtering
    stopifnot(nrow(out) == sum(cur_vec %in% lev_to_keep))

    out
  }
}
