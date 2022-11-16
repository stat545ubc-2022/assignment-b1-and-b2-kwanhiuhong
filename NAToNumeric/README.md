
<!-- README.md is generated from README.Rmd. Please edit that file -->

# NAToNumeric

<!-- badges: start -->
<!-- badges: end -->

The goal of NAToNumeric is to convert NAs in all numeric columns in a
tribble to median of that column.

## Installation

You can install the development version of NAToNumeric from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("stat545ubc-2022/assignment-b1-and-b2-kwanhiuhong")
```

## Usage

This is a basic example which shows how to use this function:

``` r
library(NAToNumeric)
library(tidyverse)
#> ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.2 ──
#> ✔ ggplot2 3.3.6      ✔ purrr   0.3.5 
#> ✔ tibble  3.1.8      ✔ dplyr   1.0.10
#> ✔ tidyr   1.2.1      ✔ stringr 1.4.1 
#> ✔ readr   2.1.3      ✔ forcats 0.5.2 
#> ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
#> ✖ dplyr::filter() masks stats::filter()
#> ✖ dplyr::lag()    masks stats::lag()
library(datateachr)
data <- tribble(
 ~name,            ~birth_weight,  ~birth_year, 
 "Luke Skywalker",  1.35      ,   1998        , 
 "C-3PO"         ,  NA        ,   2000        ,  
 "R2-D2"         ,  2.25      ,   NA        ,  
 "Darth Vader"   ,  2.70      ,   NA        ,  
 )
convert_all_numericNA_to_median(data)
#> # A tibble: 4 × 3
#>   name           birth_weight birth_year
#>   <chr>                 <dbl>      <dbl>
#> 1 Luke Skywalker         1.35       1998
#> 2 C-3PO                  2.25       2000
#> 3 R2-D2                  2.25       1999
#> 4 Darth Vader            2.7        1999
```
