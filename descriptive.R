library(tidyverse)

df <- read_csv("data.csv")

library(readxl)
df <- read_excel("data.xlsx", sheet = "sheet1")

df |> summarize_if(
  is.numeric,
  list(
    max = max,
    min = min,
    sum = sum,
    mean = mean,
    median = median,
    Q1 = ~quantile(.x, 0.25),
    Q3 = ~quantile(.x, 0.75)
  )) |>
  pivot_longer( everything(), names_to = c("variable", "func"), values_to = "value", names_sep = "_") |>
  pivot_wider( names_from = func ) |>
  mutate( IQR = Q3 - Q1 )
