# Delfina Data Take-Home Interview 

### Overview

This data take-home is meant to assess your ability to perform the programming, analytic, and scientific communication skills necessary for the Data Scientist position at Delfina.

### Instructions 

__Goal:__ Utilize birth data to develop a prediction model for preterm birth. 

__Language:__ Python or R 

__Allotted time:__ You will have one week to complete this assessment. We estimate that this take-home will take 3-4 hours to complete. 

__Materials:__ The data file can be in the _data/_ folder with relevant documentation in the _reference/_ folder. Please note that we have created a smaller version of the dataset, such that not all variables listed in the documentation are available in the provided dataset.  

__Submission format:__ When you have completed the take-home, send your code and answers to careers@delfina.com with the subject “Data Scientist Take-Home Interview”. Code and answers can be sent separately or integrated within Jupyter notebook or R Markdown. __*Please ensure that we can execute your code to reproduce all analytic results.*__

__Additional instructions:__

- Complete the assessment without consulting other individuals.
- You are free to utilize existing online reference materials.
- All tables and figures should be publication-quality (titles, captions, etc.).
- If any of the questions are unclear, make your best guess on how to proceed and provide a note in the submission. 
- The data is meant to emulate a real-life data setting, and we expect you to make modifications to the existing dataset. 

### Questions

1. Create a figure summarizing the proportion of births by gestational age at delivery. 

2. Use the COMBGEST variable to create a variable indicating occurrence of a preterm birth (birth occurring prior to 37 weeks gestational age). What is the prevalence of preterm birth in this dataset?

3. Create one table ([see example Table 1](https://www.ahajournals.org/doi/full/10.1161/STROKEAHA.119.025970)) that summarizes the relationship between preterm birth and the following four variables: 

-	Maternal age (MAGER)
-	Maternal race/Hispanic origin (MRACEHISP)
-	Previous preterm birth (RF_PPTERM)
-	Total number of prenatal visits (PREVIS)

    Please discuss your rationale for any modifications to existing variables or exclusions.  

4. Utilize logistic regression to create a prediction model for preterm birth using the four variables included in the table from Question 3. Please report the following: (1) Figure of ROC Curve (2) AUROC value (3) Table with fitted regression coefficients, standard errors, and p-values. 

5. Create a prediction model for preterm birth with your choice of machine learning method and variables. Please only include the code and results for __one model__ and report the following: (1) Figure of ROC Curve (2) AUROC value. 

6. Provide a description of the methods (1-2 paragraphs) used for your model in Question 5 that could be included in a research article with language accessible to an individual who is not familiar with the technical details of machine learning. Your description should include rationale for your chosen machine learning method, choice of included variables, and any exclusions or data modifications that you made. 

7. Compare and discuss the performance of your model in Question 5 to the logistic regression model in Question 4. 
