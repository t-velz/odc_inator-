####Git and powershell commands

#for all Git commands, when typing them in the shell be sure to precede them with git so the shell knows what program they are from

###Git commands

add #add a file to a Git repository 
#if you want to add all files to a directory, use "." ex.) git add .
#if you want to add specific files, use the file names

branch #create and delete branches

checkout #lists all local branches 

clone #clone a repository into current working directory 

config #configure your GitHub username and email, this can be used for adding files to a Git repository 
#ex.) git config --global user.name "your user name"

init #initialize a Git repository 

log #show a repository's commit history, including authors and commit messages

pull #fetch data from a remote repository and merge it with your commands

push #add committed changes to remote Git repository 
#ex.) git push origin main pushes changes to the main branch of the repository 



###Powershell commands

cd #change working directory 

cp #copies an item from one location to another

mv #moves and item from one location to another

rm #deletes file 

###using GitHub with R

#install Git
#git is a version control software that enables you to keep track of changes made to files
#however, git does not allow for you to see edits that other people are making, and is best utilized for individual use
#github makes it easier to collaborate with git, and allows you to see changes other people are making in real time

#configure Git:
library(usethis)
edit_git_config()
#this will bring up a git_config file, where you would give username and email 

#initialize a Git repository (must first have a project)

use_git() #function will add a Git repository to an existing RStudio project 

#using GitHib with R studio
#once you have signed up for GitHub, you need to connect R Studio to GitHub with a personal access token 
#steps to generate the personal access token:
library(usethis)
create_github_token() #have to give a name to your personal access token, should save this in a password manager so that you don't lose it

#now that your token has been created, it must be stored so that R Studio can access it and connect to your GitHub account
library(gitcreds)
gitcreds_set()
#now is when you would enter your personal access token

#when starting a new project in R Studio, use the version control option
