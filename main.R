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
ind2008 <- sample(2, nrow(data2008), replace = TRUE, prob = c(0.7, 0.3))
trainingSet2008 <- data2008[ind2008 == 1, 4:42]
testingSet2008 <- data2008[ind2008 == 2, 4:42]
trainingLabels2008 <- data2008[ind2008 == 1, 51]
testingLabels2008 <- data2008[ind2008 == 2, 51]
set.seed(1234)
prediction2008 <- knn(train = trainingSet2008, test = testingSet2008, cl = trainingLabels2008, k = 9)
CrossTable(x = testingLabels2008, y = prediction2008, prop.chisq = FALSE)

data2012 <- read.csv("data/2012data.csv")
dim(data2012)
glimpse(data2012)
str(data2012)
print(sum(is.na(data2012)))
data2012$outcome <- ifelse(data2012$repVotes>data2012$demVotes,-1,1) # -1 = republican, 1 = democrat
ind2012 <- sample(2, nrow(data2012), replace = TRUE, prob = c(0.7, 0.3))
trainingSet2012 <- data2012[ind2012 == 1, 4:39]
testingSet2012 <- data2012[ind2012 == 2, 4:39]
trainingLabels2012 <- data2012[ind2012 == 1, 48]
testingLabels2012 <- data2012[ind2012 == 2, 48]
set.seed(1234)
prediction2012 <- knn(train = trainingSet2012, test = testingSet2012, cl = trainingLabels2012, k = 10)
CrossTable(x = testingLabels2012, y = prediction2012, prop.chisq = FALSE)

data2016 <- read.csv("data/2016data.csv")
dim(data2016)
glimpse(data2016)
str(data2016)
print(sum(is.na(data2016)))
data2016$outcome <- ifelse(data2016$repVotes>data2016$demVotes,-1,1) # -1 = republican, 1 = democrat
ind2016 <- sample(2, nrow(data2016), replace = TRUE, prob = c(0.7, 0.3))
trainingSet2016 <- data2016[ind2016 == 1, 4:53]
testingSet2016 <- data2016[ind2016 == 2, 4:53]
trainingLabels2016 <- data2016[ind2016 == 1, 62]
testingLabels2016 <- data2016[ind2016 == 2, 62]
set.seed(1234)
prediction2016 <- knn(train = trainingSet2016, test = testingSet2016, cl = trainingLabels2016, k = 1)
CrossTable(x = testingLabels2016, y = prediction2016, prop.chisq = FALSE)

data2020 <- read.csv("data/2020data.csv")
data2020 <- na.omit(data2020)
dim(data2020)
glimpse(data2020)
str(data2020)
print(sum(is.na(data2020)))
data2020$outcome <- ifelse(data2020$percentage16_Donald_Trump>data2020$percentage16_Hillary_Clinton,-1,1) # -1 = republican, 1 = democrat
ind2020 <- sample(2, nrow(data2020), replace = TRUE, prob = c(0.7, 0.3))
trainingSet2020 <- data2020[ind2020 == 1, 16:51]
testingSet2020 <- data2020[ind2020 == 2, 16:51]
trainingLabels2020 <- data2020[ind2020 == 1, 52]
testingLabels2020 <- data2020[ind2020 == 2, 52]
set.seed(1234)
prediction2020 <- knn(train = trainingSet2020, test = testingSet2020, cl = trainingLabels2020, k = 9)
CrossTable(x = testingLabels2020, y = prediction2020, prop.chisq = FALSE)

#need to isolate demographic factors out and correlation test them 
#look at the correlation testing to see how related various factors are

#table(climate$outcome) #outcome scenarios - probably need to do 0 or 1 for who won(a calculation to add)

#split up the code into learning and testing groups (line 73)
