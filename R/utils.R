get_data_raw_path <- function(sub = "") {
  file.path(Sys.getenv("DATA_RAW_PATH"), sub = sub) |>
    normalizePath(mustWork = TRUE)
}

get_data_path <- function(sub = "") {
  file.path(Sys.getenv("DATA_PATH"), sub = sub) |>
    normalizePath(mustWork = FALSE)
}

get_output_path <- function(sub = "") {
  file.path(Sys.getenv("OUTPUT_PATH"), sub = sub) |>
    normalizePath(mustWork = FALSE)
}
