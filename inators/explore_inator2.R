# Header                                            ##### 
#'    standard opening procedures               
#'    
#'   
#'         Main code written by Ted Welser, 
#'         5/17/2023  to  7/14/2023
#'         
#'         
#'         and 
#'         Sam Smith,    
#'         6/2/2023     to
#'         ??
#'               
#'           _.-^~~^^^`~-,_,,~''''''```~,''``~'``~,
#' ______,'  -o  :.  _    .          ;     ,'`,  `.
#' (      -\.._,.;;'._ ,(   }        _`_-_,,    `, `,
#'  ``~~~~~~'   ((/'((((____/~~~~~~'(,(,___>      `~' 
#                       #                               #


# *********************************************
# 1 Load Packages, remove objects, load dataset         ####
# *********************************************
library(googlesheets4)
library(tidyverse)


rm(list=ls(all=TRUE)) 



read_sheet(
  "https://docs.google.com/spreadsheets/d/1JQFCPc0TI7tuQIe0I1tWFk4LVr-aHkjbehP7BFprj3g/edit?usp=sharing",
               col_names = TRUE) %>%
  tibble() -> tk2


#   this google sheet version of the dataset is called   tk_ds_new
#    it includes the negation variables where we read through possible false positives 
#      related to each of the indices

names(tk2)

#   the same variables are listed at the end of this file.
#   we will make several more in the course of normal exploration


# *********************************************
# 2 Explore                                ####
# *********************************************



#               you can make subsets of variables with ranges
#                but I ended up not using this
# tk2  %>%
#  select(age : rel_use_r,
#         have_posted_r : intended_audience_broad,
#         pos_happy : neg_other)   ->  tk2sub

# summary(tk2sub)



## demographics  ####

#'   see survey text, but age is coded 2-10
#'   https://docs.google.com/document/d/1j1UZvpKECsgauMUM5F-x_FrmEvMZ-Ads/edit
#'   
#'   
#'   2=18
#'   3=19
#'   . . .
#'   10=  26+

table(tk2$age)

table(tk2$femininity)

# conditional distribution of ordinal variables

table(tk2$femininity, tk2$age)

 # or this perhaps is easier to read

table(tk2$age, tk2$femininity)



##  use of tiktok   ####

table(tk2$use_time)

table(tk2$fq_open)

#   conditional distribution of opening rates and use time

table(tk2$fq_open, tk2$use_time)

#   the next variable is treated as ordinal, but you could 
#   make an argument that these are perhaps, categorical in
#   terms of user types

table(tk2$intended_audience_broad)    #  1 =  just a couple of friends

## new var, exposure as use time plus number of opens

tk2$use_plus_opens <- tk2$use_time + tk2$fq_open

#  wasteful and not meaningful

plot(tk2$timespent_meaningfully, tk2$timespent_wastefully)

#  plot inverse of time meaningfully spent

plot((100-tk2$timespent_meaningfully), tk2$timespent_wastefully)

tk2$time_meaningless <- (100 - tk2$timespent_meaningfully)

#'   here is another strategy for combining two variables
#'   that are clearly negatively related
#'   

tk2$waste.no.meaning <- tk2$time_meaningless + tk2$timespent_wastefully
                      
plot(tk2$timespent_wastefully, tk2$waste.no.meaning)

cor(tk2$timespent_wastefully, tk2$waste.no.meaning)

#   Earlier, I did not perform due diligence on these indices
#     but I came back and constructed a large 


tk2$neg_index <-(
      tk2$neg_addiction+
      tk2$neg_cancel+
      tk2$neg_comparing+
#      tk2$neg_cyberbullying+
      tk2$neg_distraction+
      tk2$neg_disturbing+
      tk2$neg_misinformation+
      tk2$neg_divided+
      tk2$neg_harassment+
      tk2$neg_less_time_4_others+
      tk2$neg_privacy+
      tk2$neg_attention_span+
      tk2$neg_stalking+
#      tk2$neg_censored+
      tk2$neg_body_standards+
      tk2$neg_mental-
      tk2$neg_none)

