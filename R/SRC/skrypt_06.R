#15.01.2025
#dodajemy biblioteki
library(tidyverse)

#wczytanie danych
data_1 <- readxl::read_excel("R/DATA/data_msu.xlsx", sheet = "loi" )

data_2 <- readxl::read_excel("R/DATA/data_msu.xlsx", sheet = "elemental" )

data_3 <- readxl::read_excel("R/DATA/data_msu.xlsx", sheet = "bsi" )
#wylistowanie dostępnych arkuszy w pliku excel

readxl::excel_sheets("R/DATA/data_msu.xlsx")


#łączenie ramek
#left join
dane_left <- dplyr::left_join(x = data_1, y = data_2)
dane_left_2 <- dplyr::left_join(x = data_1, y = data_3)
dane_left_3 <- dplyr::left_join(x = data_1, y = data_3, by = dplyr::join_by(sample.id==sample.id))

dane_left_4 <- dplyr::left_join(dplyr::select(data_1, -mass.mg),dplyr::rename(data_3, nazwa.id=sample.id), by = dplyr::join_by (sample.id == nazwa.id))

data_left_5 <- dplyr::left_join(data_1, data_2, by = dplyr::join_by(sample.id)) |>
  dplyr:: left_join(x=_, y= data_3, by = dplyr::join_by (sample.id))

#łączenie z prawej
dane_right <- dplyr::right_join(x = data_1, y = data_2)

data_right_2 <- dplyr::right_join(data_3, data_1, by= dplyr::join_by (sample.id)) |>
  dplyr:: right_join(data_2, by = dplyr::join_by(sample.id))

#łączenie wszystkiego - iner_join

data_inner_1 <- dplyr::inner_join(data_1, data_2)


#szalone rzeczy będą


data_szalone <- dplyr::inner_join(data_1, data_3, by = dplyr::join_by (sample.id)) |>
  dplyr::right_join(dane_right, by = dplyr::join_by (sample.id))

#łączenie wszystkiego -full joni

data_full_1 <- dplyr::full_join(data_1, data_2)


#semi join

data_semi <- dplyr::semi_join(data_1, data_2)


#anti_join

data_anti <- dplyr::anti_join(data_1, data_2)
data_anti_2 <- dplyr::anti_join(data_2, data_1)
