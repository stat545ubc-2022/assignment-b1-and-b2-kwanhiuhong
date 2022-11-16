library(tidyverse)
test_that("convert_all_numericNA_to_median works", {
  test_case_1_actual <- tribble(
    ~name,            ~birth_weight,  ~birth_year, 
    "Luke Skywalker",  1.35      ,   1998        , 
    "C-3PO"         ,  NA        ,   2000        ,  
    "R2-D2"         ,  2.25      ,   NA        ,  
    "Darth Vader"   ,  2.70      ,   NA        ,  
  ) 
  test_case_1_expected <- tribble(
    ~name,            ~birth_weight,  ~birth_year, 
    "Luke Skywalker",  1.35      ,   1998        , 
    "C-3PO"         ,  2.25      ,   2000        ,  
    "R2-D2"         ,  2.25      ,   1999        ,  
    "Darth Vader"   ,  2.70      ,   1999        ,  
  )
  test_case_2_actual <- tribble(
    ~name,            ~birth_weight,  ~birth_year, 
    NA              ,  1.35      ,   1998        , 
    NA              ,  1.35      ,   2000        ,  
    "R2-D2"         ,  2.25      ,   2001        ,  
    "Darth Vader"   ,  2.70      ,   2002        ,  
  ) 
  test_case_2_expected <- tribble(
    ~name,            ~birth_weight,  ~birth_year, 
    NA              ,  1.35      ,   1998        , 
    NA              ,  1.35      ,   2000        ,  
    "R2-D2"         ,  2.25      ,   2001        ,  
    "Darth Vader"   ,  2.70      ,   2002        ,  
  ) 
  test_case_3_actual <- tribble(
    ~name,            ~birth_weight,  ~birth_year, 
    "Luke Skywalker",  NA      ,   2000        , 
    "C-3PO"         ,  NA      ,   NA        ,  
  ) 
  test_case_3_expected <- tribble(
    ~name,            ~birth_weight,  ~birth_year, 
    "Luke Skywalker",  NA      ,   2000        , 
    "C-3PO"         ,  NA      ,   2000        ,  
  ) 
  expect_equal(convert_all_numericNA_to_median(test_case_1_actual), test_case_1_expected)
  expect_equal(convert_all_numericNA_to_median(test_case_2_actual), test_case_2_expected)
  expect_equal(convert_all_numericNA_to_median(test_case_3_actual), test_case_3_expected)
})