# Header                                            ##### 
#'    standard opening procedures               
#'    
#'   
#'         Main code written by Ted Welser, 
#'         5/17/2023  to
#'         ??
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
  "https://docs.google.com/spreadsheets/d/1ZOK_KW0OxNJ4OU3declUdXC71Ssmk3hlyJzQHMn_xGM/edit?usp=sharing",
               col_names = TRUE) %>%
  tibble() -> tk

names(tk)


# *********************************************
# 2 Create indices and recode                       ####
# *********************************************

#   for recodes, as necessary library(QCA)
#'  Use term by reference themes to create theme variables
#'  simple sum because indicators are not likely to appear
#'  more than once in any single comment.

# *********************************************
tk %>%
  mutate(ft_attention =
           
            fake_for.views	+
            fake_get.views	+
            fake_get.likes	+
            fake_for.likes	+
            fake_for.interaction	+
            fake_get.interaction
         )  -> tk

tk %>%
  mutate(at_attention =
            
           auth_for.views	+
            auth_get.views	+
            auth_get.likes	+
            auth_for.likes	+
            auth_for.interaction	+
            auth_get.interaction
         )  -> tk

hist(tk$ft_attention)
table(tk$ft_attention)   

# 228  10

hist(tk$at_attention)
table(tk$at_attention)   

# 238  0


# *********************************************

tk %>%
  mutate(ft_dishonest =
            
          fake_.lie	+
          fake_lip.synch	+
          fake_filter	+
          fake_not.really	+
          fake_made.up	+
          fake_was.not	+
          fake_claim	+
          fake_substitute	+
          fake_fake	  
         )  -> tk


tk %>%
  mutate(at_dishonest =
            
          auth_.lie	+
          auth_lip.synch	+
          auth_filter	+
          auth_not.really	+
          auth_made.up	+
          auth_was.not	+
          auth_claim	+
          auth_substitute	+
          auth_fake	  
         )  -> tk

table(tk$ft_dishonest)
table(tk$at_dishonest)

# *********************************************

tk %>%
  mutate(ft_show_off =
           
        fake_showing.off	+
        fake_show.off	
                 )  -> tk
          
tk %>%
  mutate(at_show_off =
           
        auth_showing.off	+
        auth_show.off	
                   )  -> tk
  
table(tk$ft_show_off)
table(tk$at_show_off)

# *********************************************

tk %>%
  mutate(ft_profit =
           
          fake_promoting	+
          fake_.ad.	+
          fake_advert	+
          fake_.ads.	+
          fake_promote	+
          fake_paid	+
          fake_sponsor	
            )  -> tk 

tk %>%
  mutate(at_profit =
           
          auth_promoting	+
          auth_.ad.	+
          auth_advert	+
          auth_.ads.	+
          auth_promote	+
          auth_paid	+
          auth_sponsor	
            )  -> tk 


table(tk$ft_profit)
table(tk$at_profit)

# *********************************************

tk %>%
  mutate(ft_staged =
          
        fake_staged	+
        fake_set.up	+
        fake_skit	+
        fake_prank	+
        fake_.ploy	+
        fake_scripted	+
        fake_actor	+
        fake_pretend	+
        fake_performing	+
        fake_in.reality	
                    )  -> tk 
  

tk %>%
  mutate(at_staged =
          
        auth_staged	+
        auth_set.up	+
        auth_skit	+
        auth_prank	+
        auth_.ploy	+
        auth_scripted	+
        auth_actor	+
        auth_pretend	+
        auth_performing	+
        auth_in.reality	
                    )  -> tk 
  
table(tk$ft_staged)

table(tk$at_staged)

# *********************************************

tk %>%
  mutate(ft_accurate =
           
         fake_unbiased  +
         fake_true +
         fake_real.life  +
         fake_real  +
         fake_how.it.is  +
         fake_facts  +
         fake_fact.  +
         fake_accurate
                   )  -> tk 

tk %>%
  mutate(at_accurate =
           
           auth_unbiased  +
           auth_true +
           auth_real.life  +
           auth_real  +
           auth_how.it.is  +
           auth_facts  +
           auth_fact.  +
           auth_accurate
                   )  -> tk 

table(tk$ft_accurate)

table(tk$at_accurate)

# *********************************************

tk %>%
  mutate(ft_credible =
           
           fake_verified  +
           fake_valid  +
           fake_official  +
           fake_legitimate   +
           fake_credible
                   )  -> tk 

