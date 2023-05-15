test_that("get_data_raw_path works", {
  expect_directory_exists(get_data_raw_path())
  expect_file_exists(get_data_raw_path("penguins.csv"))
  expect_error(get_data_raw_path("foo.csv"), "cannot find the file")
})


test_that("get_data_path works (even with not existing files)", {
  expect_directory_exists(get_data_path())
  expect_character(get_data_path("foo.csv"))
})


test_that("get_output_path works (even with not existing files)", {
  expect_directory_exists(get_output_path())
  expect_character(get_output_path("foo.csv"))
})
