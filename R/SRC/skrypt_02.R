#load packages
library(tidyverse)

data <- iris
#średnia dł płatka

sredia_platek <- mean(data$Petal.Length)
mediana_platek <- median(data [, 1])
odchylenie_platek <- sd(data$Petal.Length)

#średnie dla gatunków
sredni_platek_setosa <- mean(data[1:50, 4])
sredni_platek_versi <- mean(data[51:100, 4])
sredni_platek_virgi <- mean(data[101:150, 4])

#średnia dla gatunku po nazwie

sredni_platek_setosa_nazwa <- mean(data[data$Species == "setosa", 4])


#podsumowanie
podsumowanie <- summary(data)
podsumowanie <- print(summary(data))

podsumowanie <- summary(data[ ,1:2])
podsumowanie <- print(summary(data[ ,1:2]))

#długości suma

data$Suma.dlugosci <- data$Sepal.Length + data$Petal.Length

#frakcja

data$Frakcja <- (data$Sepal.Length + data$Petal.Length)/ data$Sepal.Width

#średnia jako kolumna
data$Srednia <- mean (c(data$Sepal.Length, data$Petal.Length))

#ramka danych setosa
data_setosa <- data[1:50, ]
data_setosa

#ramka setosa nazwa

data_setosa_nazwa <- data[data$Species == "setosa", ]
data_setosa_nazwa

#setosa i veris

data_setosa_ver <- data[data$Species == c("setosa","versicolor"), ]
data_setosa_ver

#ramka danych tylko oryginalne kolumny

data_oryginalne <- dplyr:: select(data, Sepal.Length:Species)
data_oryginalne

#wybór zmiennych według nazwy z zapisem od do
data_oryginalne_tylko_sepal <- dplyr:: select(data, Sepal.Length:Sepal.Width)
data_oryginalne_tylko_sepal

# wybór zmiennych według nazwy z zapisem sklejanym
data_oryginalne_tylko_sepal_2 <- dplyr:: select(data, Sepal.Length, Sepal.Width)

#wybór zmiennych według nazwy z zapisem według początku
data_oryginalne_tylko_sepal_3 <- dplyr:: select(data, starts_with("Sepal"))
data_oryginalne_tylko_sepal_3

#wybór zmiennych według nazwy z zapisem według końca
data_oryginalne_tylko_sepal_4 <- dplyr:: select(data, ends_with("Length"))
data_oryginalne_tylko_sepal_4

#wybór zmiennych według nazwy z zapisem znaków wspólnych
data_oryginalne_tylko_sepal_5 <- dplyr:: select(data, contains("al"))
data_oryginalne_tylko_sepal_5

#wybór zmiennych według nazwy z zapisem według początku zanegowanie
data_oryginalne_tylko_sepal_6 <- dplyr:: select(data,!starts_with ("Sepal"))
data_oryginalne_tylko_sepal_6

####Wybór wierszy
#Wybór wierszy z gatunkiem setosa
data_wiersze_1 <- dplyr::filter(data, Species == "setosa")
#Wybór bez setosa
data_wiersze_2 <- dplyr::filter(data, !Species == "setosa")

#Wybór wierszy petal.length > 5.0
data_wiersze_3 <- dplyr::filter(data, Petal.Length > 5.0)
data_wiersze_3

#Wybór wierszy petal.length > 5.0 i mniejsze od 6
data_wiersze_4 <- dplyr::filter(data, Petal.Length > 5.0 & Petal.Length < 6.0)

#działania na zbiorach
