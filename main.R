# Andrew Wang
#
# clean up and setup
rm(list=ls()) # clean up any old stuff in R
setwd("~/GitHub/demographics-ml") # go to this folder

#load up myfunctions.R
source("~/GitHub/demographics-ml/myfunctions.R")

#library import
library(maps)
library(tidyverse)
library(usmap)
library(gridExtra)

set.seed(1234)

data2008 <- read.csv("data/2008data.csv")
dim(data2008)
glimpse(data2008)
str(data2008)
print(sum(is.na(data2008)))
data2008$outcome <- ifelse(data2008$repVotes>data2008$demVotes,-1,1) # -1 = republican, 1 = democrat

data2012 <- read.csv("data/2012data.csv")
dim(data2012)
glimpse(data2012)
str(data2012)
print(sum(is.na(data2012)))
data2012$outcome <- ifelse(data2012$repVotes>data2012$demVotes,-1,1) # -1 = republican, 1 = democrat

data2016 <- read.csv("data/2016data.csv")
dim(data2016)
glimpse(data2016)
str(data2016)
print(sum(is.na(data2016)))
data2016$outcome <- ifelse(data2016$repVotes>data2016$demVotes,-1,1) # -1 = republican, 1 = democrat

data2020 <- read.csv("data/2020data.csv")
data2020 <- na.omit(data2020)
dim(data2020)
glimpse(data2020)
str(data2020)
print(sum(is.na(data2020)))
data2020$outcome <- ifelse(data2020$percentage16_Donald_Trump>data2020$percentage16_Hillary_Clinton,-1,1) # -1 = republican, 1 = democrat

#need to isolate demographic factors out and correlation test them 
#look at the correlation testing to see how related various factors are

#table(climate$outcome) #outcome scenarios - probably need to do 0 or 1 for who won(a calculation to add)

#split up the code into learning and testing groups (line 73)
