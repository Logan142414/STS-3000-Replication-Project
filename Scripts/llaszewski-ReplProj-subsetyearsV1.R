#### Metadata ####

# Code written by: Logan Laszewski
# Last Update: 2024-01-15
# Filename: llaszewski-ReplProj-subsetyearsV1

# Purpose of this script: Select the years of GSS data needed
# New subset called YearsGSS only including 2000-2010


#### Setup ####
rm(list=ls())
options(width = 80)

filename <-"llaszewski-ReplProj-subsetyearsV1"

sink(paste(filename, ".log", sep = "")) # create log file to store output

# R version
R.version.string

#### Project Code ####

## 0 Load in RDS

uncleanedGSS <- readRDS("llaszewski-ReplProj-LoadingDataV1.RDS")


## 1 Make subset only including years 2000-2010 needed for my article.

YearsGSS <- subset(uncleanedGSS,uncleanedGSS$year %in% seq(2000,2010,1))


## 2 Check that all I have are years 2000-2010. Table()

table(YearsGSS$year)

## 3 Added metadata to dataset, Save RDS for new subset

prov.tag <-"llaszewski-ReplProj-subsetyearsV1 | LAL | 2024-01-17"
comment(YearsGSS) <- c(comment(uncleanedGSS), paste("New subset (YearsGSS). ",
                  "Only containing years 2000 to 2010 |" 
                               , prov.tag, sep=""))

#Check for metadata
print(comment(YearsGSS))

saveRDS(YearsGSS,"llaszewski-ReplProj-subsetyearsV1.RDS")


# close log
sink()

