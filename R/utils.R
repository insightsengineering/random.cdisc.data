
as_length_N <- function(N, var_list) {

  lapply(var_list, function(var) {
    if (length(var) != N) sample(var, size = N, replace = TRUE) else var
  })

}


add_replace_variables <- function(df, var_list) {

  if (!is.list(var_list)) stop("var_list is not a list")

  var_listN <- as_length_N(nrow(df), var_list)


  for (i in seq_along(var_listN)) {
    df[[names(var_listN)[i]]] <- var_listN[[i]]
  }

  df

}
