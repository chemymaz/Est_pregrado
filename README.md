Trabajo con plantas extintas
================

# Introducción

En este documento trabajaremos para explorar la identidad de plantas que
se encuentran extintas en silvestría o totalmente extintas según la
[*IUCN*](https://www.iucnredlist.org/)

## Trabajando con datos

Vamos a partir por cargar los paquetes necesarios para trabajar

``` r
library(tidyverse)
```

    ## ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.0 ──

    ## ✓ ggplot2 3.3.2     ✓ purrr   0.3.4
    ## ✓ tibble  3.0.4     ✓ dplyr   1.0.2
    ## ✓ tidyr   1.1.2     ✓ stringr 1.4.0
    ## ✓ readr   1.4.0     ✓ forcats 0.5.0

    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()

Ahora voy a leer los datos con los que voy a trabajar

``` r
plants <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-08-18/plants.csv')
```

    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   .default = col_double(),
    ##   binomial_name = col_character(),
    ##   country = col_character(),
    ##   continent = col_character(),
    ##   group = col_character(),
    ##   year_last_seen = col_character(),
    ##   red_list_category = col_character()
    ## )
    ## ℹ Use `spec()` for the full column specifications.

## Filtrando los datos para resolver el ejemplo 1

El código que voy a ejecutar ahora es para resolver el problema en el
siguiente
[slide](https://derek-corcoran-barrios.github.io/CursoProgrPres/Clase2/Clase2InvestigacionReproducible.html#29),
para poner dentro de la base de datos, solo datos de Chile (Perú) y solo
usar las columnas para país (*country*), la de especie
(*binomial\_name*) y la categoría de IUCN (*red\_list\_category*)

``` r
Per <- plants %>% 
  dplyr::filter(country == "Peru") %>% 
  dplyr::select(binomial_name, country, red_list_category)

Per
```

    ## # A tibble: 4 x 3
    ##   binomial_name        country red_list_category  
    ##   <chr>                <chr>   <chr>              
    ## 1 Brugmansia arborea   Peru    Extinct in the Wild
    ## 2 Brugmansia insignis  Peru    Extinct in the Wild
    ## 3 Brugmansia sanguinea Peru    Extinct in the Wild
    ## 4 Pradosia argentea    Peru    Extinct

## resumen de especies por paises

``` r
Resumen <- plants %>%
  dplyr::filter(continent == "South America") %>% 
  group_by(country) %>% 
  summarise(n_species = n())
```

    ## `summarise()` ungrouping output (override with `.groups` argument)

``` r
Resumen
```

    ## # A tibble: 9 x 2
    ##   country             n_species
    ##   <chr>                   <int>
    ## 1 Argentina                   1
    ## 2 Bolivia                     1
    ## 3 Brazil                     10
    ## 4 Chile                       2
    ## 5 Colombia                    6
    ## 6 Ecuador                    52
    ## 7 Peru                        4
    ## 8 Trinidad and Tobago         6
    ## 9 Venezuela                   1
