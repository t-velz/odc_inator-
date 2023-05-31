#'      sentiment_inator.R #######################################################
#'  
#'  
#'  Main code written by Ted Welser, 5/2/2023
#'  "Behold my new evil scheme, the (sentiment)-inator!"
#'  
#'  
#'      additions by Morgan Thurston  ???
#'      additions by Sam Smith?,   ???? 
#'      additions by Mila Gmerek   ????
#'  
#'  An attempt to standardize the application of sentiment and emotion
#'  detection to text variables aka qualitative comments.
#'  
#'  The syntax assumes you have a tidy dataset stored as a sheet 
#'  in google sheets.
#'  
#'  In a near future, this syntax will be re-written so that it is 
#'  properly functionalized.
#'  
#'    However, I did manage to use a for loop and simplify
#'    the collection of emotions and negations of those emotions
#'  
#'  
#'  
#'  
# ____________________________End of Section____________________________________


#  clear out old objects

rm(list=ls(all=TRUE))  


#    need to learn how to use projects correctly
#       instead I keep hard-coding a working directory 
#                like a little green donkey

getwd()

setwd("C:/Users/welser/Desktop/desktop_1/R_projects/redd3")


#  Load Packages:
library(googlesheets4)
library(tidyverse)
library(sentimentr)
library(janitor)



read_sheet(
  "https://docs.google.com/spreadsheets/d/1lNBnUVfVuarANQ9zt7bT7OksfbSABIpBU1RfoEEkhR0/edit?usp=sharing",
               col_names = TRUE) %>%
  janitor::clean_names() %>%
  tibble() -> df


names(df)

summary(df)

df %>%
  mutate(
    sh_fake_reason = as.character(sh_fake_reason),
    sh_authentic_reason = as.character(sh_authentic_reason)
  ) -> df


df %>%
  filter(ssubset == 1) -> df


summary(df$sh_fake_reason)       #length 238  class character  w000t

#'  #######################################################
#'  
#'     Now, we shall use the sentimentr  package to collect sentiment, 
#'     profanity, and emotion variables from two different content
#'     responses, the first on why they thought a video was fake
#'     the second on they thought the video was authentic


df$sh_fake_reason

#      measure sentiment from this set of responses

fake_s <- sentiment_by(df$sh_fake_reason)

#'     these write the three newly established 
#'     variables that we want copy from
#'     from fake_s onto our full working dataset

df$f_word_count <- fake_s$word_count
df$f_sent.sd <- fake_s$sd
df$f_sent.ave <- fake_s$ave_sentiment


###   here we repeat the process looking for profanity!
##'    oh, my!   I did not bother getting the word count
##'    again, because we already made a variable of word count.


fran <- profanity_by(df$sh_fake_reason)

df$f_profan_count  <- fran$profanity_count
df$f_profan_ave  <- fran$ave_profanity

#   turns out in Sam's data the "fake" reasons, lacks profanity
#      but we measured it all the same!



sh_authentic_reason



auth_s <- sentiment_by(df$sh_authentic_reason)

#'     these write the three newly established 
#'     variables that we want copy from
#'     from fred onto our full working dataset

df$a_word_count <- auth_s$word_count
df$a_sent.sd <- auth_s$sd
df$a_sent.ave <- auth_s$ave_sentiment


###   here we repeat the process looking for profanity!
##'    oh, my!   I did not bother getting the word count
##'    again, because we already made a variable of word count.


frank <- profanity_by(df$sh_authentic_reason)

df$a_profan_count  <- frank$profanity_count
df$a_profan_ave  <- frank$ave_profanity




#############################################################
#'   
#'   generate all 16 emotion and negation of that emotion variables
#'   as counts and percentages of total words in content sample
#'   
#'   #'	count	emote	name
#'	1	anger	ang
#'	2	anger_negated	ang_n
#'	3	anticipation	ant
#'	4	anticipation_negated	ant_n
#'	5	disgust	disg
#'	6	disgust_negated	disg_n
#'	7	fear	fear
#'	8	fear_negated	fear_n
#'	9	joy	joy
#'	10	joy_negated	joy_n
#'	11	sadness	sad
#'	12	sadness_negated	sad_n
#'	13	surprise	surp
#'	14	surprise_negated	surp_n
#'	15	trust	trust
#'	16	trust_negated	trust_n


#'     use this reference to copy a table of emotions and
#'     shortened names for those to be used in var names
#'

