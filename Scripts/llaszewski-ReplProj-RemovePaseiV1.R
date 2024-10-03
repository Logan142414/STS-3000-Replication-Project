#### Metadata ####

# Code written by: Logan Laszewski
# Last Update: 2024-01-15
# Filename: llaszewski-ReplProj-RemovePaseiV1

# Purpose of this script: This script is the start of the process
# of removing observations. Looking at missing values from variable Pasei10
# 


#### Setup ####
rm(list=ls())
options(width = 80)

filename <-"llaszewski-ReplProj-RemovePaseiV1"

sink(paste(filename, ".log", sep = "")) # create log file to store output

# R version
R.version.string

#### Project Code ####

## 0 Load functions and data

VariablesGSS3 <- readRDS("llaszewski-ReplProj-VariablesV1.RDS")

## 1 

RemovePaseiGSS <- subset(VariablesGSS3,VariablesGSS3$PASEI10 != ".i")


## 2 Check table to see if all missing ".i" values are gone table()

table(RemovePaseiGSS$PASEI10)


## 3 Added metadata to dataset,  Save RDS

prov.tag <-"llaszewski-ReplProj-RemovePaseiV1 | LAL | 2024-01-17"
comment(RemovePaseiGSS) <- c(comment(VariablesGSS3), paste("New subset ", 
  "(RemovePaseiGSS). Removing missing values in PASEI10 variable |" 
        , prov.tag, sep=""))

#Check for metadata 
print(comment(RemovePaseiGSS))

saveRDS(RemovePaseiGSS,"llaszewski-ReplProj-RemovePaseiV1.RDS" )

# close log
sink()

