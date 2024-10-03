#### Metadata ####

# Code written by: Logan Laszewski
# Last Update: 2024-01-15
# Filename: llaszewski-ReplProj-RemoveSibs_DegreeV1

# Purpose of this script: Get rid of more missing values, 
# this time variables sibs and degree. New data set called RemoveSibs_DegreeGSS
# 


#### Setup ####
rm(list=ls())
options(width = 80)

filename <-"llaszewski-ReplProj-RemoveSibs_DegreeV1"

sink(paste(filename, ".log", sep = "")) # create log file to store output

# R version
R.version.string

#### Project Code ####

## 0 Load functions and data

RemoveAge_EducGSS <- readRDS("llaszewski-ReplProj-RemoveAge_EducV1.RDS")


## 1 Remove missing values from Sibs and Degree variables 

RemoveSibs_DegreeGSS <- subset(RemoveAge_EducGSS, RemoveAge_EducGSS$sibs != ".n" & 
                RemoveAge_EducGSS$sibs != ".d" & RemoveAge_EducGSS$degree != ".a") 

## 2 Create tables to check if all missing values are gone table()

table(RemoveSibs_DegreeGSS$sibs)
table(RemoveSibs_DegreeGSS$degree)


## 3 Added metadata to dataset, Save RDS

prov.tag <-"llaszewski-ReplProj-RemoveSibs_DegreeV1 | LAL | 2024-01-17"
comment(RemoveSibs_DegreeGSS) <- c(comment(RemoveAge_EducGSS), paste("New ", 
" subset (RemoveSibs_DegreeGSS). Removing missing values ",
"in Sibs and Degree variables |" 
      , prov.tag, sep=""))

#Check for metadata
print(comment(RemoveSibs_DegreeGSS))

saveRDS(RemoveSibs_DegreeGSS, "llaszewski-ReplProj-RemoveSibs_DegreeV1.RDS")

# close log
sink()
