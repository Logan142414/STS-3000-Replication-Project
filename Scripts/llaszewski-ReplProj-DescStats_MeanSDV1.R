#### Metadata ####

#NOTE: Need tidyverse package

# Code written by: Logan Laszewski
# Last Update: 2024-01-18
# Filename: llaszewski-ReplProj-DescStats_MeanSDV1

# Purpose of this script: Make table for means and standard deviations of 
# remaining variables. Combine this with the degrees frequencies table.


#### Setup ####
rm(list=ls())
options(width = 80)

filename <-"llaszewski-ReplProj-DescStats_MeanSDV1"

sink(paste(filename, ".log", sep = "")) # create log file to store output

# R version
R.version.string

#### Project Code ####

## 0 Load functions and data.   
library(tidyverse)

DescStatsGSS <- readRDS("llaszewski-ReplProj-DescStatsFrequenciesV1.RDS")
degree_table <- readRDS("llaszewski-ReplProj-degree_tableV1.RDS")


## 1 loop to create data frame for means and standard deviations 

df=data.frame()
for (var in 1:length(DescStatsGSS)) {
  if (var == 5) {
    next
  }
  variables <- (colnames(DescStatsGSS)[var])
  means <- round(mean(DescStatsGSS[,var]),digits=2)
  formatted_means <- format(means, nsmall = 2)
  sd <- round(sd(DescStatsGSS[,var]),digits=2)
  formatted_sd <- format(sd, nsmall = 2)
  df <- rbind(df, c(variables, formatted_means, formatted_sd))
  }


## 2 Renaming columns using tidyverse package 

df <- rename(df, Variables = X.educ.)
df <- rename(df, Mean = X.13.60. )
df <- rename(df, SD = X.3.03. )


## 3 Create combined table called df. Check what it looks like 

df <- rbind(df,degree_table)
df
# close log
sink()

