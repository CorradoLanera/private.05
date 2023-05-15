

# Functions -------------------------------------------------------
.please_install <- function(pkg) {
  if (
    !requireNamespace(pkg) &&
    askYesNo(
      paste0("It's OK to install the package ", pkg, "?"),
      default = FALSE
    )
  ) {
    install.packages(pkg)
  }

}




# Packages --------------------------------------------------------
.please_install("checkmate")
.please_install("devtools")
.please_install("here")
.please_install("janitor")
.please_install("palmerpenguins")
.please_install("tidyverse")



# setup -----------------------------------------------------------
folders <- here::here(c("data-raw", "data", "output"))
purrr::walk(folders, dir.create)

file.path(folders, ".keep") |>
  purrr::walk(file.create)

palmerpenguins::penguins_raw |>
  readr::write_csv(here::here("data-raw/penguins.csv"))

usethis::use_description(check_name = FALSE)
usethis::use_testthat()

usethis::use_r("functions")
usethis::use_test("functions")

usethis::use_r("utils")
usethis::use_test("utils")

# snapshot packages to renv ---------------------------------------

renv::snapshot()



# Private space ---------------------------------------------------

{
  usethis::edit_r_environ("project")
  usethis::use_git_ignore(".Renviron")
}
