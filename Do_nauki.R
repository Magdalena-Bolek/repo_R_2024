#Testowy
#wczytałam wszystko co mi przyszło do głowy dla pewności
library(dplyr)
library(tidyverse)

#wczytanie danych z dysku
dane <-readxl::read_excel("R/DATA/Maurycy_dane.xlsx", sheet = "Arkusz1")


#filtrowanie na wieszach, usunięcie wiersza z NA

dane_2 <- dplyr::filter(dane, !Ilość_wypitej_kawy == "NA" )

# średnia wypitej dziennie kawy
dane_2$Ilość_wypitej_kawy <- as.numeric(dane_2$Ilość_wypitej_kawy)
srednia_kawa <- mean(dane_2$Ilość_wypitej_kawy)
srednia_kawa

#powtórzenie funkcji mutate, dodanie kolumny z tekstem

dane_3 <- dplyr::mutate(dane_2, "ale fajnie jak cos dziala C:")
