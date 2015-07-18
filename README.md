
# Getting and Cleaning Data Course Project


## Overview

The purpose of this project is to clean the [Human Activity Recognition database][1] built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

The `run_analysis.R` merges the train and test data from the UCI dataset and extracts only the measurements on the mean and standard deviation for each measurement.

The tidy data will be created as two indendepent datasets:  
    1. The measurements on the mean and standard deviation for each feature, `activityData.txt`  
    2. Averages values per subject per activity for the dataset's mean and standard deviation features, `averageActivity.txt`
	

## Installation and Usage

This setup has been tested on Ubuntu 14.04, R 3.0.2 environment. **Requires** `data.table` package.

1. Download and extract the [dataset][2]. It should result in `UCI HAR Dataset` folder that has all the required files.
2. Change working directory to `UCI HAR Dataset` folder.
3. Clone this repository.
4. To generate the dataset, run 

        Rscript <path to run_analysis.R>/run_analysis.R  
        
5. The tidy data will be created in the current folder as `activityData.txt` and `averageActivity.txt`.

[1]: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
[2]: http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip

