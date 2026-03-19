#     Standardize count variables by comments_coded
##--------------------------------------------------------# 
##       Load edd thread data ----
##--------------------------------------------------------# 
library(tidyverse)
library(googlesheets4)
library(janitor)

rm(list=ls(all=TRUE))      # deletes old objects. 

gs4_deauth()  
read_sheet("https://docs.google.com/spreadsheets/d/128mRa-B5aaJ-HJde-3ZHdge-uqOtAgifNMN32F3i3zE/edit?gid=1404811448#gid=1404811448",
  col_names = TRUE) %>%
  clean_names() %>%
  tibble() -> edd

names(edd)



#     get_dupes()   checks if var value is duplicated

get_dupes(edd, url)   #' earlier discovered 6 dupes, 
                      #' removed 1/2 of each paired dupe from data sheet
                      #' now there the duplicates are no longer present


summary(edd)    #'  comment_id, downvotes, structure_of_curriculum are constants
                #'  score and upvotes are identical
                #'  we will drop them here in our working version
                #'  but keep them in the 
                #'  original data structure to facilitate 
                #'  future mergers of datasets

edd$structure_of_curriculum_rt

edd <- subset(edd, select = -c(comment_id, 
                               downvotes, 
                               upvotes))

summary(edd)    # we dropped 3 variables
                # the # of vars went down for edd



library(QCA)

