#### Metadata ####

# Code written by: Logan Laszewski
# Last Update: 2024-01-19
# Filename: llaszewski-ReplProj-Table4V1

# Purpose of this script:
# 


#### Setup ####
rm(list=ls())
options(width = 80)

filename <-"llaszewski-ReplProj-Table4V1"

sink(paste(filename, ".log", sep = "")) # create log file to store output

# R version
R.version.string

#### Project Code ####

## 0 Load functions and data 

DescStatsGSS <- readRDS("llaszewski-ReplProj-MetaDataV1.RDS")

table(DescStatsGSS$age)
## 1 Subset where only respondents of age > 24

DescStatsGSS2 <- subset(DescStatsGSS, DescStatsGSS$age > 24)

## 2  Create Regression Table 4, Model 1, sibs not included, age > 24

RegressionEduc3 <- lm(educ ~ sex_updated + PASEI10 + age + race_updated + 
                       sex_updated*PASEI10 , data = DescStatsGSS2)

summary(RegressionEduc3)


## 3 Create Regression Table 4, Model 2, sibs included, age > 24

RegressionEduc4 <- lm(educ ~ sex_updated + PASEI10 + age + race_updated + 
                        sex_updated*PASEI10 + sibs, data = DescStatsGSS2)

summary(RegressionEduc4)
# close log
sink()