read_sheet(
  "https://docs.google.com/spreadsheets/d/18EE_2cDFV8mZzntxKbGs5SrZzijVPiU_2wj7uoRkWU4/edit?usp=sharing",
     col_names = TRUE) %>%
  tibble() -> emote_ref



#'   In order to apply this to a different dataset
#'    replace the target variable with the correct var 
#'    for your data.frame
#'    also, replace the target name



t_var <- df$sh_fake_reason
t_name <- "fake_"

thelma <- emotion_by(t_var)

pass <- 1

for (i in 1:16)  {
 
emote_now <- emote_ref$emote[pass]
emote_name <- emote_ref$name[pass]

thelma %>%
  filter(emotion_type == emote_now) %>%
   mutate() %>%
      as_tibble  ->  emote_now_table


df[paste0(t_name, emote_name, "_ave" )] <- as.numeric(emote_now_table$ave_emotion)
df[paste0(t_name, emote_name, "_count")] <- as.numeric(emote_now_table$emotion_count)

pass <- pass + 1

print (emote_name)

}


#############################################################
#'    replace the target variable with the correct var 
#'    for your dataframe
#'    also, replace the target name

t_var <- df$sh_authentic_reason
t_name <- "auth_"

############################################################

thelma <- emotion_by(t_var)

pass <- 1

for (i in 1:16)  {
 
emote_now <- emote_ref$emote[pass]
emote_name <- emote_ref$name[pass]

thelma %>%
  filter(emotion_type == emote_now) %>%
   mutate() %>%
      as_tibble  ->  emote_now_table


df[paste0(t_name, emote_name, "_ave" )] <- as.numeric(emote_now_table$ave_emotion)
df[paste0(t_name, emote_name, "_count")] <- as.numeric(emote_now_table$emotion_count)

pass <- pass + 1

print (emote_name)

}



names(df)


tiktok_sent <- gs4_create("tiktok_sent",
                         sheets = df)
  

#'     url for the data set that I just wrote to googlesheets
#'     https://docs.google.com/spreadsheets/d/1qrR3_UP9WbusJRlpbwEFYqWoZ2czVjwe2-pHQypIqW0/edit?usp=sharing
#'     

############################################
#'
#'      list of variable names prior to var 
#'      creation
#'         see end for list of variables produced from above 
#'         syntax
###########################################

