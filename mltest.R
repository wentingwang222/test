library(tidymodels)

data(Orange)

Orange <- as_tibble(Orange)
Orange

cor(Orange$age, Orange$circumference)
#> [1] 0.914

library(ggplot2)

ggplot(Orange, aes(age, circumference, color = Tree)) +
  geom_line()