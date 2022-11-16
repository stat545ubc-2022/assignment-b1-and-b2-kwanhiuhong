#' @title Convert NAs in a tribble to median of that column
#' @description Convert NAs in all numeric columns in a tribble to median of that column
#' @param data A tribble
#' @return A tribble without NAs for numeric columns
#' @importFrom dplyr mutate
#' @importFrom dplyr across
#' @importFrom dplyr %>%
#' @importFrom tidyselect where
#' @import tidyverse
#' @import datateachr
#' @import testthat
#' @examples
#' library(tidyverse)
#' library(datateachr)
#' data <- tribble(
#' ~name,            ~birth_weight,  ~birth_year, 
#' "Luke Skywalker",  1.35      ,   1998        , 
#' "C-3PO"         ,  NA        ,   2000        ,  
#' "R2-D2"         ,  2.25      ,   NA        ,  
#' "Darth Vader"   ,  2.70      ,   NA        ,  
#' )
#' convert_all_numericNA_to_median(data)
#' @export
convert_all_numericNA_to_median <- function(data) {
  data %>% 
    dplyr::mutate(
      dplyr::across(
        tidyselect::where(is.numeric), ~if_else(is.na(.x), median(.x, na.rm = T), as.numeric(.x))
      )
    )
}