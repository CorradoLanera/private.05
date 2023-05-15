source(here::here("R/utils.R"))




# reader ----------------------------------------------------------
read_data_raw <- function(db_name) {
  readr::read_csv(get_data_raw_path(db_name))
}




# preproc ---------------------------------------------------------
preproc <- function(db_raw) {
  db_raw |>
    janitor::clean_names() |>
    dplyr::select(species, sex, body_mass_g, culmen_depth_mm)
}




# writers ---------------------------------------------------------
write_obj <- function(obj, name, ver = NULL, dir = "") {
  if (!is.null(ver)) {
    out_path <- file.path(dir, glue::glue("{name}_{ver}.rds"))
    readr::write_rds(obj, out_path)
  }
  readr::write_rds(obj, file.path(dir, glue::glue("{name}.rds")))
}

write_output <- function(obj, name, ver = NULL) {
  write_obj(obj, name, ver, dir = get_output_path())
  obj
}

write_data <- function(obj, name, ver = NULL) {
  write_obj(obj, name, ver,  dir = get_data_path())
  obj
}

write_plot <- function(gg = last_plot(), name, ver = NULL) {
  custom_save <- function(name, gg) {
    ggplot2::ggsave(
      name, gg,
      path = get_output_path(),
      width = 16, height = 9, units = "cm", dpi = "retina", scale = 2
    )
  }

  if (!is.null(ver)) {
    custom_save(glue::glue("{name}_{ver}.png"), gg)
  }

  custom_save(glue::glue("{name}.png"), gg)

  invisible(gg)
}
