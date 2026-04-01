#  6110 in class  4/1/2026
#'
#'   
#'
#'---------------------------------------------------#
#

rm(edd)
rm(group1)

# load packages

library(tidyverse)
library(data.table)

# load data
edd<- fread("platform.csv")

-

edd$fear_count_rt,
edd$negative_sanctions_iln,
edd$consumer_model_iln,
edd$enshittification_iln

#    3 indices----
 
#_______________  use 3 indices to find cases  ____________#
 
# work with your 3 key variables----
 
beatles <- tibble(edd$fear_count_rt,
                 edd$negative_sanctions_iln,
                 edd$consumer_model_iln,
                 edd$enshittification_iln)

queen <- tibble(
  edd$ai_iln,
  edd$enshittification_iln,
  edd$fear_count_rt,
  edd$trust_count_rt,
  edd$trust_n_count_rt,
  edd$consumer_model_iln,
  edd$burned_out_iln,
  edd$ai_to_write_iln,
  edd$not_interested_rt,
  edd$negative_sanctions_iln)


 
install.packages("psych")
library(psych)
 
pairs.panels(queen)    # this is fast way to make scatterplots
 



summary(beatles)
 
# edd$fear_count_rt edd$negative_sanctions_iln edd$consumer_model_iln edd$enshittification_iln
# Min.   :  0.00    Min.   :0.0000             Min.   :0.000000       Min.   :0.0000          
# 1st Qu.: 22.22    1st Qu.:0.0000             1st Qu.:0.000000       1st Qu.:0.0000          
# Median : 33.73    Median :0.0000             Median :0.000000       Median :0.0000          
# Mean   : 38.00    Mean   :0.1703             Mean   :0.006477       Mean   :0.0297          
# 3rd Qu.: 48.48    3rd Qu.:0.0000             3rd Qu.:0.000000       3rd Qu.:0.0000          
# Max.   :283.33    Max.   :3.4340             Max.   :1.981001       Max.   :2.2336    
 
# The modern tidyverse equivalent for recoding a numeric variable 
# into a dummy variable based on a quartile value involves using
# the dplyr functions mutate() and case_when().
 
# Since the 3rd quartile value for edd$ai_iln is explicitly 
# given as 0.8708, you can use this constant directly in your 
# recode logic. The new variable, which I'll call ai_iln_dummy, 
# will be 1 if edd$ai_iln is greater than 0.8708, and 0 otherwise.
 
# Here is the R code:
library(tidyverse) # Ensure the tidyverse package (which includes dplyr) is loaded
 
edd <- edd %>%
  mutate(
    # Create the new dummy variable: ai_iln_dummy
    fear_count_rt_dummy = case_when(
      # Condition: The value is greater than the 3rd quartile (0.8708)
      fear_count_rt > 48.48 ~ 1,
      # Default: All other cases (less than or equal to 0.8708) are 0
      TRUE ~ 0
    )
  )
 
# Optional: Display the frequency table for the new dummy variable
edd %>%
  count(ai_iln_dummy)
 
#  repeat this process for your other 2 indices
 
edd <- edd %>%
  mutate(
    # Create the new dummy variable: phone_distraction_iln_dummy
    negative_sanctions_iln_dummy = case_when(
      # Condition: The value is greater than the 3rd quartile (0.7683)
      negative_sanctions_iln > 0.1703 ~ 1,
      # Default: All other cases (less than or equal to 0.7683) are 0
      TRUE ~ 0
    )
  )
 
# Optional: Display the frequency table for the new dummy variable
edd %>%
  count(phone_distraction_iln_dummy)
 
edd <- edd %>%
  mutate(
    # Create the new dummy variable: feed_socials_iln_dummy
    consumer_model_iln_dummy = case_when(
      # Condition: The value is greater than the 3rd quartile (0.7885)
      consumer_model_iln > 0.006477 ~ 1,
      # Default: All other cases (less than or equal to 0.7885) are 0
      TRUE ~ 0
    )
  )
 
# Optional: Display the frequency table for the new dummy variable
edd %>%
  count(consumer_model_iln_dummy)
 
 
edd <- edd %>%
  mutate(
    # Create the new dummy variable: feed_socials_iln_dummy
    enshittification_iln_dummy = case_when(
      # Condition: The value is greater than the 3rd quartile (0.7885)
      enshittification_iln > 0.0297 ~ 1,
      # Default: All other cases (less than or equal to 0.7885) are 0
      TRUE ~ 0
    )
  )



#   add up the three dummy vars----
 
edd$key_combo <-  (edd$fear_count_rt_dummy +
                        edd$negative_sanctions_iln_dummy +
                     edd$consumer_model_iln_dummy +
                     edd$enshittification_iln_dummy )
 
edd$key_combo_factor <-  as.factor(edd$key_combo)
 
library(car) 

edd$morethan2 <- recode(edd$key_combo,
                        "2.5:4 =1;
                        else = 0")
edd %>%
  filter(, morethan2==1)-> beatle_threads
library(googlesheets4)
gs4_auth()



1#   create categorical scatterplot
 
install.packages("ggthemes")
library(ggthemes)

write_sheet(beatle_threads, sheet = "sgt.pepper")

 
ggplot(
  data = edd,
  mapping = aes(x = fear_count_rt, y = key_combo, 
                color = key_combo_factor, shape = key_combo_factor),  )+
  geom_jitter() +
  geom_smooth(method = "lm")+
  labs(
    title = "Fear & co-occurance of key variables",
    subtitle = "I will focus on threads on the right (higher fear) side the  groups",
    x = "Fear",
    y = "Key Combo"
  ) +
  scale_color_colorblind()
