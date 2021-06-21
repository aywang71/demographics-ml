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

data2008 <- read.csv("data/2008data.csv")
data2012 <- read.csv("data/2012data.csv")
data2016 <- read.csv("data/2016data.csv")
data2020 <- read.csv("data/2020data.csv")