tk2$pos_index <- (			
	tk2$	pos_happy	+
	tk2$	pos_true_self	+
	tk2$	pos_confident	+
	tk2$	pos_educated	+
	tk2$	pos_productive	+
	tk2$	pos_unique	+
	tk2$	pos_calm	+
	tk2$	pos_express	+
	tk2$	pos_closer	+
	tk2$	pos_popular	+
	tk2$	pos_new_products	+
	tk2$	pos_fitting_in	+
	tk2$	pos_identification	+
	tk2$	pos_new_people	+
	tk2$	pos_new_thinking	+
	tk2$	pos_new_trying	
#	tk2$	pos_unplug	
	   - tk2$	pos_none	)


#  some of the missing due diligence

group.neg <- data.frame(tk2$neg_index,
tk2$neg_addiction,
tk2$neg_cancel,
tk2$neg_comparing,
tk2$neg_cyberbullying,
tk2$neg_distraction,
tk2$neg_disturbing,
tk2$neg_misinformation,
tk2$neg_divided,
tk2$neg_harassment,
tk2$neg_less_time_4_others,
tk2$neg_privacy,
tk2$neg_attention_span,
tk2$neg_stalking,
tk2$neg_censored,
tk2$neg_body_standards,
tk2$neg_mental,
tk2$neg_none)

round(cor(group.neg), digits = 3)

# consider dropping   neg_censored and neg_cyberbullying
#  from the index,  include as individual vars?
  

group.pos <- data.frame(tk2$pos_index,
tk2$pos_happy,
tk2$pos_true_self,
tk2$pos_confident,
tk2$pos_educated,
tk2$pos_productive,
tk2$pos_unique,
tk2$pos_calm,
tk2$pos_express,
tk2$pos_closer,
tk2$pos_popular,
tk2$pos_new_products,
tk2$pos_fitting_in,
tk2$pos_identification,
tk2$pos_new_people,
tk2$pos_new_thinking,
tk2$pos_new_trying,
tk2$pos_unplug,
tk2$pos_none)

round(cor(group.pos), digits = 3)

#   consider dropping pos_unplug     cor is clearly lower than others
#    consider adding as single var to analysis or dropping entirely


#  engagement:

#   this exploration convinced me to avoid large indices of these items
#     due to generally low inter correlation


tk2$engagement <- ( 
        tk2$fq_like+
            tk2$fq_own_comment+
            tk2$fq_respond_comment+
            tk2$fq_share_vid+
            tk2$fq_private_message
            )

group.engagement <- cbind(
            tk2$fq_like,
            tk2$fq_own_comment,
            tk2$fq_respond_comment,
            tk2$fq_share_vid,
            tk2$fq_private_message,
            tk2$engagement)

library(psych)

pairs.panels(group.engagement)


tk2$messaging <- ( 
            tk2$fq_own_comment+
            tk2$fq_respond_comment+
            tk2$fq_private_message
            )

tk2$comments_ro <- ( 
            tk2$fq_own_comment+
            tk2$fq_respond_comment
            )

#   this exploration convinced me to avoid large indices
#     due to generally low inter correlation

group.messaging <- cbind(
    tk2$use_time,
    tk2$fq_open,
    tk2$use_plus_opens,
            tk2$fq_like,
            tk2$fq_own_comment,
            tk2$fq_respond_comment,
            tk2$fq_share_vid,
            tk2$fq_private_message,
            tk2$engagement,
            tk2$messaging,
    tk2$comments_ro)

round(cor(group.messaging), digits=3)
s

summary(tk2$ghq)
names(tk2)

# commitment / importance

importance
rel_use_r

# creator or consumer

hist(tk2$fq_post)

hist(tk2$have_posted_r)

hist(tk2$creator)

hist(tk2$consumer)    # make 100- consumer

tk2$anti_consumer <- 100 - tk2$consumer

plot(tk2$consumer, tk2$creator)
plot(tk2$anti_consumer, tk2$creator)

hist(tk2$intended_audience_broad)