tk %>%
  mutate(at_credible =
           
           auth_verified  +
           auth_valid  +
           auth_official  +
           auth_legitimate   +
           auth_credible
                    )  -> tk 

table(tk$ft_credible)
table(tk$at_credible)

# *********************************************

tk %>%
  mutate(ft_educate =
           
           fake_telling  +
           fake_informs  +
           fake_informative  +
           fake_information  +
           fake_inform.  +
           fake_explains  +
           fake_explain  +
           fake_.tells  +
           fake_.tell.
                    )  -> tk 

tk %>%
  mutate(at_educate =
           
           auth_telling  +
           auth_informs  +
           auth_informative  +
           auth_information  +
           auth_inform.  +
           auth_explains  +
           auth_explain  +
           auth_.tells  +
           auth_.tell.
                    )  -> tk 

table(tk$ft_educate)
table(tk$at_educate)

# *********************************************

tk %>%
  mutate(ft_health =
           
           fake_health.  +
           fake_diagnosis
                     )  -> tk 

tk %>%
  mutate(at_health =
           
           auth_health.  +
           auth_diagnosis
                     )  -> tk 

table(tk$ft_health)
table(tk$at_health)

# *********************************************

tk %>%
  mutate(ft_humor =
          
           fake_hilarious  +
           fake_funny
                     )  -> tk 

tk %>%
  mutate(at_humor =
           
           auth_hilarious  +
           auth_funny
                     )  -> tk 

table(tk$ft_humor)
table(tk$at_humor)

# *********************************************

tk %>%
  mutate(ft_inherent =
           
           fake_really  +
           fake_reality  +
           fake_realistic  +
           fake_natural  +
           fake_in.fact  +
           fake_genuinely  +
           fake_genuine  +
           fake_believable  +
           fake_being.real  +
           fake_authenticity  +
           fake_authentic  +
           fake_actually
                     )  -> tk 

tk %>%
  mutate(at_inherent =
           
           auth_really  +
           auth_reality  +
           auth_realistic  +
           auth_natural  +
           auth_in.fact  +
           auth_genuinely  +
           auth_genuine  +
           auth_believable  +
           auth_being.real  +
           auth_authenticity  +
           auth_authentic  +
           auth_actually
                      )  -> tk 

table(tk$ft_inherent)
table(tk$at_inherent)

# *********************************************

tk %>%
  mutate(ft_lived.experience =
           
           fake_experiences  +
           fake_experience.  +
           fake_feelings  +
           fake_emotion  +
           fake_experienced  +
           fake_struggles  +  
           fake_struggle
                       )  -> tk 

tk %>%
  mutate(at_lived.experience =
           
           auth_experiences  +
           auth_experience.  +
           auth_feelings  +
           auth_emotion  +
           auth_experienced  +
           auth_struggles  +  
           auth_struggle
                        )  -> tk 

table(tk$ft_lived.experience)
table(tk$at_lived.experience)

# *********************************************

tk %>%
  mutate(ft_original =
           
           fake_interesting  +
           fake_cool
                     )  -> tk 

tk %>%
  mutate(at_original =
           
           auth_interesting  +
           auth_cool
                     )  -> tk 

table(tk$ft_original)
table(tk$at_original)

# *********************************************

tk %>%
  mutate(ft_personal =
           
           fake_yourself  +
           fake_real.person  +
           fake_personal.  +
           fake_myself  +
           fake_being.yourself  +
           fake_being.themselves  +
           fake_being.himself  +
           fake_being.herself
                     )  -> tk 

tk %>%
  mutate(at_personal =
           
           auth_yourself  +
           auth_real.person  +
           auth_personal.  +
           auth_myself  +
           auth_being.yourself  +
           auth_being.themselves  +
           auth_being.himself  +
           auth_being.herself
                     )  -> tk 

table(tk$ft_personal)
table(tk$at_personal)

# *********************************************

tk %>%
  mutate(ft_pure =
           
           fake_sweet  +
           fake_straight  +
           fake_simply  +
           fake_nature  +
           fake_love  +
           fake_just.being  +
           fake_its.just  +
           fake_innocent  +
           fake_i.love.it  +
           fake_happy  +
           fake_fun.  +
           fake_cute  +
           fake_baby  +
           fake_animals  +
           fake_animal.
                 )  -> tk 

