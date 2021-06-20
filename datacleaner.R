# Andrew Wang
# clean up and setup
rm(list=ls()) # clean up any old stuff in R
setwd("~/GitHub/demographics-ml") # go to this folder

#load up myfunctions.R
source("~/GitHub/data-science/myfunctions.R")

#library import
library(tidyverse)
library(dplyr)

#read all sheets in for each year
election2008 <- read.csv("Data/2008data/2008election.csv", header = TRUE)
employment2008 <- read.csv("Data/2008data/2008employment.csv", skip = 1, header = TRUE)
population2008 <- read.csv("Data/2008data/2008population.csv", skip = 1, header = TRUE)
race2008 <- read.csv("Data/2008data/2008race.csv", skip = 1, header = TRUE)
election2008 <- na.omit(election2008)
#view(election2008)
#view(employment2008)
#view(population2008)
#view(race2008)
dem2008 <- merge(employment2008,population2008,by="Geographic.Area.Name")
dem2008 <- merge(dem2008, race2008,by="Geographic.Area.Name")
#view(dem2008)
dem2008 <- dem2008 %>% separate(id.x, c(NA, "county_fips"), sep = -5)
dem2008$county_fips <- as.integer(dem2008$county_fips)
data2008 <- inner_join(dem2008, election2008)

election2012 <- read.csv("Data/2012data/2012election.csv", header = TRUE)
employment2012 <- read.csv("Data/2012data/2012employment.csv", skip = 1, header = TRUE)
population2012 <- read.csv("Data/2012data/2012population.csv", skip = 1, header = TRUE)
race2012 <- read.csv("Data/2012data/2012race.csv", skip = 1, header = TRUE)
election2012 <- na.omit(election2012)
#view(election2012)
#view(employment2012)
#view(population2012)
#view(race2012)
dem2012 <- merge(employment2012,population2012,by="Geographic.Area.Name")
dem2012 <- merge(dem2012, race2012,by="Geographic.Area.Name")
#view(dem2012)
dem2012 <- dem2012 %>% separate(id.x, c(NA, "county_fips"), sep = -5)
dem2012$county_fips <- as.integer(dem2012$county_fips)
data2012 <- inner_join(dem2012, election2012)

election2016 <- read.csv("Data/2016data/2016election.csv", header = TRUE)
employment2016 <- read.csv("Data/2016data/2016employment.csv", skip = 1, header = TRUE)
population2016 <- read.csv("Data/2016data/2016population.csv", skip = 1, header = TRUE)
race2016 <- read.csv("Data/2016data/2016race.csv", skip = 1, header = TRUE)
election2016 <- na.omit(election2016)
#view(election2016)
#view(employment2016)
#view(population2016)
#view(race2016)
dem2016 <- merge(employment2016,population2016,by="Geographic.Area.Name")
dem2016 <- merge(dem2016, race2016,by="Geographic.Area.Name")
#view(dem2016)  
dem2016 <- dem2016 %>% separate(id.x, c(NA, "county_fips"), sep = -5)
dem2016$county_fips <- as.integer(dem2016$county_fips)
data2016 <- inner_join(dem2016, election2016)

data2020 <- read.csv("data/2020data.csv")


#format and split off county names into states and counties 
#match the names to coordinates based off the 2020 data 