edd$comments_coded  <- recode(edd$t_comments,
                             "501:hi = 500;
                             else = copy" )


edd$profan_count.rt<-(edd$profan_count/edd$comments_coded)*100
edd$profan_ave.rt<-(edd$profan_ave/edd$comments_coded)*100
edd$ang_ave.rt<-(edd$ang_ave/edd$comments_coded)*100
edd$ang_count.rt<-(edd$ang_count/edd$comments_coded)*100
edd$ang_n_ave.rt<-(edd$ang_n_ave/edd$comments_coded)*100
edd$ang_n_count.rt<-(edd$ang_n_count/edd$comments_coded)*100
edd$ant_ave.rt<-(edd$ant_ave/edd$comments_coded)*100
edd$ant_count.rt<-(edd$ant_count/edd$comments_coded)*100
edd$ant_n_ave.rt<-(edd$ant_n_ave/edd$comments_coded)*100
edd$ant_n_count.rt<-(edd$ant_n_count/edd$comments_coded)*100
edd$disg_ave.rt<-(edd$disg_ave/edd$comments_coded)*100
edd$disg_count.rt<-(edd$disg_count/edd$comments_coded)*100
edd$disg_n_ave.rt<-(edd$disg_n_ave/edd$comments_coded)*100
edd$disg_n_count.rt<-(edd$disg_n_count/edd$comments_coded)*100
edd$fear_ave.rt<-(edd$fear_ave/edd$comments_coded)*100
edd$fear_count.rt<-(edd$fear_count/edd$comments_coded)*100
edd$fear_n_ave.rt<-(edd$fear_n_ave/edd$comments_coded)*100
edd$fear_n_count.rt<-(edd$fear_n_count/edd$comments_coded)*100
edd$joy_ave.rt<-(edd$joy_ave/edd$comments_coded)*100
edd$joy_count.rt<-(edd$joy_count/edd$comments_coded)*100
edd$joy_n_ave.rt<-(edd$joy_n_ave/edd$comments_coded)*100
edd$joy_n_count.rt<-(edd$joy_n_count/edd$comments_coded)*100
edd$sad_ave.rt<-(edd$sad_ave/edd$comments_coded)*100
edd$sad_count.rt<-(edd$sad_count/edd$comments_coded)*100
edd$sad_n_ave.rt<-(edd$sad_n_ave/edd$comments_coded)*100
edd$sad_n_count.rt<-(edd$sad_n_count/edd$comments_coded)*100
edd$surp_ave.rt<-(edd$surp_ave/edd$comments_coded)*100
edd$surp_count.rt<-(edd$surp_count/edd$comments_coded)*100
edd$surp_n_ave.rt<-(edd$surp_n_ave/edd$comments_coded)*100
edd$surp_n_count.rt<-(edd$surp_n_count/edd$comments_coded)*100
edd$trust_ave.rt<-(edd$trust_ave/edd$comments_coded)*100
edd$trust_count.rt<-(edd$trust_count/edd$comments_coded)*100
edd$trust_n_ave.rt<-(edd$trust_n_ave/edd$comments_coded)*100
edd$trust_n_count.rt<-(edd$trust_n_count/edd$comments_coded)*100

edd$phone.rt<-(edd$phone/edd$comments_coded)*100
edd$distract.rt<-(edd$distract/edd$comments_coded)*100
edd$addicted.rt<-(edd$addicted/edd$comments_coded)*100
edd$addiction.rt<-(edd$addiction/edd$comments_coded)*100
edd$screen_addict.rt<-(edd$screen_addict/edd$comments_coded)*100
edd$phone_addict.rt<-(edd$phone_addict/edd$comments_coded)*100
edd$dont_learn.rt<-(edd$dont_learn/edd$comments_coded)*100
edd$learn.rt<-(edd$learn/edd$comments_coded)*100
edd$do_work.rt<-(edd$do_work/edd$comments_coded)*100
edd$wont_work.rt<-(edd$wont_work/edd$comments_coded)*100
edd$do_nothing.rt<-(edd$do_nothing/edd$comments_coded)*100
edd$passion.rt<-(edd$passion/edd$comments_coded)*100
edd$motivation.rt<-(edd$motivation/edd$comments_coded)*100
edd$intrinsic.rt<-(edd$intrinsic/edd$comments_coded)*100
edd$extrinsic.rt<-(edd$extrinsic/edd$comments_coded)*100
edd$interest.rt<-(edd$interest/edd$comments_coded)*100
edd$ownership.rt<-(edd$ownership/edd$comments_coded)*100
edd$reward.rt<-(edd$reward/edd$comments_coded)*100
edd$gratification.rt<-(edd$gratification/edd$comments_coded)*100
edd$develop.rt<-(edd$develop/edd$comments_coded)*100
edd$skip_class.rt<-(edd$skip_class/edd$comments_coded)*100
edd$cheat.rt<-(edd$cheat/edd$comments_coded)*100
edd$plagarize.rt<-(edd$plagarize/edd$comments_coded)*100
edd$want_to_learn.rt<-(edd$want_to_learn/edd$comments_coded)*100
edd$no_motivation.rt<-(edd$no_motivation/edd$comments_coded)*100
edd$dont_care.rt<-(edd$dont_care/edd$comments_coded)*100
edd$artificial_intelligence.rt<-(edd$artificial_intelligence/edd$comments_coded)*100
edd$ai.rt<-(edd$ai/edd$comments_coded)*100
edd$chat_gpt.rt<-(edd$chat_gpt/edd$comments_coded)*100
edd$aye_eye.rt<-(edd$aye_eye/edd$comments_coded)*100
edd$depress.rt<-(edd$depress/edd$comments_coded)*100
edd$sad.rt<-(edd$sad/edd$comments_coded)*100
edd$stress.rt<-(edd$stress/edd$comments_coded)*100
edd$anxious.rt<-(edd$anxious/edd$comments_coded)*100
edd$anxiety.rt<-(edd$anxiety/edd$comments_coded)*100
edd$mental_health.rt<-(edd$mental_health/edd$comments_coded)*100
edd$generation_z.rt<-(edd$generation_z/edd$comments_coded)*100
edd$intrinsic_motivation.rt<-(edd$intrinsic_motivation/edd$comments_coded)*100
edd$curriculum.rt<-(edd$curriculum/edd$comments_coded)*100
edd$student_effort.rt<-(edd$student_effort/edd$comments_coded)*100
edd$exhaustion.rt<-(edd$exhaustion/edd$comments_coded)*100
edd$i_am_done.rt<-(edd$i_am_done/edd$comments_coded)*100
edd$cant.rt<-(edd$cant/edd$comments_coded)*100
edd$i_believe.rt<-(edd$i_believe/edd$comments_coded)*100
edd$i_do_believe.rt<-(edd$i_do_believe/edd$comments_coded)*100
edd$i_feel.rt<-(edd$i_feel/edd$comments_coded)*100
edd$i_know.rt<-(edd$i_know/edd$comments_coded)*100
edd$i_just_think.rt<-(edd$i_just_think/edd$comments_coded)*100
edd$i_think.rt<-(edd$i_think/edd$comments_coded)*100
edd$i_thought.rt<-(edd$i_thought/edd$comments_coded)*100
edd$i_agree.rt<-(edd$i_agree/edd$comments_coded)*100
edd$appreciate.rt<-(edd$appreciate/edd$comments_coded)*100
edd$grateful.rt<-(edd$grateful/edd$comments_coded)*100
edd$thank_you.rt<-(edd$thank_you/edd$comments_coded)*100
edd$thanks.rt<-(edd$thanks/edd$comments_coded)*100
edd$they_believe.rt<-(edd$they_believe/edd$comments_coded)*100
edd$they_claim.rt<-(edd$they_claim/edd$comments_coded)*100
edd$they_say.rt<-(edd$they_say/edd$comments_coded)*100
edd$they_think.rt<-(edd$they_think/edd$comments_coded)*100
edd$they_want.rt<-(edd$they_want/edd$comments_coded)*100
edd$deleted.rt<-(edd$deleted/edd$comments_coded)*100
edd$fail_them.rt<-(edd$fail_them/edd$comments_coded)*100
edd$no_consequences.rt<-(edd$no_consequences/edd$comments_coded)*100
edd$failing.rt<-(edd$failing/edd$comments_coded)*100
edd$ai_2.rt<-(edd$ai_2/edd$comments_coded)*100



df <- subset(edd, 
             select = c(
                case_id,
                year_sample,
                url,
                author,
                date,
                timestamp,
                score,
                golds,
                comment,
                t_author,
                t_date,
                t_title,
                t_subreddit,
                t_upvotes,
                t_up_ratio,
                t_total_awards,
                t_golds,
                t_cross_posts,
                t_comments,
                topic,
                word_count,
                sent_ave,
                comments_coded,
                profan_count.rt,
                ang_count.rt,
                ang_n_count.rt,
                ant_count.rt,
                ant_n_count.rt,
                disg_count.rt,
                disg_n_count.rt,
                fear_count.rt,
                fear_n_count.rt,
                joy_count.rt,
                joy_n_count.rt,
                sad_count.rt,
                sad_n_count.rt,
                surp_count.rt,
                surp_n_count.rt,
                trust_count.rt,
                trust_n_count.rt,
                phone.rt,
                distract.rt,
                addicted.rt,
                addiction.rt,
                screen_addict.rt,
                phone_addict.rt,
                dont_learn.rt,
                learn.rt,
                do_work.rt,
                wont_work.rt,
                do_nothing.rt,
                passion.rt,
                motivation.rt,
                intrinsic.rt,
                extrinsic.rt,
                interest.rt,
                ownership.rt,
                reward.rt,
                gratification.rt,
                develop.rt,
                skip_class.rt,
                cheat.rt,
                plagarize.rt,
                want_to_learn.rt,
                no_motivation.rt,
                dont_care.rt,
                artificial_intelligence.rt,
                ai.rt,
                chat_gpt.rt,
                aye_eye.rt,
                depress.rt,
                sad.rt,
                stress.rt,
                anxious.rt,
                anxiety.rt,
                mental_health.rt,
                generation_z.rt,
                intrinsic_motivation.rt,
                curriculum.rt,
                student_effort.rt,
                exhaustion.rt,
                i_am_done.rt,
                cant.rt,
                i_believe.rt,
                i_do_believe.rt,
                i_feel.rt,
                i_know.rt,
                i_just_think.rt,
                i_think.rt,
                i_thought.rt,
                i_agree.rt,
                appreciate.rt,
                grateful.rt,
                thank_you.rt,
                thanks.rt,
                they_believe.rt,
                they_claim.rt,
                they_say.rt,
                they_think.rt,
                they_want.rt,
                deleted.rt,
                fail_them.rt,
                no_consequences.rt,
                failing.rt,
                ai_2.rt,
                profan_ave.rt,
                ang_ave.rt,
                ang_n_ave.rt,
                ant_ave.rt,
                ant_n_ave.rt,
                disg_ave.rt,
                disg_n_ave.rt,
                fear_ave.rt,
                fear_n_ave.rt,
                joy_ave.rt,
                joy_n_ave.rt,
                sad_ave.rt,
                sad_n_ave.rt,
                surp_ave.rt,
                surp_n_ave.rt,
                trust_ave.rt,
                trust_n_ave.rt
                ))

gs4_auth()

gs4_create("edd_short3",
                         sheets = df)



#     after creating edd_short3 I copied the table to 
#     tab in the original edd googlesheet
#     and then I moved that tab to be the first sheet
#     this allows me to keep the url the same for all existing code references
#     it also means the the original unstandardized are not in 
#     the student dataset, to reduce confusion

#  you can see that the term freq variables are no longer strongly 
#   correlated with comments_coded


attach(edd)
emo.rt <- cbind(t_comments,
               profan_count.rt,
                ang_count.rt,
                ang_n_count.rt,
                ant_count.rt,
                ant_n_count.rt,
                disg_count.rt,
                disg_n_count.rt,
                fear_count.rt,
                fear_n_count.rt,
                joy_count.rt,
                joy_n_count.rt,
                sad_count.rt,
                sad_n_count.rt,
                surp_count.rt,
                surp_n_count.rt,
                trust_count.rt,
                trust_n_count.rt)

cor(emo.rt)