library(tidyverse)
library(lubridate)
library(readxl)
library(janitor)

data_dir = "_data"

workbook <- "~/../Downloads/presidential_approval_ratings.xlsx"

approval <- tibble()

for (sheet in excel_sheets(workbook)) {
  df <- read_excel(workbook, sheet) %>% clean_names() %>%
    mutate(president = sheet, net_approval = approving - disapproving,
           interval = end_date - start_date,
           mid_date = start_date + interval / 2,
           quarter = quarter(mid_date), year = as.integer(year(mid_date)))

  approval <- bind_rows(approval, df)
}

approval <- approval %>% group_by(president, year, quarter) %>%
  summarize(across(c(approving, disapproving, net_approval),
                ~mean(.x, na.rm = TRUE)), .groups = "drop") %>%
  arrange(year, quarter)

wide_approval <- approval %>% select(president, year, quarter, net_approval) %>%
  mutate(quarter = str_c("Q", quarter)) %>%
  pivot_wider(names_from = "quarter", values_from = "net_approval") %>%
  select(president, year, Q1, Q2, Q3, Q4) %>%
  arrange(year) %>%
  filter(! is.na(Q2), year >= 1945)

write_rds(wide_approval, file.path(data_dir, "presidential_approval.Rds"))
