# Getting and Cleaning Data - Course Project

## Overview

This repository contains the R script and documentation for the "Getting and Cleaning Data" course project from Coursera's Data Science specialization.

The goal of the project is to clean and prepare a dataset from smartphone accelerometers in a tidy format that can be used for further analysis.

## Files Included

- `run_analysis.R` - R script that processes the raw data
- `tidy_dataset.txt` - Final tidy dataset with the average of each variable for each activity and each subject
- `CodeBook.md` - Describes the dataset variables and the cleaning/transformation steps
- `README.md` - This file, explaining the project and how it works

## How It Works

1. **Download and unzip** the dataset if it's not already present.
2. **Read in** the training and test data.
3. **Merge** the data into one dataset.
4. **Extract** only mean and standard deviation measurements.
5. **Apply descriptive activity names** and **label variables** clearly.
6. **Create a tidy dataset** with the average of each variable for each activity and subject.
7. **Export** the tidy dataset to `tidy_dataset.txt`.

## How to Run

To reproduce this analysis:

```R
source("run_analysis.R")