tk %>%
  mutate(at_pure =
           
           auth_sweet  +
           auth_straight  +
           auth_simply  +
           auth_nature  +
           auth_love  +
           auth_just.being  +
           auth_its.just  +
           auth_innocent  +
           auth_i.love.it  +
           auth_happy  +
           auth_fun.  +
           auth_cute  +
           auth_baby  +
           auth_animals  +
           auth_animal.
                 )  -> tk 

table(tk$ft_pure)
table(tk$at_pure)

# *********************************************

tk %>%
  mutate(ft_raw =
           
           fake_unfiltered  +
           fake_unedited  +
           fake_no.filter  +
           fake_live  +
           fake_.raw.
               )  -> tk 

tk %>%
  mutate(at_raw =
           
           auth_unfiltered  +
           auth_unedited  +
           auth_no.filter  +
           auth_live  +
           auth_.raw.
               )  -> tk 

table(tk$ft_raw)
table(tk$at_raw)

# *********************************************

tk %>%
  mutate(ft_reflect =
           
           fake_speak  +
           fake_shows  +
           fake_showing  +
           fake_it.shows
                  )  -> tk 

tk %>%
  mutate(at_reflect =
           
           auth_speak  +
           auth_shows  +
           auth_showing  +
           auth_it.shows
                  )  -> tk 

table(tk$ft_reflect)
table(tk$at_reflect)

# *********************************************

tk %>%
  mutate(ft_relatable =
           
           fake_resonate  +
           fake_relatable  +
           fake_relate  +
           fake_personally  +
           fake_identify  +
           fake_i.do.this
                   )  -> tk 

tk %>%
  mutate(at_relatable =
           
           auth_resonate  +
           auth_relatable  +
           auth_relate  +
           auth_personally  +
           auth_identify  +
           auth_i.do.this
                   )  -> tk 

table(tk$ft_relatable)
table(tk$at_relatable)

# *********************************************

tk %>%
  mutate(ft_transparent =
           
           fake_transparent  +
           fake_open  +
           fake_honest
                )  -> tk 

tk %>%
  mutate(at_transparent =
           
           auth_transparent  +
           auth_open  +
           auth_honest
                )  -> tk 

table(tk$ft_transparent)
table(tk$at_transparent)

# *********************************************

tk %>%
  mutate(ft_utility =
           
           fake_motivate  +
           fake_advice
                )  -> tk 

tk %>%
  mutate(at_utility =
           
           auth_motivate  +
           auth_advice
                )  -> tk 

table(tk$ft_utility)
table(tk$at_utility)


#   can start here and skip the var creation

read_sheet(
  "https://docs.google.com/spreadsheets/d/1JQFCPc0TI7tuQIe0I1tWFk4LVr-aHkjbehP7BFprj3g/edit?usp=sharing",
  col_names = TRUE) %>%
  tibble() -> tk2



# *********************************************
##  2.2 Check Index Validity   ####
# *********************************************

## list new vars

names(tk2)    # to get list of new vars from end of list, 

#   open up google sheet as reference

# "term by reference"
# https://docs.google.com/spreadsheets/d/1Pc7dG-nN1uwdqpzLbhb1wf7o2LAGdTJ-pW7pC-jnB1M/edit#gid=0

tk2 %>%
  mutate(case2 = case)  -> tk2

tk2 %>%
  select(case, sh_fake_reason, case2,
         sh_authentic_reason,
         ft_attention,
         at_attention,
         ft_dishonest,
         at_dishonest,
         ft_show_off,
         at_show_off,
         ft_profit,
         at_profit,
         ft_staged,
         at_staged,
         ft_accurate,
         at_accurate,
         ft_credible,
         at_credible,
         ft_educate,
         at_educate,
         ft_health,
         at_health,
         ft_humor,
         at_humor,
         ft_inherent,
         at_inherent,
         ft_lived.experience,
         at_lived.experience,
         ft_original,
         at_original,
         ft_personal,
         at_personal,
         ft_pure,
         at_pure,
         ft_raw,
         at_raw,
         ft_reflect,
         at_reflect,
         ft_relatable,
         at_relatable,
         ft_transparent,
         at_transparent,
         ft_utility,
         at_utility) -> tk_short


tk_sh <- gs4_create("tk_short",
                    sheets = tk_short)
tk_short %>%
  filter(ft_dishonest > 0) -> tk_fake_cuz_dishonest

