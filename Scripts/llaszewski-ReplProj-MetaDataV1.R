#### Metadata ####

# Code written by: Logan Laszewski
# Last Update: 2024-01-17
# Filename: llaszewski-ReplProj-MetaDataV1

# Purpose of this script:Add metadata to the variables and dataset
# 


#### Setup ####
rm(list=ls())
options(width = 80)

filename <-"llaszewski-ReplProj-MetaDataV1"

sink(paste(filename, ".log", sep = "")) # create log file to store output

# R version
R.version.string

#### Project Code ####

## 0 Load functions and data

RemoveSibs_DegreeGSS <- readRDS("llaszewski-ReplProj-RemoveSibs_DegreeV1.RDS")
MetaDataGSS <- readRDS("llaszewski-ReplProj-RemoveSibs_DegreeV1.RDS")

## 1 Make all variables numeric

MetaDataGSS$sibs <-as.numeric(MetaDataGSS$sibs)
MetaDataGSS$educ <-as.numeric(MetaDataGSS$educ)
MetaDataGSS$PASEI10 <-as.numeric(MetaDataGSS$PASEI10)
MetaDataGSS$age <-as.numeric(MetaDataGSS$age)
MetaDataGSS$degree <-as.numeric(MetaDataGSS$degree)


## 1 Adding MetaData to dataset
prov.tag <-"llaszewski-ReplProj-MetaDataV1 | LAL | 2024-01-17"
comment(MetaDataGSS) <- c(comment(RemoveSibs_DegreeGSS), paste("New subset ", 
"(MetaDataGSS). Adds metadata to each variable. Done with cleaning. ",
" 7 variables, 12210 obs. |" 
            , prov.tag, sep=""))

## Check for metadata
print(comment(MetaDataGSS))


## 2 Adding MetaData to each variable
comment(MetaDataGSS$educ) <- paste("Respondents Years of education (0 to 20) |"
                                  , prov.tag, sep="")

comment(MetaDataGSS$sex_updated) <- paste("Respondents Sex, either 0 or 1. ",  
                                  "Male = 1, Female = 0 |"
                                 , prov.tag, sep="")

comment(MetaDataGSS$PASEI10) <- paste("Respondents Father's Socioeconomic ",
                  "Index based on the 2010 Census occupation classification |"
                                     , prov.tag, sep="")

comment(MetaDataGSS$age) <- paste(" Current age of the respondent |"
                                 , prov.tag, sep="")

comment(MetaDataGSS$race_updated) <- paste(" Respondents Race, either 0 or 1. ",
                                  "White = 1, Other = 0 |"
                                  , prov.tag, sep="")

comment(MetaDataGSS$sibs)<- paste(" Respondents number of siblings |"
                                  , prov.tag, sep="")

comment(MetaDataGSS$degree)<- paste("Respondents highest degree obtained ",
                    "<HS = 0 , HS = 1, Junior College = 2",
                    "Bachelors Degree = 3, Graduate/Professional Degree = 4 |", 
                    prov.tag, sep="")

## 3 Check for all MetaData (variables)

str(MetaDataGSS$educ)
str(MetaDataGSS$sex_updated)
str(MetaDataGSS$PASEI10)
str(MetaDataGSS$age)
str(MetaDataGSS$race_updated)
str(MetaDataGSS$sibs)
str(MetaDataGSS$degree)


## 4  Save RDS

saveRDS(MetaDataGSS,"llaszewski-ReplProj-MetaDataV1.RDS")

# close log
sink()
