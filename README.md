Getting and Cleaning Data - Course Project
==========================================

This repository hosts the R code and documentation files for the Data Science's track course "Getting and Cleaning data", available in coursera.

The dataset being used is: [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Objective
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

Create one R script called run_analysis.R that does the following. 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## Files
There are 3 files in this project: `README.md`, `CodeBook.md` and `run_analysis.R`
* `README.md` (this file) describes the repositoyr contents
* `CodeBook.md` describes the variables, the data, and any transformations or work that was performed to clean up the data.
* `run_analysis.R` contains all the code to perform the analyses described in the 5 steps. They can be launched in RStudio by just sourcing the file.

NOTES:

* Prior to execution of `run_analysis.R`, the user should set their working directory (setwd()) to the location the `run_analysis.R` is located.
* The code will download and unzip all the data necessary to perform operations.
* The output of the 5th step will be called `averages_tidy_data.txt`.