#### Metadata ####

# Code written by: Logan Laszewski
# Last Update: 2024-01-19
# Filename: llaszewski-ReplProj-RegressionTable3V1

# Purpose of this script: Make regression models 1 and 2 for Table 3



#### Setup ####
rm(list=ls())

options(width = 80)

filename <-"llaszewski-ReplProj-RegressionTable3V1"

sink(paste(filename, ".log", sep = "")) # create log file to store output

# R version
R.version.string

#### Project Code ####

## 0 Load functions and data

DescStatsGSS <- readRDS("llaszewski-ReplProj-MetaDataV1.RDS")

## 1 Create Regression Table 3, Model 1, sibs not included, all cases

RegressionEduc <- lm(educ ~ sex_updated + PASEI10 + age + race_updated + 
 sex_updated*PASEI10 , data = DescStatsGSS)

# Examine the regression model

summary(RegressionEduc)


## 2 Create Regression Table 3 Model 2, sibs included, all cases 

RegressionEduc2 <- lm(educ ~ sex_updated + PASEI10 + age + race_updated + 
                       sex_updated*PASEI10 + sibs, data = DescStatsGSS)


# Examine the regression model

summary(RegressionEduc2)

# close log
sink()
