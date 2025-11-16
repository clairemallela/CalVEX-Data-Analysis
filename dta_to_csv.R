# calvex_venv/Scripts/activate

library(haven)

CalVEX2021_csv <- read_dta('C:\\Users\\ravim\\Desktop\\CalVEX\\raw_data\\CalVEX2021_dta.dta')
write.csv(CalVEX2021_csv, file = "CalVEX2021_csv.csv")