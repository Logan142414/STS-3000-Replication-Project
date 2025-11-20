# Replication of “The Primary Parental Investment in Children in the Contemporary USA is Education”  
### *Replication of Hopcroft & Martin (2014)*  
**Author:** Logan Laszewski  
**Course:** Replication Project – Elon University (2024)  

---

## Overview
This project replicates the findings from Hopcroft & Martin’s 2014 paper,  
**“The Primary Parental Investment in Children in the Contemporary USA is Education.”**

The original study tests the **Trivers–Willard Hypothesis**, which predicts that:
- High-status parents invest more in **sons**
- Low-status parents invest more in **daughters**

Hopcroft & Martin measure “investment” using:
- **Years of education (educ)**  
- **Highest degree attained (degree)**  

Using the **2000–2010 General Social Survey (GSS)**, I reproduced the authors’ sample, recoded variables, cleaned data, generated descriptive statistics, and replicated their regression models.

---

## Purpose of This Project
This project serves as a full end-to-end replication, designed to:

- Understand and validate the methods used in a peer-reviewed study  
- Gain experience in:
  - Data extraction  
  - Data cleaning and recoding  
  - Missing value handling  
  - Descriptive statistics  
  - Regression modeling in R  
- Evaluate whether the original results can be reproduced  
- Practice **reproducible research workflow** using well-structured scripts  

---

## Skills Demonstrated
- Data cleaning and preprocessing in R  
- Recoding categorical variables  
- Handling missing values  
- Descriptive statistics  
- Linear regression modeling  
- Reproducible research workflow  
- Academic paper replication  

---

## Research Question
**Does parental socioeconomic status interact with child sex to predict educational investment?**  

In other words:
- Do high-status fathers invest more in sons?
- Do low-status fathers invest more in daughters?

---

## Methods Summary

### **Dataset**
- **General Social Survey (GSS), 2000–2010 subset**
- Key variables:
  - `educ` — years of education (0–20)  
  - `degree` — highest degree (0–4 scale)  
  - `pasei10` — father’s socioeconomic index  
  - `sex_updated` — recoded (Male = 1, Female = 0)  
  - `race_updated` — recoded (White = 1, Other = 0)  
  - `sibs` — number of siblings  
  - `age` — age of respondent  

### **Software**
- R version **4.2.2**
- Only package required:  
  ```r
  install.packages("tidyverse")
  library(tidyverse)

### **Data Cleaning Steps**
All data preparation was performed using a series of R scripts. These steps included:

- Subsetting the dataset to years **2000–2010**
- Removing GSS missing-value codes: `.i`, `.n`, `.d`, `.a`
- Recoding variables:
  - `sex` → `sex_updated` (Male = 1, Female = 0)
  - `race` → `race_updated` (White = 1, Other = 0)
- Selecting only the variables used in the original study
- Converting variables to numeric formats
- Creating descriptive statistics tables
- Running regression models for:
  - **All respondents** (Table 3 replication)
  - **Respondents age > 24** (Table 4 replication)

---

## Key Results

### **Descriptive Statistics**
- Successfully replicated Table 1 from the original article  
- Means, standard deviations, and degree frequencies were highly similar  
- Small discrepancies (mainly in `pasei10`) came from a slightly larger sample size

### **Regression Models**
Replicated:
- **Table 3** — all respondents  
- **Table 4** — respondents older than 24  

Results were highly consistent with the original study:
- Coefficient signs matched  
- Standard errors were nearly identical  
- P-values showed similar significance patterns  
- R² values were slightly lower but followed the same pattern  

### **Conclusion**
This replication supports the original authors’ findings:  
- **High-status fathers invest more educationally in sons**  
- **Low-status fathers invest more in daughters**  

These findings hold across both educational measures and both sample groups.

---

## How to Reproduce

1. Download the GSS dataset (`gss7218_R1.RDS`)  
2. Place it in the `/ReplProjTurnIn` folder  
3. Set your working directory in R:
4. Run the scripts in order of:
  1. llaszewski-ReplProj-LoadingDataV1.R
  2. llaszewski-ReplProj-subsetyearsV1.R
  3. llaszewski-ReplProj-VariablesV1.R
  4. llaszewski-ReplProj-RemovePaseiV1.R
  5. llaszewski-ReplProj-RemoveAge_EducV1.R
  6. llaszewski-ReplProj-RemoveSibs_DegreeV1.R
  7. llaszewski-ReplProj-MetaDataV1.R
  8. llaszewski-ReplProj-DescStatsFrequenciesV1.R
  9. llaszewski-ReplProj-DescStats_MeanSDV1.R
  10. llaszewski-ReplProj-RegressionTable3V1.R
  11. llaszewski-ReplProj-RegressionTable4V1.R

---

## Documents 

- Full Replication Paper: [llaszewski-ReplProj-PaperShown.pdf](./Results/llaszewski-ReplProj-PaperShown.pdf)
- Tables (Descriptive Stats + Regression): [llaszewski-ReplProj-TablesShown.pdf](./Results/llaszewski-ReplProj-TablesShown.pdf)
- Project Diary: [llaszewski-ReplProj-Diary.pdf](./Results/llaszewski-ReplProj-Diary.pdf)

The dataset used in this project (GSS 1972–2018 cumulative file) can be downloaded from the official GSS Data Explorer:  
https://gssdataexplorer.norc.org/

---

## Acknowledgements

- Project completed by Logan Laszewski
- Supervised by Dr. Nicholas Bussberg
- Based on Hopcroft & Martin (2014): The Primary Parental Investment in Children in the Contemporary USA is Education
