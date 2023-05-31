# Header                                            ##### 
#'    standard opening procedures               
#'    
#'         Original code written by %>%dreams in RBloggers, 7/26/2021
#'         See post for additional explanations
#'         https://www.r-bloggers.com/2021/07/politely-scraping-wikipedia-tables-2/
#'         
#'         adapted by Ted Welser, 5/31/2023
#'         
#'         and 
#'         date     to
#'         ??
#'               
#'           _.-^~~^^^`~-,_,,~''''''```~,''``~'``~,
#' ______,'  -o  :.  _    .          ;     ,'`,  `.
#' (      -\.._,.;;'._ ,(   }        _`_-_,,    `, `,
#'  ``~~~~~~'   ((/'((((____/~~~~~~'(,(,___>      `~' 
#                       #                               #


# *********************************************
## 1 Load Packages, remove objects, load dataset         ----
# *********************************************


# To clean data

library(tidyverse)
library(lubridate)
library(janitor)

# To scrape data

library(rvest)
library(httr)
library(polite)

##  Scrape table  ----

#   add your URL
url <- "https://en.wikipedia.org/wiki/List_of_the_largest_software_companies"


url_bow <- polite::bow(url)
url_bow

ind_html <-
  polite::scrape(url_bow) %>%  # scrape web page
  rvest::html_nodes("table.wikitable") %>% # pull out specific table
  rvest::html_table(fill = TRUE) 

#   the object created will be a list, 
#   in this case, you want the second object


ind_tab1 <- 
  ind_html[[1]] %>% 
  clean_names()

head(ind_tab1)      #not what we want

ind_tab2 <- 
  ind_html[[2]] %>% 
  clean_names()

head(ind_tab2)     # looks good.

##  Write results to googlesheet ----

software_comp <- gs4_create("software_companies",
                         sheets = ind_tab2)
