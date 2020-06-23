library(tidymodels)

data(Orange)

Orange <- as_tibble(Orange)
Orange

cor(Orange$age, Orange$circumference)
#> [1] 0.914

library(ggplot2)

ggplot(Orange, aes(age, circumference, color = Tree)) +
  geom_line()

Orange %>% 
  group_by(Tree) %>%
  summarize(correlation = cor(age, circumference))

ct <- cor.test(Orange$age, Orange$circumference)
ct

tidy(ct)

nested <- 
  Orange %>% 
  nest(data = c(age, circumference))

nested %>% 
  mutate(test = map(data, ~ cor.test(.x$age, .x$circumference)))

nested %>% 
  mutate(
    test = map(data, ~ cor.test(.x$age, .x$circumference)), # S3 list-col
    tidied = map(test, tidy)
  )