case,
age,
use_time,
fq_open,
length_use,
fq_like,
fq_own_comment,
fq_respond_comment,
fq_share_vid,
fq_private_message,
importance,
rel_use_r,
tp_academic,
tp_alt,
tp_animals,
tp_art,
tp_beauty,
tp_challenges,
tp_conspiracies,
tp_dancing,
tp_fan,
tp_fashion,
tp_finance,
tp_fitness,
tp_foodie,
tp_homestead,
tp_life,
tp_magic,
tp_memes,
tp_mental,
tp_nature,
tp_news,
tp_nostalgia,
tp_paranormal,
tp_parenting,
tp_partying,
tp_political,
tp_pranks,
tp_professional,
tp_queer,
tp_relationships,
tp_renovation,
tp_singing,
tp_straight,
tp_technical,
tp_true,
tp_other,
have_posted_r,
creator,
consumer,
fq_post,
intended_audience_broad,
dl_sos,
dl_humor,
dl_entertain,
dl_escape,
dl_community,
dl_find_self,
dl_find_products,
dl_relatable,
dl_fit_in,
dl_famous,
dl_news,
dl_politics,
dl_inform_others,
dl_trends,
dl_learn,
dl_pass_time,
dl_relax,
dl_attractive,
dl_celebrities,
dl_other,
pos_happy,
pos_true_self,
pos_confident,
pos_educated,
pos_productive,
pos_unique,
pos_calm,
pos_express,
pos_closer,
pos_popular,
pos_new_products,
pos_fitting_in,
pos_identification,
pos_new_people,
pos_new_thinking,
pos_new_trying,
pos_unplug,
pos_none,
pos_other,
neg_addiction,
neg_cancel,
neg_comparing,
neg_cyberbullying,
neg_distraction,
neg_disturbing,
neg_misinformation,
neg_divided,
neg_harassment,
neg_less_time_4_others,
neg_privacy,
neg_attention_span,
neg_stalking,
neg_censored,
neg_body_standards,
neg_mental,
neg_none,
neg_other,
fq_buy_fashion,
fq_display_purchase,
fq_connect_fr_s,
fakeness,
fq_new_material,
fr_importance,
lst_yr_fit_in_r,
lst_yr_pop_culture_r,
lst_yr_celebrities_r,
lst_yr_pol_engage_r,
lst_yr_stress_r,
lst_yr_current_events_r,
tt_makes_same_r,
control_content_r,
concern_alg_r,
fq_desired_content,
too_much_time,
limit,
timespent_meaningfully,
timespent_wastefully,
effect_unique_r,
effect_change_mind_r,
effect_identity_r,
effect_new_cultures_r,
effect_new_communities_r,
effect_creative_r,
effect_kindness_r,
effect_pol_awareness_r,
effect_unity_r,
tt_overall_pos,
ghq_less_concentrate,
ghq_lost_sleep,
ghq_not_useful,
ghq_cannot_decide,
ghq_strain,
ghq_cannot_overcome,
ghq_cannot_enjoy_activity,
ghq_cannot_face_problems,
ghq_unhappy_depressed,
ghq_losing_confidence,
ghq_worthless,
ghq_less_happy,
tt_helps_lonely,
tt_hurts_concentrate,
tt_gets_me_through,
feel_anxious,
feel_confident,
feel_happy,
feel_strained,
feel_unhappy,
feel_useful,
feel_worthless,
overall_harm_mental,
fr_use_use,
fr_use_trends,
fr_use_send,
fr_use_reference,
fr_use_ignored,
fr_use_addicted,
fr_use_political,
fr_time_occupy,
r_native_am,
r_hispanic,
r_mid_eastern,
r_white,
r_asian,
r_pac_island,
r_black,
r_indian,
r_other,
class,
gender,
edu,
pol_r,
other_pol,
sh_num_incomplete,
sh_participate,
femininity,
masculinity,
overall_harm_mental_r,
sh_fake_reason,  sh_authentic_reason,
creator_intent_fake,
creator_character_fake,
content_fake,
production_fake,
dramaturgy,
profiteering,
digital_alteration,
physical_alteration,
idealization,
misinformation,
disbelief,
pranks,
literal_fakeness,
nature,
na_fake,
sh_authentic_reason,
creator_intent_auth,
creator_character_auth,
content_auth,
production_auth,
relatability,
transparency,
health,
vulnerability,
purity,
utility,
proximity,
expertise,
good_marketing,
representational_parity,
rawness,
originality,
literal_authenticity,
na_auth,
ssubset,

#                                    new vars!
  

f_word_count		,
f_sent.sd		,
f_sent.ave		,
f_profan_count		,
f_profan_ave		,
a_word_count		,
a_sent.sd		,
a_sent.ave		,
a_profan_count		,
a_profan_ave		,
fake_ang_ave		,
fake_ang_count		,
fake_ang_n_ave		,
fake_ang_n_count		,
fake_ant_ave		,
fake_ant_count		,
fake_ant_n_ave		,
fake_ant_n_count		,
fake_disg_ave		,
fake_disg_count		,
fake_disg_n_ave		,
fake_disg_n_count		,
fake_fear_ave		,
fake_fear_count		,
fake_fear_n_ave		,
fake_fear_n_count		,
fake_joy_ave		,
fake_joy_count		,
fake_joy_n_ave		,
fake_joy_n_count		,
fake_sad_ave		,
fake_sad_count		,
fake_sad_n_ave		,
fake_sad_n_count		,
fake_surp_ave		,
fake_surp_count		,
fake_surp_n_ave		,
fake_surp_n_count		,
fake_trust_ave		,
fake_trust_count		,
fake_trust_n_ave		,
fake_trust_n_count		,
auth_ang_ave		,
auth_ang_count		,
auth_ang_n_ave		,
auth_ang_n_count		,
auth_ant_ave		,
auth_ant_count		,
auth_ant_n_ave		,
auth_ant_n_count		,
auth_disg_ave		,
auth_disg_count		,
auth_disg_n_ave		,
auth_disg_n_count		,
auth_fear_ave		,
auth_fear_count		,
auth_fear_n_ave		,
auth_fear_n_count		,
auth_joy_ave		,
auth_joy_count		,
auth_joy_n_ave		,
auth_joy_n_count		,
auth_sad_ave		,
auth_sad_count		,
auth_sad_n_ave		,
auth_sad_n_count		,
auth_surp_ave		,
auth_surp_count		,
auth_surp_n_ave		,
auth_surp_n_count		,
auth_trust_ave		,
auth_trust_count		,
auth_trust_n_ave		,
auth_trust_n_count		,
