library(tidyverse)

pop_comp_1995 <- read_csv("./data/raw/us-est90int-07-1995.csv", 
                          skip =3, 
                          col_names = c("date", "age", "all", "male", "female")) |> 
  filter(str_detect(date, "July 1") & age != "All Age" & age != "100+") |>
  select(age, all) |>
  mutate(pr = all/sum(all),
         age = as.numeric(age))
save(pop_comp_1995, file = "./data/derived/pop_comp_1995.RData")

pop_comp_2021 <- read_csv("./data/raw/nc-est2024-agesex-res.csv") |>
  filter(SEX == 0) |>
  select(age = AGE, all = POPESTIMATE2021) |>
  filter(age != 100 & age != 999) |>
  mutate(pr = all/sum(all))
save(pop_comp_2021, file = "./data/derived/pop_comp_2021.RData")
