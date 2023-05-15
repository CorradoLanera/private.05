version <- "1.2"



# Packages --------------------------------------------------------
library(here)
library(janitor)
library(tidyverse)




# Functions -------------------------------------------------------
source(here("R/functions.R"))




# read and preproc ------------------------------------------------
db_raw <- read_data_raw("penguins.csv")

penguins <- db_raw |>
  preproc() |>
  write_data("penguins", ver = version)




# Analysis --------------------------------------------------------
gg <- penguins |>
  ggplot(aes(culmen_depth_mm, body_mass_g)) +
  geom_smooth(method = lm, colour = "black", linetype = "dashed") +
  geom_smooth(aes(colour = species), method = lm) +
  geom_point(aes(shape = sex, colour = species)) +
  theme(legend.position = "top")

write_plot(gg, "gg", ver = version)


mod_depth <- lm(body_mass_g ~ culmen_depth_mm, data = penguins) |>
  write_output("mod_depth", ver = version)

mod_depth_spec <- lm(
  body_mass_g ~ species + culmen_depth_mm,
  data = penguins
) |>
  write_output("mod_depth_spec", ver = version)
