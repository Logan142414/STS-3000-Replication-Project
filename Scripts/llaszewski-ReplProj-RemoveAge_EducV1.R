#### Metadata ####

# Code written by: Logan Laszewski
# Last Update: 2024-01-15
# Filename: llaszewski-ReplProj-RemoveAge_EducV1

# Purpose of this script: This script creates new subset, RemoveAge_EducGSS
#Which eliminates missing values from the Age and Educ variables.



#### Setup ####
rm(list=ls())
options(width = 80)

filename <-"llaszewski-ReplProj-RemoveAge_EducV1"

sink(paste(filename, ".log", sep = "")) # create log file to store output

# R version
R.version.string

#### Project Code ####

## 0 Load functions and data

RemovePaseiGSS <- readRDS("llaszewski-ReplProj-RemovePaseiV1.RDS")

## 1 Remove missing values from Age and Educ 

RemoveAge_EducGSS <- subset(RemovePaseiGSS, RemovePaseiGSS$age != ".n" & 
                         RemovePaseiGSS$educ != ".a") 

## 2 Check educ and age tables for more missing values

table(RemoveAge_EducGSS$educ)
table(RemoveAge_EducGSS$age)


## 3 Added metadata to dataset, Save RDS

prov.tag <-"llaszewski-ReplProj-RemoveAge_EducV1 | LAL | 2024-01-17"
comment(RemoveAge_EducGSS) <- c(comment(RemovePaseiGSS), paste("New subset ", 
  "(RemoveAge_EducGSS). Removing missing values in Educ and Age variables |" 
                , prov.tag, sep=""))

#Check for metadata
print(comment(RemoveAge_EducGSS))

saveRDS(RemoveAge_EducGSS,"llaszewski-ReplProj-RemoveAge_EducV1.RDS")

# close log
sink()

