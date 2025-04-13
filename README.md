
## **Overview**
This repository contains the solution for the Getting and Cleaning Data course project, part of the Data Science Specialization offered by John Hopkins University on Coursera. The goal of the project is to process, clean, and tidy up the raw dataset collected from accelerometers of smartphones to create a tidy dataset that can be used for further analysis.

## **Data Source**
The data was collected from the accelerometers of Samsung Galaxy S smartphones and is available from:  
[UCI HAR Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The dataset contains experiments where 30 subjects performed six different activities while wearing a smartphone with embedded inertial sensors. The six activities are:
- WALKING
- WALKING_UPSTAIRS
- WALKING_DOWNSTAIRS
- SITTING
- STANDING
- LAYING

## **Files Included**
- **`run_analysis.R`**: R script that processes and cleans the data to create the tidy dataset.
- **`tidy_dataset.txt`**: The final tidy dataset that contains the average of each variable for each activity and each subject.
- **`CodeBook.md`**: A detailed description of the variables in the tidy dataset and the steps taken during the data cleaning process.

## **Steps to Execute the Code**
1. **Install required R packages**:  
   The script requires the following R packages: `data.table`, `reshape2`.  
   You can install them using the following commands:
   ```R
   install.packages("data.table")
   install.packages("reshape2")

```R
source("run_analysis.R")
