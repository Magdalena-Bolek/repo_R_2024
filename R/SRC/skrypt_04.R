# Dzień 04.12.2024

#biblioteki

library (tidyverse)
#wczytać dane
dane <- data("iris")
dane <- iris
#zmiana nazwy kolumn
dane <- dplyr::rename_with(dane, .cols = dplyr::everything(), \(i) tolower(i))


#dodawanie kolumn
dane <- dplyr::mutate (dane, iloraz = petal.length/petal.width)

#grupowanie danych
dane_g <- dplyr::group_by(dane, species)

#wydrukuj do konsoli
dane_g
#podsumowanie
dane_s <- dplyr::summarise(dane_g, srednia = mean(sepal.length),srednia = mean(sepal.length) )

#praca na ilku kolumnach na raz
dane_01 <- dplyr::mutate(dane, sepal.length = log (sepal.length))
dane_02 <- dplyr::mutate(dane, sepal.length = sqrt (sepal.length),petal.length = sqrt(petal.length))


#across
dane_03 <- dplyr::mutate(dane, dplyr::across(sepal.length:petal.width, \(i) log10(i)))

#across przez  kolumny które mają .lenhth

dane_04 <- dplyr::mutate (dane, dplyr::across(dplyr::contains ("length"), \(i) log10(i)))
#across
dane_05 <- dplyr::mutate (dane, dplyr::across(c(sepal.length, dplyr::contains ("width")), \(i) log10(i)))


dane_06 <- dplyr::mutate (dane, dplyr::across (dplyr::starts_with ("petal"), \(i)log (i)), iloraz = petal.length/petal.width)

#across w summarise

dane_07 <- dplyr::summarise(dane, dplyr::across(dplyr::everything(), \ (i) mean(i)))

#across na wartościach numerycznych

dane08<-dplyr::summarise(dane, dplyr::across(dplyr::where(\(i)is.numeric(i)), \(i) mean(i)))


#across na wartościach numerycznych więcej niż jedna

dane_09 <-dplyr::summarise(dane, dplyr::across(dplyr::where(\(i) is.numeric(i)),
                                               list(srednia = \(i) median(i))))


#potokowanie
#dodanie nowej kolumny wynik dodawania kolumn
dane_10 <- dplyr::mutate(dane, suma = sepal.length + sepal.width +petal.length +petal.width)

#grupowanie
dane_10 <- dplyr::group_by(dane_10, species)

#policz srednia wastosc wszystkim kolumkna

dane_10 <- dplyr::summarise(dane_10, dplyr::across(dplyr::where(\(i) is.numeric(i)), \(i)mean(i)))

#potokowanie w działaniu
dane_11 <- dane |>
  dplyr::mutate (suma = sepal.length + sepal.width +petal.length +petal.width) |>
  dplyr::group_by(species) |>
  dplyr::summarise( dplyr::across(dplyr::where(\(i) is.numeric(i)), \(i)mean(i)))

