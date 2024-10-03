#### Metadata ####

# Code written by: Logan Laszewski
# Last Update: 2024-01-15
# Filename: llaszewski-ReplProj-VariablesV1

# Purpose of this script: Remove unneeded variables from dataset
# 


#### Setup ####
rm(list=ls())
options(width = 80)

filename <-"llaszewski-ReplProj-VariablesV1"

sink(paste(filename, ".log", sep = "")) # create log file to store output

# R version
R.version.string

#### Project Code ####

## 0 Load functions and data

YearsGSS <- readRDS("llaszewski-ReplProj-subsetyearsV1.RDS")


## 1 Kept the 7 variables I will need for my analysis

VariablesGSS <- YearsGSS[, c("educ", "sex", "PASEI10", 
                  "age", "race", "sibs", "degree" )]


## 2 Check if these are the 7 remaining variables in VariablesGSS dataset  

ls(VariablesGSS)


## 3 Relabel any variables that differ from article. Remove old variable 

#Make Male=1 and Female=0
VariablesGSS$sex_updated <- ifelse(VariablesGSS$sex == 2, 0, 1)

#Drop original
VariablesGSS2 <- subset(VariablesGSS, select = -sex) 

#Make White=1 and Other= 0 

VariablesGSS2$race_updated <- ifelse(VariablesGSS2$race == 1, 1, 0)
VariablesGSS3 <- subset(VariablesGSS2, select = -race) 

#Check again what variables are remaining ls()
ls(VariablesGSS3)

## 3 Added metadata to dataset, Save RDS

prov.tag <-"llaszewski-ReplProj-VariablesV1 | LAL | 2024-01-17"
comment(VariablesGSS3) <- c(comment(YearsGSS), paste("New subset ", 
"(VariablesGSS3). Only keeping the 7 variables I need. Educ, Sex, ",
"Race, Age, Pasei10, Sibs and Degree |" 
                  , prov.tag, sep=""))

#Check for metadata
print(comment(VariablesGSS3))

saveRDS(VariablesGSS3,"llaszewski-ReplProj-VariablesV1.RDS")

# close log
sink()


