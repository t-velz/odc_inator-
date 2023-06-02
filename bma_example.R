
#'#########################################################
# Header ####
#   How to use bayesian model averaging to explore 
#'  a range of reduced regression models in R.
#'    
#'    
#'    Code from Ted Welser, 
#'    Initially written in          2018-19, 
#'    mod to allow stand alone use      5/31/2023 
#'    TED  added link to paper for 
#'         datasource explanation        6/2/2023
#'         and apply model to other dvs
#'         and better use of outline
#'         
#'         
#'     full text of paper is here:    
#'  https://www.researchgate.net/publication/339627394_Digital_Inequality_in_the_Appalachian_Ohio_Understanding_how_Demographics_Internet_Access_and_Skills_can_shape_Vital_Information_Use_VIU
#'         
#'    The dataset used here is a subset of variables
#'    from one instance of the 40 imputed datasets
#'    used for the final models of the study.  
#'    
#'    Digital Inequality in the Appalachian Ohio: 
#'    Understanding how Demographics, Internet Access and Skills
#'     can shape Vital Information Use (VIU)
#'     March 2020 Telematics and Informatics 50(101380)   
#'         
#'         
#'#########################################################

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

# Get ready  ####

## 1 Process vars as numeric  ####


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
    

##  2 Create ordered list of predictors ####
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

## 3   Assign vars to X group and to Y  ####


x <- x.vars
y <- df$int4_health

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
#'  

## 1 Explore other outcomes  ----

### a Education   ####

y <- df$int4_educ


glm.out.ed<- bic.glm(x,y, strict=FALSE, 
                         glm.family="gaussian")

summary(glm.out.ed)
imageplot.bma(glm.out.ed)


### b jobsearch  ####

y <- df$int4_jobsearch


glm.out.job<- bic.glm(x,y, strict=FALSE, 
                         glm.family="gaussian")

summary(glm.out.job)
imageplot.bma(glm.out.job)

### c Socmedia   ####

y <- df$int4_socmed


glm.out.sm <- bic.glm(x,y, strict=FALSE, 
                         glm.family="gaussian", 
                      main = " blah ")

summary(glm.out.sm)
imageplot.bma(glm.out.sm)


#  default orde is by input, probne0 and mds are options
#  see p25 https://cran.r-project.org/web/packages/BMA/BMA.pdf

# some comparisons

par(mfrow = c(2, 2))


imageplot.bma(glm.out.health, order = "input")
imageplot.bma(glm.out.ed, order = "input")
imageplot.bma(glm.out.job, order = "input")
imageplot.bma(glm.out.sm, order = "input")

imageplot.bma(glm.out.health, order = "probne0")
imageplot.bma(glm.out.ed, order = "probne0")
imageplot.bma(glm.out.job, order = "probne0")
imageplot.bma(glm.out.sm, order = "probne0")

par(mfrow = c(1, 2))
imageplot.bma(glm.out.health, order = "probne0")
imageplot.bma(glm.out.health, order = "mds")

imageplot.bma(glm.out.ed, order = "probne0")
imageplot.bma(glm.out.ed, order = "mds")




par(mfrow = c(1, 1))


