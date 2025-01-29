#ggplot 29.01.2025
#wczytujemy paczki
library (tidyverse)
#wczytujemy dane
zab_hydrochemia <- readr::read_csv (file= "R/DATA/zab_data/zab_hydrochemistry-lake.csv") |>
  mutate (date = lubridate::ymd(date))
#wykres x =czas, y = wartość ca,
ggplot2::ggplot(zab_hydrochemia,aes(date, ca)) +
  geom_line()

#wykres x =czas, y = wartość ca - serie pokolorowane - głębokośc
ggplot2::ggplot(zab_hydrochemia,aes(date, ca, color = depth)) +
  geom_line()

#wykres x =czas, y = wartość ca - serie pokolorowane - głębokośc jako wartości dyskretne
ggplot2::ggplot(zab_hydrochemia,aes(date, ca, color = factor(depth))) +
  geom_line() +
  facet_wrap(vars(depth), ncol = 1) +
  theme(panel.background = element_blank())

#wczytaj dane zab_temperature_daily
zab_temp <- readr::read_csv (file= "R/DATA/zab_data/zab_temperature-daily.csv") |>
  mutate (day = lubridate::ymd(day))

#wykres temperatury w wody w czasie, temperatura na pierwwszym metrze, punkty, linia, wygładzone
ggplot2::ggplot(zab_temp,aes(day, temp_01)) +
  geom_point()+
  geom_line(color = "red") +
  geom_smooth()

#zamiana formatu szerokiego na długi
zab_temp |>
  tidyr :: pivot_longer(cols=starts_with ("temp_"), names_to = "glebokosc", , values_to = "temperatura" ) |>
  ggplot(aes(day, temperatura))+
  geom_line()+
  facet_wrap(vars(glebokosc), ncol =1, scales ="free")

#wczytaj dane

zab_trap <- readr::read_csv (file= "R/DATA/zab_data/zab_sediment-trap_hypolimnion.csv") |>
  mutate (date = lubridate::ymd(date))

#wykres kolumnowy

zab_trap |>
  ggplot(aes(date, mar))+
  geom_col()

zab_trap |>
  ggplot()+
  geom_rect(aes(xmin = lead(date), xmax = date, ymin = 0, ymax = mar))

#boxplot

ggplot(zab_hydrochemia)+ geom_boxplot(aes( y=ca, group = factor( depth)))

#violinplot
ggplot(zab_hydrochemia)+ geom_violin(aes(x = factor(depth), y = ca))


#histogramy
ggplot(zab_hydrochemia) + geom_histogram(aes(ca, fill = factor(depth)))
