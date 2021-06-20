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

#need to combine the demographic data into 2016, 2012, and 2008
#need to match counties to the lat/long coordinates defined by the 2020 data

data2020 <- read.csv("data/2020data.csv")
