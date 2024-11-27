#27.11.2024
library(tidyverse)
library (readxl)

#Wczytywanie danych
ramkadanych <- readxl::read_excel("R/DATA/Maurycy_dane.xlsx", sheet = "Arkusz1")

#zmiana nazw zmiennych
ramkadanych <- dplyr::rename(ramkadanych, Data_zapisu = Data)
ramkadanych <- dplyr::rename(ramkadanych, Wypita_kawa = `Ilość wypitej kawy (w kubkach)`)
ramkadanych <- dplyr::rename(ramkadanych, Godzina_wstania = `Godzina wstania (czasu lokalnego)`, Czas_na_IG = `Czas na IG (w minutach)`)

#Zmiana nazw z wielkich na małe i z małych na wielkie

ramkadanych_2 <- dplyr::rename_with(ramkadanych, .cols = everything(), \(i) tolower(i))
ramkadanych_3 <- dplyr::rename_with(ramkadanych_2, .cols = dplyr::starts_with("data_zapisu"), \(i) toupper(i))

#Operacje na kolumnach
ramkadanych_3$kol6 <- ramkadanych_3[,3]/ramkadanych_3 [,4]


ramkadanych_4 <- dplyr:: mutate (ramkadanych_2, wynik_dzielenia = wypita_kawa/czas_na_ig)
ramkadanych_4 <- dplyr:: mutate (ramkadanych_4, `wynik_dodawania_kawa+2` = wypita_kawa + 2)


ramkadanych_5 <- dplyr:: mutate (ramkadanych_4, `wynik_dodawania_kawa+2` = wypita_kawa +6)
ramkadanych_6 <- dplyr:: mutate (ramkadanych_5, `wynik_dodawania_kawa+2` = wypita_kawa +6, .keep= "none")

ramkadanych_7 <- dplyr::relocate(ramkadanych_5, wypita_kawa, .after = data_zapisu)