#  consider recoding intended audience into categorical
#     might be important non linearities between the types


#social causes of use / adoption

tk2$dl_sos          # friends use
tk2$dl_fit_in       
tk2$fr_importance

tk2$creator,
tk2$consumer,

## get overall GHQ score grounded at 0


tk2$ghq <- (tk2$ghq_less_concentrate+
             tk2$ghq_lost_sleep+
             tk2$ghq_not_useful+
             tk2$ghq_cannot_decide+
             tk2$ghq_strain+
             tk2$ghq_cannot_overcome+
             tk2$ghq_cannot_enjoy_activity+
             tk2$ghq_cannot_face_problems+
             tk2$ghq_unhappy_depressed+
             tk2$ghq_losing_confidence+
             tk2$ghq_worthless+
             tk2$ghq_less_happy) - 12

summary(tk2$ghq)
sd(tk2$ghq)
hist(tk2$ghq)


## distressed scores are 15 or above -- create dichotomous measure

library(QCA)

tk2$ghq_distress <- recode(tk2$ghq,
                          "0:14=0;
                          15:36=1")

summary(tk2$ghq_distress)
sd(tk2$ghq_distress)
hist(tk2$ghq_distress)


## severe scores are 20 or above -- create dichotomous measure



tk2$ghq_severe <- recode(tk2$ghq,
                        "0:19=0;
                          20:36=1")

summary(tk2$ghq_severe)
sd(tk2$ghq_severe)
hist(tk2$ghq_severe)

#   create log version of follow count, add one to avoid NAN


tk2$ln_followers  <- log(tk2$followers +1)


plot(tk2$ln_followers, tk2$ghq)





#

hist(tk2$f_word_count)
hist(tk2$a_word_count)

summary(tk2$f_word_count)ds
summary(tk2$a_word_count)

plot(tk2$a_word_count, tk2$f_word_count)




###############################################

# Authentic and fake themes exploration   ###

ath.fake.themes <- data.frame(
tk2$at_accurate,
tk2$at_attention,
tk2$at_credible,
tk2$at_dishonest,
tk2$at_educate,
tk2$at_health,
tk2$at_humor,
tk2$at_inherent,
tk2$at_lived.experience,
tk2$at_original,
tk2$at_personal,
tk2$at_profit,
tk2$at_pure,
tk2$at_raw,
tk2$at_reflect,
tk2$at_relatable,
tk2$at_show_off,
tk2$at_staged,
tk2$at_transparent,
tk2$at_utility,
tk2$neg_at_profit,
tk2$neg_at_show_off,
tk2$neg_at_staged,
tk2$neg_at_dishonest,
tk2$ft_accurate,
tk2$ft_attention,
tk2$ft_credible,
tk2$ft_dishonest,
tk2$ft_educate,
tk2$ft_health,
tk2$ft_humor,
tk2$ft_inherent,
tk2$ft_lived.experience,
tk2$ft_original,
tk2$ft_personal,
tk2$ft_profit,
tk2$ft_pure,
tk2$ft_raw,
tk2$ft_reflect,
tk2$ft_relatable,
tk2$ft_show_off,
tk2$ft_staged,
tk2$ft_transparent,
tk2$ft_utility,
tk2$neg_ft_accurate,
tk2$neg_ft_credible,
tk2$neg_ft_educate,
tk2$neg_ft_health,
tk2$neg_ft_humor,
tk2$neg_ft_inherent,
tk2$neg_ft_lived.experience,
tk2$neg_ft_original,
tk2$neg_ft_personal,
tk2$neg_ft_pure,
tk2$neg_ft_raw,
tk2$neg_ft_reflect,
tk2$neg_ft_relatable,
tk2$neg_ft_transparent,
tk2$neg_ft_utility)

summary(ath.fake.themes)

#   I used the summary to create the mean, and then
#   pasted the output into notepad and noticed a pattern
#     see as discussed in our paper

#    

# *********************************************
# 5 Descriptives                                ####
# *********************************************

#  use cbind to abvoid var names on columns of corr table

dvs <- cbind(
              tk2$at_accurate,
              tk2$at_reflect,
              tk2$at_inherent,
              tk2$at_pure,
              tk2$ft_staged,
              tk2$ft_dishonest,
              tk2$tt_overall_pos,
              tk2$fakeness,
              tk2$waste.no.meaning, 
              tk2$neg_index,
              tk2$pos_index)

#   use data.frame to include var name on rows of corr table

model.vars1 <- data.frame(
                                    # demographics
                  tk2$age,
                  tk2$r_white,
                  tk2$r_black,
                  tk2$r_asian,
                  tk2$r_hispanic,
                  tk2$femininity,  
                  tk2$pol_r,
                                    # mental health
                  tk2$ghq,
                  tk2$ghq_distress,
                  tk2$ghq_severe,
                                    #  reasons to join
                  tk2$dl_sos,    
                  tk2$fr_importance,
                  tk2$dl_fit_in, 
                                    # social structure
                  tk2$intended_audience_broad,
                  tk2$ln_followers,
                  tk2$followers,
                  tk2$use_plus_opens,
                  tk2$length_use,
                                    
                                  # these are on second table
                                        # user behavior
                  tk2$comments_ro,
                  tk2$fq_share_vid,
                  tk2$fq_private_message,
                  tk2$creator,
                  tk2$consumer,
                                    # qualitative response
                  tk2$a_word_count	,
                  tk2$f_word_count	,
                  tk2$a_sent.ave	,
                  tk2$f_sent.ave	,
                  tk2$f_profan_count	,
                  		              # uses
                  tk2$fq_buy_fashion	,
                  tk2$fq_display_purchase	,
                  tk2$fq_connect_fr_s	,
                                    # assess
                  tk2$importance,
                  tk2$too_much_time	,
                  tk2$limit,
                  tk2$concern_alg_r)




round(cor(model.vars1, dvs), digits = 3)

round(cor(model.vars1, tk2$pos_index), digits = 3)


# *********************************************
# 10 List variables here             ####
# *********************************************

case	,
age	,
use_time	,
fq_open	,
length_use	,
fq_like	,
fq_own_comment	,
fq_respond_comment	,
fq_share_vid	,
fq_private_message	,
importance	,
rel_use_r	,
tp_academic	,
tp_alt	,
tp_animals	,
tp_art	,
tp_beauty	,
tp_challenges	,
tp_conspiracies	,
tp_dancing	,
tp_fan	,
tp_fashion	,
tp_finance	,
tp_fitness	,
tp_foodie	,
tp_homestead	,
tp_life	,
tp_magic	,
tp_memes	,
tp_mental	,
tp_nature	,
tp_news	,
tp_nostalgia	,
tp_paranormal	,
tp_parenting	,
tp_partying	,
tp_political	,
tp_pranks	,
tp_professional	,
tp_queer	,
tp_relationships	,
tp_renovation	,
tp_singing	,
tp_straight	,
tp_technical	,
tp_true	,
tp_other	,
have_posted_r	,
creator	,
consumer	,
fq_post	,
intended_audience_broad	,
dl_sos	,
dl_humor	,
dl_entertain	,
dl_escape	,
dl_community	,
dl_find_self	,
dl_find_products	,
dl_relatable	,
dl_fit_in	,
dl_famous	,
dl_news	,
dl_politics	,
dl_inform_others	,
dl_trends	,
dl_learn	,
dl_pass_time	,
dl_relax	,
dl_attractive	,
dl_celebrities	,
dl_other	,
pos_happy	,
pos_true_self	,
pos_confident	,
pos_educated	,
pos_productive	,
pos_unique	,
pos_calm	,
pos_express	,
pos_closer	,
pos_popular	,
pos_new_products	,
pos_fitting_in	,
pos_identification	,
pos_new_people	,
pos_new_thinking	,
pos_new_trying	,
pos_unplug	,
pos_none	,
pos_other	,
neg_addiction	,
neg_cancel	,
neg_comparing	,
neg_cyberbullying	,
neg_distraction	,
neg_disturbing	,
neg_misinformation	,
neg_divided	,
neg_harassment	,
neg_less_time_4_others	,
neg_privacy	,
neg_attention_span	,
neg_stalking	,
neg_censored	,
neg_body_standards	,
neg_mental	,
neg_none	,
neg_other	,
fq_buy_fashion	,
fq_display_purchase	,
fq_connect_fr_s	,
fakeness	,
fq_new_material	,
fr_importance	,
lst_yr_fit_in_r	,
lst_yr_pop_culture_r	,
lst_yr_celebrities_r	,
lst_yr_pol_engage_r	,
lst_yr_stress_r	,
lst_yr_current_events_r	,
tt_makes_same_r	,
control_content_r	,
concern_alg_r	,
fq_desired_content	,
too_much_time	,
limit	,
timespent_meaningfully	,
timespent_wastefully	,
effect_unique_r	,
effect_change_mind_r	,
effect_identity_r	,
effect_new_cultures_r	,
effect_new_communities_r	,
effect_creative_r	,
effect_kindness_r	,
effect_pol_awareness_r	,
effect_unity_r	,
tt_overall_pos	,
ghq_less_concentrate	,
ghq_lost_sleep	,
ghq_not_useful	,
ghq_cannot_decide	,
ghq_strain	,
ghq_cannot_overcome	,
ghq_cannot_enjoy_activity	,
ghq_cannot_face_problems	,
ghq_unhappy_depressed	,
ghq_losing_confidence	,
ghq_worthless	,
ghq_less_happy	,
tt_helps_lonely	,
tt_hurts_concentrate	,
tt_gets_me_through	,
feel_anxious	,
feel_confident	,
feel_happy	,
feel_strained	,
feel_unhappy	,
feel_useful	,
feel_worthless	,
overall_harm_mental	,
fr_use_use	,
fr_use_trends	,
fr_use_send	,
fr_use_reference	,
fr_use_ignored	,
fr_use_addicted	,
fr_use_political	,
fr_time_occupy	,
r_native_am	,
r_hispanic	,
r_mid_eastern	,
r_white	,
r_asian	,
r_pac_island	,
r_black	,
r_indian	,
r_other	,
class	,
gender	,
edu	,
pol_r	,
other_pol	,
sh_num_incomplete	,
sh_participate	,
femininity	,
masculinity	,
overall_harm_mental_r	,
sh_fake_reason	,
creator_intent_fake	,
creator_character_fake	,
content_fake	,
production_fake	,
dramaturgy	,
profiteering	,
digital_alteration	,
physical_alteration	,
idealization	,
misinformation	,
disbelief	,
pranks	,
literal_fakeness	,
nature	,
na_fake	,
sh_authentic_reason	,
creator_intent_auth	,
creator_character_auth	,
content_auth	,
production_auth	,
relatability	,
transparency	,
health	,
vulnerability	,
purity	,
utility	,
proximity	,
expertise	,
good_marketing	,
representational_parity	,
rawness	,
originality	,
literal_authenticity	,
na_auth	,
ssubset	,
f_word_count	,
f_sent.sd	,
f_sent.ave	,
f_profan_count	,
f_profan_ave	,
a_word_count	,
a_sent.sd	,
a_sent.ave	,
a_profan_count	,
a_profan_ave	,
fake_ang_ave	,
fake_ang_count	,
fake_ang_n_ave	,
fake_ang_n_count	,
fake_ant_ave	,
fake_ant_count	,
fake_ant_n_ave	,
fake_ant_n_count	,
fake_disg_ave	,
fake_disg_count	,
fake_disg_n_ave	,
fake_disg_n_count	,
fake_fear_ave	,
fake_fear_count	,
fake_fear_n_ave	,
fake_fear_n_count	,
fake_joy_ave	,
fake_joy_count	,
fake_joy_n_ave	,
fake_joy_n_count	,
fake_sad_ave	,
fake_sad_count	,
fake_sad_n_ave	,
fake_sad_n_count	,
fake_surp_ave	,
fake_surp_count	,
fake_surp_n_ave	,
fake_surp_n_count	,
fake_trust_ave	,
fake_trust_count	,
fake_trust_n_ave	,
fake_trust_n_count	,
auth_ang_ave	,
auth_ang_count	,
auth_ang_n_ave	,
auth_ang_n_count	,
auth_ant_ave	,
auth_ant_count	,
auth_ant_n_ave	,
auth_ant_n_count	,
auth_disg_ave	,
auth_disg_count	,
auth_disg_n_ave	,
auth_disg_n_count	,
auth_fear_ave	,
auth_fear_count	,
auth_fear_n_ave	,
auth_fear_n_count	,
auth_joy_ave	,
auth_joy_count	,
auth_joy_n_ave	,
auth_joy_n_count	,
auth_sad_ave	,
auth_sad_count	,
auth_sad_n_ave	,
auth_sad_n_count	,
auth_surp_ave	,
auth_surp_count	,
auth_surp_n_ave	,
auth_surp_n_count	,
auth_trust_ave	,
auth_trust_count	,
auth_trust_n_ave	,
auth_trust_n_count	,
makevar	,
fake_for.views	,
fake_get.views	,
fake_get.likes	,
fake_for.likes	,
fake_for.interaction	,
fake_get.interaction	,
fake_.lie	,
fake_lip.synch	,
fake_filter	,
fake_not.really	,
fake_made.up	,
fake_was.not	,
fake_claim	,
fake_substitute	,
fake_showing.off	,
fake_show.off	,
fake_fake	,
fake_promoting	,
fake_.ad.	,
fake_advert	,
fake_.ads.	,
fake_promote	,
fake_paid	,
fake_sponsor	,
fake_staged	,
fake_set.up	,
fake_skit	,
fake_prank	,
fake_.ploy	,
fake_scripted	,
fake_actor	,
fake_pretend	,
fake_performing	,
fake_in.reality	,
fake_natural	,
fake_actually	,
fake_open	,
fake_feelings	,
fake_struggles	,
fake_it.shows	,
fake_shows	,
fake_relate	,
fake_true	,
fake_resonate	,
fake_identify	,
fake_its.just	,
fake_funny	,
fake_real	,
fake_interesting	,
fake_personal.	,
fake_personally	,
fake_struggle	,
fake_authentic	,
fake_authenticity	,
fake_live	,
fake_experience.	,
fake_experienced	,
fake_myself	,
fake_honest	,
fake_fact.	,
fake_facts	,
fake_legitimate	,
fake_sweet	,
fake_animals	,
fake_animal.	,
fake_baby	,
fake_cute	,
fake_unbiased	,
fake_information	,
fake_inform.	,
fake_informs	,
fake_.tell.	,
fake_.tells	,
fake_telling	,
fake_experiences	,
fake_diagnosis	,
fake_showing	,
fake_yourself	,
fake_really	,
fake_speak	,
fake_simply	,
fake_thoughts	,
fake_straight	,
fake_verified	,
fake_in.fact	,
fake_genuine	,
fake_cool	,
fake_trasparent	,
fake_health.	,
fake_emotion	,
fake_no.filter	,
fake_motivate	,
fake_.raw.	,
fake_accurate	,
fake_informative	,
fake_how.it.is	,
fake_love	,
fake_happy	,
fake_fun.	,
fake_being.himself	,
fake_being.herself	,
fake_being.themselves	,
fake_being.yourself	,
fake_real.life	,
fake_nature	,
fake_explain	,
fake_explains	,
fake_being.real	,
fake_advice	,
fake_genuinely	,
fake_innocent	,
fake_real.person	,
fake_i.love.it	,
fake_official	,
fake_valid	,
fake_i.do.this	,
fake_hilarious	,
fake_unfiltered	,
fake_unedited	,
fake_realistic	,
fake_believable	,
fake_reality	,
fake_credible	,
fake_just.being	,
auth_for.views	,
auth_get.views	,
auth_get.likes	,
auth_for.likes	,
auth_for.interaction	,
auth_get.interaction	,
auth_.lie	,
auth_lip.synch	,
auth_filter	,
auth_not.really	,
auth_made.up	,
auth_was.not	,
auth_claim	,
auth_substitute	,
auth_showing.off	,
auth_show.off	,
auth_fake	,
auth_promoting	,
auth_.ad.	,
auth_advert	,
auth_.ads.	,
auth_promote	,
auth_paid	,
auth_sponsor	,
auth_staged	,
auth_set.up	,
auth_skit	,
auth_prank	,
auth_.ploy	,
auth_scripted	,
auth_actor	,
auth_pretend	,
auth_performing	,
auth_in.reality	,
auth_natural	,
auth_actually	,
auth_open	,
auth_feelings	,
auth_struggles	,
auth_it.shows	,
auth_shows	,
auth_relate	,
auth_true	,
auth_resonate	,
auth_identify	,
auth_its.just	,
auth_funny	,
auth_real	,
auth_interesting	,
auth_personal.	,
auth_personally	,
auth_struggle	,
auth_authentic	,
auth_authenticity	,
auth_live	,
auth_experience.	,
auth_experienced	,
auth_myself	,
auth_honest	,
auth_fact.	,
auth_facts	,
auth_legitimate	,
auth_sweet	,
auth_animals	,
auth_animal.	,
auth_baby	,
auth_cute	,
auth_unbiased	,
auth_information	,
auth_inform.	,
auth_informs	,
auth_.tell.	,
auth_.tells	,
auth_telling	,
auth_experiences	,
auth_diagnosis	,
auth_showing	,
auth_yourself	,
auth_really	,
auth_speak	,
auth_simply	,
auth_thoughts	,
auth_straight	,
auth_verified	,
auth_in.fact	,
auth_genuine	,
auth_cool	,
auth_trasparent	,
auth_health.	,
auth_emotion	,
auth_no.filter	,
auth_motivate	,
auth_.raw.	,
auth_accurate	,
auth_informative	,
auth_how.it.is	,
auth_love	,
auth_happy	,
auth_fun.	,
auth_being.himself	,
auth_being.herself	,
auth_being.themselves	,
auth_being.yourself	,
auth_real.life	,
auth_nature	,
auth_explain	,
auth_explains	,
auth_being.real	,
auth_advice	,
auth_genuinely	,
auth_innocent	,
auth_real.person	,
auth_i.love.it	,
auth_official	,
auth_valid	,
auth_i.do.this	,
auth_hilarious	,
auth_unfiltered	,
auth_unedited	,
auth_realistic	,
auth_believable	,
auth_reality	,
auth_credible	,
auth_just.being	,
ft_attention	,
at_attention	,
ft_dishonest	,
at_dishonest	,
ft_show_off	,
at_show_off	,
ft_profit	,
at_profit	,
ft_staged	,
at_staged	,
ft_accurate	,
at_accurate	,
ft_credible	,
at_credible	,
ft_educate	,
at_educate	,
ft_health	,
at_health	,
ft_humor	,
at_humor	,
ft_inherent	,
at_inherent	,
ft_lived.experience	,
at_lived.experience	,
ft_original	,
at_original	,
ft_personal	,
at_personal	,
ft_pure	,
at_pure	,
ft_raw	,
at_raw	,
ft_reflect	,
at_reflect	,
ft_relatable	,
at_relatable	,
ft_transparent	,
at_transparent	,
ft_utility	,
at_utility	,
neg_at_dishonest	,
neg_at_show_off	,
neg_at_profit	,
neg_at_staged	,
neg_ft_accurate	,
neg_ft_credible	,
neg_ft_educate	,
neg_ft_health	,
neg_ft_humor	,
neg_ft_inherent	,
neg_ft_lived.experience	,
neg_ft_original	,
neg_ft_personal	,
neg_ft_pure	,
neg_ft_raw	,
neg_ft_reflect	,
neg_ft_relatable	,
neg_ft_transparent	,
neg_ft_utility	,
