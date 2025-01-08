#paczki
library(tidyverse)

#test potokowanie
#nadpisywanie kolejnymi wartościami
dane_napisane <- c (6, 7, 8, 9)
dane_nadpisane <- cumsum(dane_napisane)
dane_nadpisane <- mean(dane_nadpisane)


#zapis z zagniezdzoną funkcją

dane_funkcja <- mean(cumsum(c(6, 7 ,8, 9)))


#zapis z użyciem potokowania ("pipe")
dane_potoku <- c(6, 7, 8, 9) |> cumsum () |> mean ()

#tidyr
data <- iris

#zmiana formatu long na wide
l_2_w <- data |>
  tidyr :: pivot_wider(names_from = Species, values_from = Sepal.Length:Petal.Width)

#teraz pingwiny
pingwiny <- palmerpenguins:: penguins

#zmiana formatu long na wide
#pingwiny_wide <- pingwiny |>
#  tidyr::drop_na() |>
#zmiana formatu na "szerszy"
 # tidyr::pivot_wider(names_from = )

pingwiny <- pingwiny |>
  dplyr::mutate(id = 1:length(year))







#Zamiana formatu wide na long
pingwiny_longer <-pingwiny |>
  tidyr::pivot_longer(bill_length_mm:body_mass_g, names_to = "zmienna", values_to = "wartości", )


#wykres
ggplot2::ggplot(pingwiny_longer, aes(year, wartości, color = species)) +
  geom_point() +
facet_wrap (vars (zmienna))

#do szerokości
pingwiny_wider <-pingwiny_longer |>
  #zmiana formatu ramki
  tidyr::pivot_wider(names_from = zmienna, values_from = wartości, id_cols = id)


#Joins (operacje na wielu ramkach)
#podział na płeś
pingwiny_m <- pingwiny|>
  dplyr::filter(sex == "male")

#wybór samiczek
pingwiny_s <- pingwiny |>
  dplyr::filter(!sex == "male")

#łączymy samiczki i samców - wierszy - bind rows

pingwiny_m_s <-dplyr::bind_rows(pingwiny_m, pingwiny_s)


#podział kolumn
pingwiny_1 <- pingwiny |>
  dplyr::select(species:body_mass_g)

pingwiny_2 <- pingwiny |>
  dplyr::select (-c(species:body_mass_g))

#łączenie kolumn bind cols
pingwiny_1_2 <- dplyr::bind_cols(pingwiny_1, pingwiny_2)
