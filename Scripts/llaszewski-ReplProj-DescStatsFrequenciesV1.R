#### Metadata ####

# Code written by: Logan Laszewski
# Last Update: 2024-01-18
# Filename: llaszewski-ReplProj-DescStatsFrequenciesV1

# Purpose of this script:
# 


#### Setup ####
rm(list=ls())
options(width = 80)

filename <-"llaszewski-ReplProj-DescStatsFrequenciesV1"

sink(paste(filename, ".log", sep = "")) # create log file to store output

# R version
R.version.string

#### Project Code ####

## 0 Load functions and data


DescStatsGSS <- readRDS("llaszewski-ReplProj-MetaDataV1.RDS")

summary(DescStatsGSS)


## 1 Create table for frequencies of degree variable

#Prop.table(), to give me frequencies, *100 so it's percentage
percentages <- prop.table(table(DescStatsGSS$degree)) * 100

#make this a data frame
degree_table <- as.data.frame(prop.table(table(DescStatsGSS$degree)))


## 2 Organize Data Frame

#Name rows, add "%" and round two digits
degree_table <- data.frame(Variables= c("<HS", "HS",
"Associate Degree","Bachelor's Degree","Graduate Degree"),
Mean = sprintf("%.2f%%", percentages)) #found sprintf() function using Chat GPT

#add extra column for SD (NAs in this case)
degree_table$SD <- c("NA", "NA", "NA", "NA", "NA")

degree_table


## 3 Save RDS

saveRDS(DescStatsGSS ,"llaszewski-ReplProj-DescStatsFrequenciesV1.RDS")
saveRDS(degree_table ,"llaszewski-ReplProj-degree_tableV1.RDS")

# close log
sink()

