#Załadowanie paczek
library(tidyverse)
#Dane z interentu
dane_www <- readr::read_csv(file="https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-survey/Annual-enterprise-survey-2023-financial-year-provisional/Download-data/annual-enterprise-survey-2023-financial-year-provisional.csv")

#Wczytanie z dysku z pełną ścieżką
dane_dysk_full_path <- readr::read_csv(file="C:/GitHub/repo_R_2024/R/DATA/annual-enterprise-survey-2023-financial-year-provisional.csv")
#Wczytaj z dysku - ścieżka względna
dane_dysk_relative_path <- readr::read_csv(file="R/DATA/annual-enterprise-survey-2023-financial-year-provisional.csv")
#zamiana kolumny value z teksowej na liczbową
dane_dysk_relative_path$Value <- as.numeric(dane_dysk_relative_path$Value)

#Parsowanie tekstu na numery
dane <- readr::read_csv(file="R/DATA/annual-enterprise-survey-2023-financial-year-provisional.csv")
dane$Value <- readr::parse_number(dane$Value)
dane[748, "Value"]
