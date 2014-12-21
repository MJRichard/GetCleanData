This repository contains the files to create a tidy set of data.

The raw data is from a series of measurements from the accelerometer and gyroscopes in a smartphone. The participants performed 6 different activities and movements were recorded. The data is available from
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
A description of the data is at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

This repository contains 4 files:
README.md
This file which contains a description of each file.

run_analysis.R
A script to transform the data to a tidy data that contains the mean of only the observations that were the mean and standard deviation of the observations. These are arranged according to each subject in the test and what activity they were performing. The script requires that you have the "URI HAR Dataset" in your working directory.

CodeBook.md
A description of the run_analysis.R script and what how it is transforming the raw data to turn it into a tidy data set.

testobs.txt
The tidy data set which includes the mean of the observations that were means and standard deviations for each activity performed by each subject. In R, you can read the data using the function read.table('testobs.txt', header=TRUE).

As noted the raw data is not included, but is required to perform the run_analysis.R script.