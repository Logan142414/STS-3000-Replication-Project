#### Metadata ####

# Code written by: Logan Laszewski
# Last Update: 2024-01-15
# Filename: llaszewski-ReplProj-LoadingDataV1

# Purpose of this script: Load in the GSS data set, uncleaned



#### Setup ####
rm(list=ls())
options(width = 80)

filename <-"llaszewski-ReplProj-LoadingDataV1"

sink(paste(filename, ".log", sep = "")) # create log file to store output

# R version
R.version.string

#### Project Code ####

## 0 Load functions and data

uncleanedGSS <- readRDS("gss7218_R1.RDS")



## 1 Added metadata to dataset, Renamed and save RDS, as "uncleanedGSS"

prov.tag <-"llaszewski-ReplProj-LoadingDataV1 | LAL | 2024-01-17"
comment(uncleanedGSS) <- paste("GSS uncleaned data set, no changes.",
                               " 6108 variables, 64814 obs. |"
                               , prov.tag, sep="")


saveRDS(uncleanedGSS, "llaszewski-ReplProj-LoadingDataV1.RDS")

#Check for metadata
print(comment(uncleanedGSS))

# close log
sink()