tk_short %>%
  filter(at_dishonest > 0) -> auth_cuz_dishonest  

## authenticity themes

tk_short %>%
  filter(ft_accurate > 0) -> tk_fake_cuz_accurate

tk_short %>%
  filter(at_accurate > 0) -> tk_auth_cuz_accurate 

tk_short %>%
  filter(ft_credible > 0) -> tk_fake_cuz_credible

tk_short %>%
  filter(at_credible > 0) -> tk_auth_cuz_credible

tk_short %>%
  filter(ft_educate > 0) -> tk_fake_cuz_educate

tk_short %>%
  filter(at_educate > 0) -> tk_auth_cuz_educate

tk_short %>%
  filter(ft_health > 0) -> tk_fake_cuz_health

tk_short %>%
  filter(at_health > 0) -> tk_auth_cuz_health

tk_short %>%
  filter(ft_humor > 0) -> tk_fake_cuz_humor

tk_short %>%
  filter(at_humor > 0) -> tk_auth_cuz_humor

tk_short %>%
  filter(ft_inherent > 0) -> tk_fake_cuz_inherent

tk_short %>%
  filter(at_inherent > 0) -> tk_auth_cuz_inherent

tk_short %>%
  filter(ft_lived.experience > 0) -> tk_fake_cuz_lived.experience

tk_short %>%
  filter(at_lived.experience > 0) -> tk_auth_cuz_lived.experience

tk_short %>%
  filter(ft_original > 0) -> tk_fake_cuz_original

tk_short %>%
  filter(at_original > 0) -> tk_auth_cuz_original

tk_short %>%
  filter(ft_personal > 0) -> tk_fake_cuz_personal

tk_short %>%
  filter(at_personal > 0) -> tk_auth_cuz_personal

tk_short %>%
  filter(ft_pure > 0) -> tk_fake_cuz_pure

tk_short %>%
  filter(at_pure > 0) -> tk_auth_cuz_pure

tk_short %>%
  filter(ft_raw > 0) -> tk_fake_cuz_raw

tk_short %>%
  filter(at_raw > 0) -> tk_auth_cuz_raw

tk_short %>%
  filter(ft_reflect > 0) -> tk_fake_cuz_reflect

tk_short %>%
  filter(at_reflect > 0) -> tk_auth_cuz_reflect

tk_short %>%
  filter(ft_relatable > 0) -> tk_fake_cuz_relatable

tk_short %>%
  filter(at_relatable > 0) -> tk_auth_cuz_relatable

tk_short %>%
  filter(ft_transparent > 0) -> tk_fake_cuz_transparent

tk_short %>%
  filter(at_transparent > 0) -> tk_auth_cuz_transparent

tk_short %>%
  filter(ft_utility > 0) -> tk_fake_cuz_utility

tk_short %>%
  filter(at_utility > 0) -> tk_auth_cuz_utility

# *********************************************
# 3 Recodes                                ####
# *********************************************






# *********************************************
# 4 Explore                                ####
# *********************************************






# *********************************************
# 4 Key vars                                ####
# *********************************************





# *********************************************
# 5 Descriptives                                ####
# *********************************************




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


fake_for.views	+
fake_get.views	+
fake_get.likes	+
fake_for.likes	+
fake_for.interaction	+
fake_get.interaction	+
  
fake_.lie	+
fake_lip.synch	+
fake_filter	+
fake_not.really	+
fake_made.up	+
fake_was.not	+
fake_claim	+
fake_substitute	+
fake_fake	+  
  
  
fake_showing.off	+
fake_show.off	+
  
  
fake_promoting	+
fake_.ad.	+
fake_advert	+
fake_.ads.	+
fake_promote	+
fake_paid	+
fake_sponsor	+
  
fake_staged	+
fake_set.up	+
fake_skit	+
fake_prank	+
fake_.ploy	+
fake_scripted	+
fake_actor	+
fake_pretend	+
fake_performing	+
fake_in.reality	+
  
  
  
