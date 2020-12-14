library(tidyverse)

## Cargar una base de datos

data("mtcars")

## Filtro solo los vehiculos con 8 cilindros

Mt <- mtcars %>% filter(cyl ==8)

Mt