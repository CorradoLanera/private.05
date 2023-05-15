test_that("read_data_raw() works", {
  # eval
  db_raw <- read_data_raw("penguins.csv")

  # test
  expect_tibble(db_raw)
})


test_that("preproc() returns expected number of cols", {
  # setup
  db_raw <- read_data_raw("penguins.csv")

  # eval
  db <- preproc(db_raw)

  # test
  ncol(db) |> expect_equal(4)
})
