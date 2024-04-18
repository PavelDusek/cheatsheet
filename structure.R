library(tidyverse)
library(readxl)

df <- read_cvs("data.csv")
df <- read_excel("data.xlsx", sheet = "sheet1")

colnames(df) <- c("column1", "column2", "column3")
levels(df$column1) <- c("level1", "level2", "level3")
