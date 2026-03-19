##---------------------------------------------------------# 
#               EDD Sub-reddit data work ----
#'               Produce analysis for HICSS
#'               Document and comment code
#'               
#'              Authors:   Ted Welser
#'                          Miracle Sammons
#'                          Will Hoffman
##---------------------------------------------------------# 
#         working width = ~  60-70 characters           60 #      70 #

# 1.0 software engineering ----

#'    Ted:  I am not a software engineer, 
#'    I am not even a programmer.  I hack together existing
#'    code and try to build re-usable bodies of code that I
#'    and others can replicate, alter and re-use.
#'    
#'    The larger point of this project is to build
#'    syntax that is easy to use multiple times, and will
#'    be as transparent as possible to future researchers.
#'    
#'    "Future" includes our future selves, but also includes
#'    other people.  So, we should be editing this project
#'    in order to make it future proof in the sense of being
#'    easy to replicate, and as clear and easy to use as
#'    possible. 
#'     
#'      Multiple principles underscore this effort, but first
#'      is raised in "What Is Software Engineering?"
#'      
#'      https://abseil.io/resources/swe-book/html/ch01.html#time_and_change
#'      
#'      "Nothing is built on stone; all is built on sand, 
#'      but we must build as if the sand were stone."
#'      
#'      Jorge Luis Borges
#'      
#'      "We see three critical differences between programming 
#'      and software engineering: time, scale, and the trade-offs at play.  
#'      On a software engineering project, engineers need to be 
#'      more concerned with the passage of time and the eventual 
#'      need for change. In a software engineering organization, 
#'      we need to be more concerned about scale and efficiency, 
#'      both for the software we produce as well as for the 
#'      organization that is producing it.
#'      
#'      Within Google, we sometimes say, “Software engineering is 
#'      programming integrated over time.” 
#'      Programming  is certainly a significant part of software 
#'      engineering: after all, programming is how you generate 
#'      new software in the first place. If you accept this 
#'      distinction, it also becomes clear that we might need to
#'      delineate between programming tasks (development) and 
#'      software engineering tasks (development, modification, 
#'      maintenance). 
#'      
#'      The addition of time adds an important new dimension to
#'      programming. Cubes aren’t squares, distance isn’t 
#'      velocity. Software engineering isn’t programming."

# * 1.01 writing clean and readable R code ----

#'     open both of these and read them
#'   
#'  1:  https://www.r-bloggers.com/2019/03/writing-clean-and-readable-r-code-the-easy-way/
#'  2:  http://stat405.had.co.nz/r-style.html
#'    2.1   notice the good and bad options
#'    
#'  The main punchline of these is to take time to make
#'  your code easier to read and easier to re-use  

##---------------------------------------------------------#

# 1.1 load packages ----

library(tidyverse)
library(googlesheets4)

rm(list=ls(all=TRUE))      # deletes old objects. 

##---------------------------------------------------------#
# 1.2 load data ----

gs4_deauth()      # this allows you to skip the google login
read_sheet("https://docs.google.com/spreadsheets/d/1LgoGLwwuuWhVnF21DmxNTe6mCS3iON2YUWPjLSC-cZY/edit?usp=sharing
           ",
  col_names = TRUE) %>%
  tibble() -> edd

#  wait for dd to appear in the Environment panel-
    
names(edd)      # confirm success by listing variable names

#  lets review how our research team created these variables for you
#   


edd$skip_class  <- ((edd$skip_class_rt)/100 )*edd$comments_coded

table(edd$skip_class)

 summary(edd$word_count)
 
 table(edd$t_subreddit)

 max(edd$sent_ave)
 
 summary(edd$ang_ave_rt)
 
  hist(edd$ang_ave_rt, 
      col = "violet",
      main = "Average anger is right skewed",
      xlab = "min=.09 median=1.9 mean=2.7 max=14.5")

 
 
 table(edd$skip_class)    # old variable name
 
  table(edd$skip_class_rt)   # new rate of # per hundred comments
  
# summary gives quartiles and basic stats except mode  
  summary(edd$skip_class_rt)
  
  min(edd$skip_class_rt)
  median(edd$skip_class_rt) 
  mean(edd$skip_class_rt)
  max(edd$skip_class_rt)
 
 hist(edd$skip_class_rt, 
      col = "violet",
      main = "Mention of ??????? per hundred comments",
      xlab = "min=.?? median=??? mean=??? max=???")
 
 
 edd$skip_class_rt    #list the first 1000 values of this var
  




##---------------------------------------------------------#
# 2.0 create new vars ----
#'    of special note are new versions of the 
#'    disengagement index,    dis_i2 and dis_raw
#'    these are what we plan to use for the HICSS paper
#'    
# * Use dis_i2 for HICSS----


