The raw data is from the 'URI HAR Dataset' which contains 'README.txt' describing the tables included and 'features_info.txt' which goes into more detail about the types of measurements that were made. Data can be accessed at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

From 'README.txt'
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The experiement data is set up into two groups. The training set and the test data. We are combining these two sets together. However, the information is split into multiple files.
subject_test.txt and subject_train.txt contain the subject id numbers for the experiment which go from 1 to 30. This is given the variable name subject.

The files ytest.txt and ytrain.txt are the labels for which activity they were performing so this is given the variable name activity. Currently, this is described by a number from 1-6 describing each activity. The description of each activity is in the file activity_labels.txt.

The observation data is in the files xtest.txt and xtrain.txt. The labels for the variables are taken from the features.txt file. Each observation is normalized and bounded from [-1,1]. There are 561 total features described in more detail in features_info.txt included in the data set.

To make our tidy data set, we first column bind the subject, activity and features together for the test and training groups. Then we row bind the test and training groups together to get the complete data set.

Also note, we are not using the 'Inertial Signals' folder because it does not contain any data we are using.

The activities are currently labeled as numbers and we want to use the actual activity description so this would not have to be looked up. To do this, we change the column to a feature and select the labels 

We only want to include observations that are the mean and standard deviations of the features so we use the select function from the dplyr package to only select those features which have '.mean..' or '.std..' in their name.

There are multiple observations for each activity that each subject performed so we want to consolidate these observations into the mean observation. We use more function from the dplyr package. First we group the data by subject number and activity number, the summarise_each function will take the mean of the rest of the observations that fall into each group.

Now we have the final tidy data set which is written into the file testobs.txt