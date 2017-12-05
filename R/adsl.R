
#' Generate ADSL dataset
#'
#'
#' @inheritParams radam
#' @param ... specific ADSL variables
#'
#'
#' @import dplyr
#'
#' @examples
#'
#' ASL <- radam("ASL")
#' head(ASL)
#'
#' ASL <- radam("ASL",
#'    start_with = list(
#'       BECOG = LETTERS[1:5],
#'       BAGED = sample(size = nrow(ASL), letters[1:5], replace = TRUE)
#'    )
#' )
#' head(ASL)
#'
adsl <- function(N, ..., DM = NULL, start_with = list()) {

  dm <- if(is.null(DM)) dm(N) else DM

  ## add derived variables with mutate
  dm %>%
    add_replace_variables(start_with)

}