edd$dis_i2 <- log(1+ edd$dont_learn_rt+
                    edd$wont_work_rt+
                    edd$do_nothing_rt+
                    edd$dont_care_rt+
                    edd$student_effort_rt+
                    edd$no_consequences_rt+
                    edd$skip_class_rt+
                    edd$no_motivation_rt)

edd$dis_raw <- (edd$dont_learn_rt+
                    edd$wont_work_rt+
                    edd$do_nothing_rt+
                    edd$dont_care_rt+
                    edd$student_effort_rt+
                    edd$no_consequences_rt+
                    edd$skip_class_rt+
                    edd$no_motivation_rt)

# create recode of dis_i2. dichotomies and factor


table(varname)


library(car)

edd$dis_yes <- recode(edd$dis_i2,
                          "0=0;
                          else = 1")

edd$dis_yf <- recode(edd$dis_yes,
                          "0='No';
                          1 = 'Yes'")

#  use this when you want to reference Disengagement
#  in a ggplot, simply dis_yf renamed and made a factor
                    
edd$Disengagment  <- as.factor(edd$dis_yf)       


table(edd$t_subreddit_f)

##---------------------------------------------------------#
# 2.2 explore new dis vars ---- 

#  without jitter

plot(edd$disengage.iln, edd$dis_i2)

# with
plot(jitter(edd$disengage.iln, factor = 8),
     jitter(edd$dis_i2, factor = 5))

#   compared to raw version of index (not logged)
plot(jitter(edd$disengage.iln, factor = 8),
     jitter(edd$dis_raw, factor = 5))

summary(edd$dis_i2)   # logged version less skewed, more transformed
summary(edd$dis_raw)   #  raw version, perhaps more interpret able?
      


#   * * NOTE----
#   the dis_i2 index includes the disengage.iln indicator vars
#   along with the nonchalance indicators

plot(edd$disengage.iln, edd$dis_i2)
summary(edd$dis_i2)

##---------------------------------------------------------#
# 2.3 add other newly created vars here----  
 


# ** 2.3 Create date to decimal for slices ----

quantile(edd$t_date_r, probs = seq(0, 1, by = 0.1)) 

library(lubridate)

#   new variable      #lubridate function called  decimal_date
edd$date_decimal <-  decimal_date(edd$t_date_r)

quantile(edd$date_decimal, probs = seq(0, 1, by = 0.1)) 

library(car)

edd$time_slice <- recode(edd$date_decimal,
          "2023.805 : 2023.91 = '01 Oct.22.23';
            2023.91 : 2024.011 = '02 Nov.29.23';
            2024.011 : 2024.119 = '03 Jan.05.24';
            2024.119 : 2024.219 = '04 Feb.13.24';
            2024.219 : 2024.331 = '05 Mar.21.24';
            2024.331 : 2024.432 = '06 May.01.24';
            2024.432 : 2024.596 = '07 Jun.07.24';
            2024.596 : 2024.699 = '08 Aug.06.24';
            2024.699 : 2024.787 = '09 Sep.13.24';
            2024.787 : 2025.028 = '10 Oct.15.24'")


edd %>%
  filter(dis_i2 > 0) -> edd_dis

summary(edd_dis$dis_i2)

table(edd$dis_quartiles)

#   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 0.1823  0.4231  0.5878  0.6554  0.8467  2.1489 

edd$dis_quartiles <- recode(edd$dis_i2,
       "0 = 'None';
       0.1823 : 0.4231 = 'Q1';
       0.4231 : 0.5878 = 'Q2';
       0.5878 : 0.8467 = 'Q3';
       0.8467 : 2.149 = 'Q4'")


##---------------------------------------------------------#
# End 2 run from top down to here----
#'   @ the start of each new session
##---------------------------------------------------------#


#  3.0 Create 3sub subset ----

#  exclude academia, Askacademia and Gradschool

#'  Don't run this until after you have made additional helpful 
#'  variables
#'  Use base R to filter less relevant sub-reddits 
#'  out of the data set
#'  This is an alternative strategy to using pipes
#'  with filter in ggplot etc.
#'  The advantage is that this edd3 represents a distinct
#'  lineage, anything applied to edd3 will not alter edd
#'  
#'  this can also be a disadvantage


edd3 <- subset(edd, 
              !(t_subreddit_f %in% c("academia", 
                                     "AskAcademia", 
                                     "GradSchool")))
 

#  notes the differences

table(edd$t_subreddit_f)

table(edd3$t_subreddit_f)

##---------------------------------------------------------#
# 4. HICSS plots ----

#  you could also, hard code a new dataset object 
#  edd %>%   filter(dis_i2 > 0) -> edd_dis

#'  note:  the plot below uses the reorder function applied to X
#'  and it defaults to ascending order by mean, but I prefer
#'  descending order, which is expressed by the "-" prior to
#'  the y value in the reorder command. 
#' 
#'  the command says,  for X, reorder categories in X
#'  by the mean level of the named var (Y) 

names(edd)    # confirm correct names of variables
#'    you can explore filtering on other combinations of 
#'    levels and variables

##---------------------------------------------------------#
#  * 4.1 Boxplots----

edd %>%
#  filter(comments_coded < 200) %>%   # switch this on and off
  filter(dis_i2 > 0) %>%
  ggplot( aes(x= reorder(t_subreddit_f, -dis_i2), y=dis_i2, fill=t_subreddit_f)) + 
	geom_boxplot() +
	xlab("Subreddit") +
	theme(legend.position="none") +
	ylab("Disengagment Index")+
  ggtitle("Distribution of threads discussing disengagment")


edd %>%
#  filter(comments_coded < 200) %>%   # switch this on and off
  filter(dis_raw > 0) %>%
  ggplot( aes(x= reorder(t_subreddit_f, -dis_raw), y=dis_raw, fill=t_subreddit_f)) + 
	geom_boxplot() +
	xlab("Subreddit") +
	theme(legend.position="none") +
	ylab("Disengagment Index")+
  ggtitle("Distribution of threads discussing disengagment")


#  **  BP for 3 largest subreddits----

edd3 %>%
#  filter(comments_coded < 200) %>%   # switch this on and off
  filter(dis_i2 > 0) %>%
  ggplot( aes(x= reorder(t_subreddit_f, -dis_i2), y=dis_i2, fill=t_subreddit_f)) + 
	geom_boxplot() +
	xlab("Subreddit") +
	theme(legend.position="none") +
	ylab("Disengagment Index")+
  ggtitle("Distribution of threads discussing disengagment")


edd3 %>%
#  filter(comments_coded < 200) %>%   # switch this on and off
  filter(dis_raw > 0) %>%
  ggplot( aes(x= reorder(t_subreddit_f, -dis_raw), y=dis_raw, fill=t_subreddit_f)) + 
	geom_boxplot() +
	xlab("Subreddit") +
	theme(legend.position="none") +
	ylab("Disengagment Index")+
  ggtitle("Distribution of threads discussing disengagment")


#  ** BP comments----

#'   I think the 6 subs plots are more interesting, and we can use them
#'   to explain our move the 3 for subsequent analysis


##---------------------------------------------------------#
# 4.2 Waffle plot----

# Miracle note:----
#'   please add syntax for making the waffle plot in two places
#'   add the needed variable creation syntax in section 2.3 or 2.4
#'   
#'   add your waffle plot syntax in this section, 4.2 

##---------------------------------------------------------#
# 4.4 

##---------------------------------------------------------#
# 5.0 3d plots----

#' note:   the different plotting packages seem to differ in their
#' definition of X,Y,Z  in terms of how they are presented.  
#' 
#' I tend to think of z as the vertical dimension,
#' and for that to show the dependent variable.
#' This first package follows that approach;  but this is not
#' necessarily normal.   in other systems the z is defined as 
#' a different dimension of the floor, and Y is defined as the 
#' vertical dimension, and thus Y should be the DV.


library(plot3D)       #  ok for static

xvar <- edd$sad_ave_rt
yvar <- edd$word_count_r
zvar <- edd$dis_i2

scatter3D(xvar, yvar, zvar, 
          bty = 'g',  pch = 18,
          phi = 10,  theta = 30,   # use to rotate
          clab = c("Student", "Disengagment", "Index"),
          main = "Reddit Education Discussions",
          zlab = "Disengaged",
          xlab = "sad",
          ylab = "Word count per 100 posts")


xvar <- edd$ai.iln
yvar <- edd$word_count_r
zvar <- edd$dis_i2


scatter3D(xvar, yvar, zvar, 
          bty = 'g',  pch = 18,
          phi = 10,  theta = 30,
          clab = c("Student", "Disengagment", "Index"),
          main = "Reddit Education Discussions",
          zlab = "Disengagment",
          xlab = "AI/Cheating",
          ylab = "Word count per 100 posts")



##---------------------------------------------------------#
# 5.2 plot in 3d rgl ----   

#   install.packages("rgl")    run this for your first time
#   this one only appears in the pop up RGL device window

library(rgl)

#   this package needs vars presented as a matrix

eds <-  tibble(edd$dis_raw,
               edd$word_count_ln,
               edd$trust_n_ave_rt)     

# var.table   <- tibble(  my.dv,      #   change the vars 
#                          iv.1,     # in here to make a different plot
#                          iv.2)     # also change your axis labels

edsm <- as.matrix(eds)

ym <- edsm[,1]
zm <- edsm[,2]
xm <- edsm[,3]
   

myplot <- plot3d(xm, ym, zm,
                 type = "p",
                 size = 3,
                 xlab = "Distrust",
                 zlab = "Word count per 100 posts",
                 ylab = "Disengagement")

options(rgl.printRglwidget = TRUE)

print(myplot)



##---------------------------------------------------------#
# 5.4 skip this car 3d ----

library("rgl")
library("car")

# create objects for each of the 3 variables
#  list them in x y z for clarity

xvar <- edd$trust_count_rt
yvar <- edd$motiv.i
zvar <- edd$dis_i2


motiv.3d <-scatter3d(x = xvar, 
         y = yvar, 
         z = zvar, 
         type = "p",
         size = 20,
         xlab = "Trust",
         ylab = "Motivation",
         zlab = "Word count",
         surface = TRUE)



options(rgl.printRglwidget = TRUE)


print(motiv.3d)




##---------------------------------------------------------#
# 6 Explore  ----

#'   This section includes the syntax used to explore aspects of the
#'   indices and other variables
##---------------------------------------------------------#

#   this makes a subset of variables that you can
#   work with as a group

hicss <- tibble(edd$dis_i2, edd$dis_yes,
               edd$screen.addict.iln,
               edd$anxiety.iln,
               edd$ai.iln)

round(cor(hicss), digits = 3)


                    

###  6.1 stacked column chart----

names(edd)

edd$dis_quartiles


# ** create shade.lists ----

red_shades <- c(
  "#ffffff",  # white  
  "#fcae91",  # light red
  "#fb6a4a",  # medium red
  "#de2d26",  # dark red
  "#a50f15")   # very dark red

green_shades <- c(
  "#ffffff",  # white
  "#c7e9c0",  # light green
  "#74c476",  # medium green
  "#31a354",  # dark green
  "#006d2c")   # very dark green

blue_shades <- c(
  "#ffffff",  # white 
  "#9ecae1",  # light blue
  "#6baed6",  # medium blue
  "#3182bd",  # dark blue
  "#08519c" ) # very dark blue

purple_shades <- c(
  "#ffffff",  # white  
  "#dadaeb",  # light purple
  "#bcbddc",  # medium purple
  "#9e9ac8",  # dark purple
  "#6a51a3")   # very dark purple



#  column plot showing all 3 subreddits

data.3 <- edd3

ggplot(data.3, aes(x = time_slice, fill = dis_quartiles)) + 
  geom_bar(stat = "count", position = "stack") +
  geom_text(
    aes(label = after_stat(count)),
    stat = "count",
    position = position_stack(vjust = 0.5),
    color = "black",
    size = 3
  ) +
  scale_fill_manual(values = red_shades) +
  labs(
    title = "All subreddits",
    x = "Time Slice",
    y = "Count",
    fill = "All 3 Subs"
  )

# prepare to make 3 plots, one for each main sub reddit

data_c <- edd3 %>%
  filter(t_subreddit_f == "college")

data_p <- edd3 %>%
  filter(t_subreddit_f == "Professors")

data_t <- edd3 %>%
  filter(t_subreddit_f == "Teachers")

#   create college, and first of the 3 plots

ggplot(data_c, aes(x = time_slice, fill = dis_quartiles)) + 
  geom_bar(stat = "count", position = "stack") +
  geom_text(
    aes(label = after_stat(count)),
    stat = "count",
    position = position_stack(vjust = 0.5),
    color = "black",
    size = 3
  ) +
  scale_fill_manual(values = green_shades) +
  labs(
    title = "Compare disengagment related threads across time and subreddit",
    x = "Time Slice",
    y = "",
    fill = "College"
  )

#   create professors, 

ggplot(data_p, aes(x = time_slice, fill = dis_quartiles)) + 
  geom_bar(stat = "count", position = "stack") +
  geom_text(
    aes(label = after_stat(count)),
    stat = "count",
    position = position_stack(vjust = 0.5),
    color = "black",
    size = 3
  ) +
  scale_fill_manual(values = blue_shades) +
  labs(
#    title = "All subreddits",
    x = "Time Slice",
    y = "",
    fill = "Professors"
  )

ggplot(data_t, aes(x = time_slice, fill = dis_quartiles)) + 
  geom_bar(stat = "count", position = "stack") +
  geom_text(
    aes(label = after_stat(count)),
    stat = "count",
    position = position_stack(vjust = 0.5),
    color = "black",
    size = 3
  ) +
  scale_fill_manual(values = purple_shades) +
  labs(
#    title = "All subreddits",
    x = "Time Slice",
    y = "",
    fill = "Teachers"
  )

# 6.2 Waffleplot ----

# Miracle, put your edited waffleplot syntax here




# 6.3  Quant analysis----


g.ai  <- tibble(edd$screen.addict.iln,
              edd$ai.iln,
              edd$com_or_title_ai_yes,
              edd$cap_ai_rt,
              edd$cap_ai_yes,
              edd$title_ai_yes,
              edd$dis_i2,
              edd$dis_yes)


library(psych) 
library(corrplot)  


pairs.panels(g.ai)

cor_matrix <- cor(g.ai %>% select_if(is.numeric),
                  use = "complete.obs") 
                   
corrplot(cor_matrix, method = 'circle')
corrplot(cor_matrix, method = 'number')
#get numbers for all cors
round(cor_matrix, digits = 3)    



g.subs  <- tibble(edd$sub_college,
              edd$sub_professors,
              edd$sub_teachers,
              edd$profan_count_rt,
              edd$dis_i2,
              edd$dis_yes)


pairs.panels(g.subs)

cor_matrix <- cor(g.subs %>% select_if(is.numeric),
                  use = "complete.obs") 
                   
corrplot(cor_matrix, method = 'circle')
corrplot(cor_matrix, method = 'number')
#get numbers for all cors
round(cor_matrix, digits = 3)    

g.neg.emote  <- tibble(
edd$ang_count_rt,
edd$ang_n_count_rt,
edd$disg_count_rt,
edd$disg_n_count_rt,
edd$sad_count_rt,
edd$sad_n_count_rt,
edd$fear_count_rt,
edd$fear_n_count_rt,
              edd$dis_i2,
              edd$dis_yes)

g.neg.emote  <- tibble(
edd$ang_count,
edd$ang_n_count,
edd$disg_count,
edd$disg_n_count_rt,
edd$sad_count_rt,
edd$sad_n_count_rt,
edd$fear_count_rt,
edd$fear_n_count_rt,
              edd$dis_i2,
              edd$dis_yes)


pairs.panels(g.neg.emote )

cor_matrix <- cor(g.neg.emote  %>% select_if(is.numeric),
                  use = "complete.obs") 
                   
corrplot(cor_matrix, method = 'circle')
corrplot(cor_matrix, method = 'number')
#get numbers for all cors
round(cor_matrix, digits = 3)  

g.pos.emote  <- tibble(
edd$joy_count_rt,
edd$joy_n_count_rt,
edd$ant_count_rt,
edd$ant_n_count_rt,
edd$surp_count_rt,
edd$surp_n_count_rt,
edd$trust_count_rt,
edd$trust_n_count_rt,
              edd$dis_i2,
              edd$dis_yes)

pairs.panels(g.pos.emote )

cor_matrix <- cor(g.pos.emote  %>% select_if(is.numeric),
                  use = "complete.obs") 
                   
corrplot(cor_matrix, method = 'circle')
corrplot(cor_matrix, method = 'number')
#get numbers for all cors
round(cor_matrix, digits = 3) 

g.index <- tibble(
              edd$i.think.iln,
              edd$they.think.iln,
              edd$thanks.iln,
              edd$exhaust.iln,
              edd$anxiety.iln,
              edd$dis_i2,
              edd$dis_yes)

 pairs.panels(g.index)

cor_matrix <- cor(g.index  %>% select_if(is.numeric),
                  use = "complete.obs") 
                   
corrplot(cor_matrix, method = 'circle')
corrplot(cor_matrix, method = 'number')
#get numbers for all cors
round(cor_matrix, digits = 3) 


g.stars  <- tibble(edd$t_upvotes_ln,
              edd$t_comments_ln,
              edd$word_per_comment,
              
              edd$sub_college,
              edd$sub_teachers,
              edd$sub_professors,             

              edd$profan_count_rt,
              edd$sad_count_rt,
              edd$ant_n_count_rt,
              edd$trust_n_count_rt,
              
              edd$screen.addict.iln,
              edd$anxiety.iln,
              edd$they.think.iln,
              edd$cap_ai_yes,
              
              edd$dis_i2,
              edd$dis_yes)

# pairs.panels(g.stars)

cor_matrix <- cor(g.stars  %>% select_if(is.numeric),
                  use = "complete.obs") 
                   
corrplot(cor_matrix, method = 'circle')
corrplot(cor_matrix, method = 'number')
#get numbers for all cors
round(cor_matrix, digits = 3) 



#------------------------------------------------#
# 6.5 regressions----

  summary(mod1 <- lm(dis_i2 ~   
            t_upvotes_ln+
             t_comments_ln+
             word_per_comment
                   , data = edd))



   summary(mod2 <- lm(dis_i2 ~   
            t_upvotes_ln+
             t_comments_ln+
             word_per_comment+
              
             sub_college+
             sub_teachers+
             sub_professors
            
                   , data = edd))


   summary(mod3 <- lm(dis_i2 ~   
            t_upvotes_ln+
             t_comments_ln+
             word_per_comment+
              
             sub_college+
             sub_teachers+
             sub_professors+             

    #         profan_count_rt+
             sad_count_rt+
     #        ant_n_count_rt+
             trust_n_count_rt
                   , data = edd))


   summary(mod4 <- lm(dis_i2 ~   
            t_upvotes_ln+
             t_comments_ln+
             word_per_comment+
              
             sub_college+
             sub_teachers+
             sub_professors+             

    #         profan_count_rt+
             sad_count_rt+
     #        ant_n_count_rt+
             trust_n_count_rt+
              
             screen.addict.iln+
             anxiety.iln+
             they.think.iln+
             cap_ai_yes
                   , data = edd))
   plot(mod4)
  
   
   
      summary(mod5 <- lm(dis_raw ~   
            t_upvotes_ln+
             t_comments_ln+
             word_per_comment+
              
             sub_college+
             sub_teachers+
             sub_professors+             

    #         profan_count_rt+
             sad_count_rt+
     #        ant_n_count_rt+
             trust_n_count_rt+
              
             screen.addict.iln+
             anxiety.iln+
             they.think.iln+
             cap_ai_yes
                   , data = edd))
   
      plot(mod5)
   plot(mod4)
   
   
    
#-----------------------------------------------------#
   #   logistic regression
   
  summary(mod1d <- glm(dis_yes ~   
            t_upvotes_ln+
             t_comments_ln+
             word_per_comment
                   , family = binomial,  data = edd))



   summary(mod2d <- glm(dis_yes ~   
            t_upvotes_ln+
             t_comments_ln+
             word_per_comment+
              
             sub_college+
             sub_teachers+
             sub_professors
            
                   , family = binomial,  data = edd))


   summary(mod3d <- glm(dis_yes ~   
            t_upvotes_ln+
             t_comments_ln+
             word_per_comment+
              
             sub_college+
             sub_teachers+
             sub_professors+             

         #    profan_count_rt+
             sad_count_rt+
          #   ant_n_count_rt+
             trust_n_count_rt
                   , family = binomial,  data = edd))


   summary(mod4d <- glm(dis_yes ~   
            t_upvotes_ln+
             t_comments_ln+
             word_per_comment+
              
             sub_college+
             sub_teachers+
             sub_professors+             

    #         profan_count_rt+
             sad_count_rt+
     #        ant_n_count_rt+
             trust_n_count_rt+
                
             screen.addict.iln+
             anxiety.iln+
             they.think.iln+
             cap_ai_yes
                   , family = binomial,  data = edd))

   # mcfadden pseudo r square
   
   with(summary(mod4d), 1 - deviance/null.deviance)
   

# 7 HICSS documentation ----

#'   wow calculates 538033 comments were coded for edd
#'   and wow3 for edd3

wow <- sum(edd$comments_coded)      # 538,033
wow3 <-  sum(edd3$comments_coded)   # 488,906

summary(edd$dis_i2)
summary(edd3$dis_i2)





# 9.  Prior index creation ----
#'--------------------------------------------------#
#' this section includes the syntax that was 
#' used to make indices included in the last section of
#' the dataset as saved in google sheets.
#' you do not need to re-run it, but it documents which
#' indicators were included.  This is a type of necessary
#' documentation.  

# 9.1 create indices ----

#   list candidate indicators
#      eliminate those with too low of a correlation
#       with the index and with each other

# * i disengagement ----

edd$disengage_r <- (edd$dont_learn_rt+
                    edd$wont_work_rt+
                    edd$do_nothing_rt+
                    edd$dont_care_rt+
                    edd$student_effort_rt+
                    edd$no_consequences_rt)

edd$disengage_iln <- log(1+ edd$dont_learn_rt+
                    edd$wont_work_rt+
                    edd$do_nothing_rt+
                    edd$dont_care_rt+
                    edd$student_effort_rt+
                    edd$no_consequences_rt)

edd$nonchal_i  <-   (edd$skip_class_rt+
                    edd$no_motivation_rt)


edd$dis_i2 <- log(1+ edd$dont_learn_rt+
                    edd$wont_work_rt+
                    edd$do_nothing_rt+
                    edd$dont_care_rt+
                    edd$student_effort_rt+
                    edd$no_consequences_rt+
                    edd$skip_class_rt+
                    edd$no_motivation_rt)

edd$dis_raw <- (edd$dont_learn_rt+
                    edd$wont_work_rt+
                    edd$do_nothing_rt+
                    edd$dont_care_rt+
                    edd$student_effort_rt+
                    edd$no_consequences_rt+
                    edd$skip_class_rt+
                    edd$no_motivation_rt)

#  * i motivation ----
                                        

edd$motiv.i <- (edd$learn_rt+
                edd$do_work_rt+
                edd$passion_rt+
                edd$motivation_rt+
                edd$intrinsic_rt+
                edd$extrinsic_rt+
                edd$interest_rt+
                edd$ownership_rt+
                edd$want_to_learn_rt+
                edd$intrinsic_motivation_rt)/9


edd$motiv.iln <- log(1 + edd$learn_rt+
                edd$do_work_rt+
                edd$passion_rt+
                edd$motivation_rt+
                edd$intrinsic_rt+
                edd$extrinsic_rt+
                edd$interest_rt+
                edd$ownership_rt+
                edd$want_to_learn_rt+
                edd$intrinsic_motivation_rt)

group.motive <-  tibble(edd$motiv.i, edd$motiv.iln,
                edd$learn_rt,
                edd$do_work_rt,
                edd$passion_rt,
                edd$motivation_rt,
                edd$intrinsic_rt,
                edd$extrinsic_rt,
                edd$interest_rt,
                edd$ownership_rt,
                edd$want_to_learn_rt,
                edd$intrinsic_motivation_rt)


library(psych) 

pairs.panels(group.motive)

library(corrplot)      

cor_matrix <- cor(group.motive %>% select_if(is.numeric),
                  use = "complete.obs") 
                   
corrplot(cor_matrix, method = 'circle')
corrplot(cor_matrix, method = 'number')
#get numbers for all cors
round(cor_matrix, digits = 3)    


# * i screen.addict ----

# stopped

edd$screen.addict.i <- (edd$phone_rt+
                        edd$distract_rt+
                        edd$addicted_rt+
                        edd$addiction_rt+
                        edd$screen_addict_rt+
                        edd$phone_addict_rt)/5

edd$screen.addict.iln <- log(1+ edd$phone_rt+
                        edd$distract_rt+
                        edd$addicted_rt+
                        edd$addiction_rt+
                        edd$screen_addict_rt+
                        edd$phone_addict_rt)

summary(edd$screen.addict.i)

summary(edd$screen.addict.iln)

hist(edd$screen.addict.i)

hist(edd$screen.addict.iln)

group.screen.addict <- tibble(edd$screen.addict.i, edd$screen.addict.iln,
                      edd$phone_rt,
                      edd$distract_rt,
                      edd$addicted_rt,
                      edd$addiction_rt,
                      edd$screen_addict_rt,
                      edd$phone_addict_rt)

library(psych) 

pairs.panels(group.screen.addict)

library(corrplot)      

cor_matrix <- cor(group.screen.addict %>% select_if(is.numeric),
                  use = "complete.obs") 
                   
corrplot(cor_matrix, method = 'circle')
corrplot(cor_matrix, method = 'number')
#get numbers for all cors
round(cor_matrix, digits = 3)    



# * i ai ----

edd$ai.i  <- (edd$cheat_rt+
              edd$plagarize_rt+
              edd$artificial_intelligence_rt+
        #      edd$ai_rt+
              edd$chat_gpt_rt+
              edd$ai_2_rt)/4

edd$ai.iln  <- log(1+ edd$cheat_rt+
              edd$plagarize_rt+
              edd$artificial_intelligence_rt+
        #      edd$ai_rt+
              edd$chat_gpt_rt+
              edd$ai_2_rt)


names(edd)


group.ai  <- tibble(edd$ai.i, edd$ai.iln,
              edd$cheat_rt,
              edd$plagarize_rt,
              edd$artificial_intelligence_rt,
       #       edd$ai_rt,    #omit due to false positives ai
              edd$chat_gpt_rt,
              edd$ai_2_rt)


library(psych) 
library(corrplot)  


pairs.panels(group.ai)

cor_matrix <- cor(group.ai %>% select_if(is.numeric),
                  use = "complete.obs") 
                   
corrplot(cor_matrix, method = 'circle')
corrplot(cor_matrix, method = 'number')
#get numbers for all cors
round(cor_matrix, digits = 3)    




# * i mental health ----



edd$anxiety.i <- (edd$depress_rt+
                  edd$stress_rt+
                  edd$anxious_rt+
                  edd$anxiety_rt+
                  edd$mental_health_rt)/4

edd$anxiety.iln <- log(1+edd$depress_rt+
                  edd$stress_rt+
                  edd$anxious_rt+
                  edd$anxiety_rt+
                  edd$mental_health_rt)



group.anxiety <- tibble(edd$anxiety.i,
                  edd$depress_rt,
                  edd$stress_rt,
                  edd$anxious_rt,
                  edd$anxiety_rt,
                  edd$mental_health_rt)


library(psych) 
library(corrplot)  


pairs.panels(group.anxiety)

cor_matrix <- cor(group.anxiety %>% select_if(is.numeric),
                  use = "complete.obs") 
                   
corrplot(cor_matrix, method = 'circle')
corrplot(cor_matrix, method = 'number')
#get numbers for all cors
round(cor_matrix, digits = 3)   


# * i i think ----

edd$i.think.i <- (edd$i_believe_rt+
                  edd$i_do_believe_rt+
                  edd$i_feel_rt+
                  edd$i_know_rt+
                  edd$i_just_think_rt+
                  edd$i_think_rt+
                  edd$i_thought_rt+
                  edd$i_agree_rt)/8

edd$i.think.iln <- log(1 + edd$i_believe_rt+
                  edd$i_do_believe_rt+
                  edd$i_feel_rt+
                  edd$i_know_rt+
                  edd$i_just_think_rt+
                  edd$i_think_rt+
                  edd$i_thought_rt+
                  edd$i_agree_rt)




group.i.think <- tibble(edd$i.think.i, edd$i.think.iln,
                          edd$i_believe_rt,
                          edd$i_do_believe_rt,
                          edd$i_feel_rt,
                          edd$i_know_rt,
                          edd$i_just_think_rt,
                          edd$i_think_rt,
                          edd$i_thought_rt,
                          edd$i_agree_rt)


library(psych) 
library(corrplot)  


pairs.panels(group.i.think)

cor_matrix <- cor(group.i.think %>% select_if(is.numeric),
                  use = "complete.obs") 
                   
corrplot(cor_matrix, method = 'circle')
corrplot(cor_matrix, method = 'number')
#get numbers for all cors
round(cor_matrix, digits = 3)  


# * i they think ----

edd$they.think.i  <-  (edd$they_believe_rt+
                      edd$they_claim_rt+
                      edd$they_say_rt+
                      edd$they_think_rt+
                      edd$they_want_rt)/4

edd$they.think.iln  <-  log(1+ edd$they_believe_rt+
                      edd$they_claim_rt+
                      edd$they_say_rt+
                      edd$they_think_rt+
                      edd$they_want_rt)


group.they.think  <-  tibble(edd$they.think.i, edd$they.think.iln,
                      edd$they_believe_rt,
                      edd$they_claim_rt,
                      edd$they_say_rt,
                      edd$they_think_rt,
                      edd$they_want_rt)

library(psych) 
library(corrplot)  


pairs.panels(group.they.think)

cor_matrix <- cor(group.they.think %>% select_if(is.numeric),
                  use = "complete.obs") 
                   
corrplot(cor_matrix, method = 'circle')
corrplot(cor_matrix, method = 'number')
#get numbers for all cors
round(cor_matrix, digits = 3)  


# * i thanks ----

edd$thanks.i <- (edd$appreciate_rt+
                  edd$grateful_rt+
                  edd$thank_you_rt+
                  edd$thanks_rt)/3

edd$thanks.iln <- log(1+ edd$appreciate_rt+
                  edd$grateful_rt+
                  edd$thank_you_rt+
                  edd$thanks_rt)

group.thanks <- tibble(edd$thanks.i, edd$thanks.iln,
                  edd$appreciate_rt,
                  edd$grateful_rt,
                  edd$thank_you_rt,
                  edd$thanks_rt)


library(psych) 
library(corrplot)  


pairs.panels(group.thanks)

cor_matrix <- cor(group.thanks %>% select_if(is.numeric),
                  use = "complete.obs") 
                   
corrplot(cor_matrix, method = 'circle')
corrplot(cor_matrix, method = 'number')
#get numbers for all cors
round(cor_matrix, digits = 3)  



edd$exhaust.i <- (edd$exhaustion_rt+
                  edd$i_am_done_rt)
             #     edd$cant_rt)/2

edd$exhaust.iln <- log(1 + edd$exhaustion_rt+
                  edd$i_am_done_rt)
             #     edd$cant_rt)

plot(edd$cant_rt, edd$exhaust.i)


group.exhaust <-   tibble(edd$exhaust.i, 
edd$exhaust.iln,
edd$exhaustion_rt,
edd$i_am_done_rt,
edd$cant_rt)

edd$exhaust.i



cor_matrix <- cor(group.exhaust %>% select_if(is.numeric),
                  use = "complete.obs") 
                   
corrplot(cor_matrix, method = 'circle')
corrplot(cor_matrix, method = 'number')
         

 


