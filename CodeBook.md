# **CodeBook**

## **Overview**
This codebook describes the variables, data, and all transformations or cleaning steps used to generate the tidy dataset as part of the Getting and Cleaning Data course project.

## **Source Data**
The original data was collected from the accelerometers of Samsung Galaxy S smartphones and is available from:  
[UCI HAR Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The data includes experiments where 30 subjects performed six different activities while wearing a smartphone with embedded inertial sensors.

## **Files Used**
- `X_train.txt`, `y_train.txt`, `subject_train.txt`
- `X_test.txt`, `y_test.txt`, `subject_test.txt`
- `features.txt`
- `activity_labels.txt`

## **Cleaning and Transformation Steps**
1. **Downloaded and unzipped** the original dataset.
2. **Merged** the training and test datasets into one data set.
3. **Extracted** only measurements on the **mean** and **standard deviation** using regular expressions with `grepl()`.
4. **Replaced activity IDs** with descriptive activity names using `activity_labels.txt`.
5. **Renamed variables** to be more descriptive:
   - `t` → `Time`
   - `f` → `Frequency`
   - `Acc` → `Accelerometer`
   - `Gyro` → `Gyroscope`
   - `Mag` → `Magnitude`
   - `BodyBody` → `Body`
6. **Grouped** the data by `subject` and `activity` and then **summarized** by the mean for each variable.
7. Saved the result to `tidy_dataset.txt`.

## **Variables in Tidy Data**
The tidy dataset includes the following:

- **subject**: Identifier for each subject (1-30)
- **activity**: One of six activities:
  - WALKING
  - WALKING_UPSTAIRS
  - WALKING_DOWNSTAIRS
  - SITTING
  - STANDING
  - LAYING
- **Measurement Variables**: Averaged signal values for each combination of subject and activity. These include:
  - TimeBodyAccelerometerMeanX
  - TimeBodyAccelerometerMeanY
  - TimeBodyAccelerometerMeanZ
  - TimeBodyAccelerometerStdX
  - TimeBodyAccelerometerStdY
  - TimeBodyAccelerometerStdZ
  - TimeBodyGyroscopeMeanX
  - TimeBodyGyroscopeMeanY
  - TimeBodyGyroscopeMeanZ
  - TimeBodyGyroscopeStdX
  - TimeBodyGyroscopeStdY
  - TimeBodyGyroscopeStdZ
  - FrequencyBodyAccelerometerMeanX
  - FrequencyBodyAccelerometerMeanY
  - FrequencyBodyAccelerometerMeanZ
  - FrequencyBodyAccelerometerStdX
  - FrequencyBodyAccelerometerStdY
  - FrequencyBodyAccelerometerStdZ
  - ...
  (and many more based on the mean and std measurements extracted)

All measurements are numeric and represent the average of a signal feature for each subject-activity pair.