fake_natural	+
fake_actually	+
fake_open	+
fake_feelings	+
fake_struggles	+
fake_it.shows	+
fake_shows	+
fake_relate	+
fake_true	+
fake_resonate	+
fake_identify	+
fake_its.just	+
fake_funny	+
fake_real	+
fake_interesting	+
fake_personal.	+
fake_personally	+
fake_struggle	+
fake_authentic	+
fake_authenticity	+
fake_live	+
fake_experience.	+
fake_experienced	+
fake_myself	+
fake_honest	+
fake_fact.	+
fake_facts	+
fake_legitimate	+
fake_sweet	+
fake_animals	+
fake_animal.	+
fake_baby	+
fake_cute	+
fake_unbiased	+
fake_information	+
fake_inform.	+
fake_informs	+
fake_.tell.	+
fake_.tells	+
fake_telling	+
fake_experiences	+
fake_diagnosis	+
fake_showing	+
fake_yourself	+
fake_really	+
fake_speak	+
fake_simply	+
fake_thoughts	+
fake_straight	+
fake_verified	+
fake_in.fact	+
fake_genuine	+
fake_cool	+
fake_trasparent	+
fake_health.	+
fake_emotion	+
fake_no.filter	+
fake_motivate	+
fake_.raw.	+
fake_accurate	+
fake_informative	+
fake_how.it.is	+
fake_love	+
fake_happy	+
fake_fun.	+
fake_being.himself	+
fake_being.herself	+
fake_being.themselves	+
fake_being.yourself	+
fake_real.life	+
fake_nature	+
fake_explain	+
fake_explains	+
fake_being.real	+
fake_advice	+
fake_genuinely	+
fake_innocent	+
fake_real.person	+
fake_i.love.it	+
fake_official	+
fake_valid	+
fake_i.do.this	+
fake_hilarious	+
fake_unfiltered	+
fake_unedited	+
fake_realistic	+
fake_believable	+
fake_reality	+
fake_credible	+
fake_just.being	+
auth_for.views	+
auth_get.views	+
auth_get.likes	+
auth_for.likes	+
auth_for.interaction	+
auth_get.interaction	+
auth_.lie	+
auth_lip.synch	+
auth_filter	+
auth_not.really	+
auth_made.up	+
auth_was.not	+
auth_claim	+
auth_substitute	+
auth_showing.off	+
auth_show.off	+
auth_fake	+
auth_promoting	+
auth_.ad.	+
auth_advert	+
auth_.ads.	+
auth_promote	+
auth_paid	+
auth_sponsor	+
auth_staged	+
auth_set.up	+
auth_skit	+
auth_prank	+
auth_.ploy	+
auth_scripted	+
auth_actor	+
auth_pretend	+
auth_performing	+
auth_in.reality	+
auth_natural	+
auth_actually	+
auth_open	+
auth_feelings	+
auth_struggles	+
auth_it.shows	+
auth_shows	+
auth_relate	+
auth_true	+
auth_resonate	+
auth_identify	+
auth_its.just	+
auth_funny	+
auth_real	+
auth_interesting	+
auth_personal.	+
auth_personally	+
auth_struggle	+
auth_authentic	+
auth_authenticity	+
auth_live	+
auth_experience.	+
auth_experienced	+
auth_myself	+
auth_honest	+
auth_fact.	+
auth_facts	+
auth_legitimate	+
auth_sweet	+
auth_animals	+
auth_animal.	+
auth_baby	+
auth_cute	+
auth_unbiased	+
auth_information	+
auth_inform.	+
auth_informs	+
auth_.tell.	+
auth_.tells	+
auth_telling	+
auth_experiences	+
auth_diagnosis	+
auth_showing	+
auth_yourself	+
auth_really	+
auth_speak	+
auth_simply	+
auth_thoughts	+
auth_straight	+
auth_verified	+
auth_in.fact	+
auth_genuine	+
auth_cool	+
auth_trasparent	+
auth_health.	+
auth_emotion	+
auth_no.filter	+
auth_motivate	+
auth_.raw.	+
auth_accurate	+
auth_informative	+
auth_how.it.is	+
auth_love	+
auth_happy	+
auth_fun.	+
auth_being.himself	+
auth_being.herself	+
auth_being.themselves	+
auth_being.yourself	+
auth_real.life	+
auth_nature	+
auth_explain	+
auth_explains	+
auth_being.real	+
auth_advice	+
auth_genuinely	+
auth_innocent	+
auth_real.person	+
auth_i.love.it	+
auth_official	+
auth_valid	+
auth_i.do.this	+
auth_hilarious	+
auth_unfiltered	+
auth_unedited	+
auth_realistic	+
auth_believable	+
auth_reality	+
auth_credible	+
auth_just.being	+