
# Header ####
# How to use bayesian model averaging to explore 
#'  a range of reduced regression models in R.
#'  load necessary packages
#'    
#'    
#'    Code from Ted Welser, 
#'    Initially written in          2018-19, 
#'    to allow stand alone use      2023 
#'    Revised by Mila Gmerek 
#'      format norms                2023 

#  Load packages, etc ####
library(googlesheets4)
library(tidyverse)

library(BMA)
library(MASS)

rm(list=ls(all=TRUE))    
getwd()

#  Load data set

read_sheet(
  "https://docs.google.com/spreadsheets/d/1f-7d2zNXVkPB5PANBqpM6tw_vYlI5q3LavDhwDPFkwY/edit?usp=sharing",
               col_names = TRUE) %>%
  janitor::clean_names() %>%
  tibble() -> df


names(df)

# Process model vars as numeric


df %>%
  mutate(
    age_65plus = as.numeric(age_65plus), 
    age = as.numeric(age),
    work_age_unemployed = as.numeric(work_age_unemployed),
    employment1 = as.numeric(employment1),
    income1 = as.numeric(income1),
    education1 = as.numeric(education1),
    ses = as.numeric(ses),
    acs_home = as.numeric(acs_home),
    acs_mob = as.numeric(acs_mob),
    acs_school = as.numeric(acs_school),
    acs_work = as.numeric(acs_work),
    pwa_acs_work = as.numeric(pwa_acs_work),
    skill_find_info = as.numeric(skill_find_info),
    skill_learn_youtube = as.numeric(skill_learn_youtube),
    comment_plus_online = as.numeric(comment_plus_online),
    int4_health = as.numeric(int4_health),
    int4_educ = as.numeric(int4_educ),
    int4_jobsearch = as.numeric(int4_jobsearch),
    int4_socmed = as.numeric(int4_socmed)
                                          ) -> df
    

#  Create orderd list of predictors ####
#'   in the order you want them to be displayed.
# here is an old way to make subset of columns
# what would you do to replace this?


attach(df)

x.vars <-  cbind(age_65plus,
              age,
              work_age_unemployed,
              employment1,
              income1,
              education1,
              ses,
              acs_home	,
              acs_mob	,
              acs_school	,
              acs_comm_ctr	,
              acs_work	,
              pwa_acs_work,
              skill_find_info,
              skill_learn_youtube,
              comment_plus_online)  

x.vars <- as.data.frame(x.vars)

detach(df)

#   Assign vars to X group and to Y  ####


x <- x.vars
y <- int4_health

#  Run BMA, plot and summary ####

#'  create an object as the result of the bic.glm function
#'      bayesian information criterion;  general linear model

#'  select the family appropriate to you dv

glm.out.health<- bic.glm(x,y, strict=FALSE, 
                         glm.family="gaussian")

#'  ask for a summary (model summary)

#'  ask for an image that indicates which variables were included in
#'    the range of models considered  
#'    (blue=positive coeficient;  red=negative; blank=omitted)


summary(glm.out.health)
imageplot.bma(glm.out.health)


#'  thinking about which variables combine for models, 
#'  and which are only present in models
#'    that omit other variables provides valuable insight.  
#'  you need to consider what it means to include or omit 
#'  different predictors and the extent to
#'  which your predictors represent distinct or overlapping causes.
