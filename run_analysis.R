library(dplyr)

#The 'URI HAR Dataset' must be in your working directory for this script to work

#loading the data in
featurenames<-read.table('./UCI HAR Dataset/features.txt')
# column labels for measurements in xtest, xtrain
# 2 columns

xtest<-read.table('./UCI HAR Dataset/test/X_test.txt', col.names=featurenames[,2]) 
#data for testing group, column names are featurenames
ytest<-read.table('./UCI HAR Dataset/test/y_test.txt', col.names=c('activity')) 
#which test was performed, from 1 to 6, need to match with activities
xtrain<-read.table('./UCI HAR Dataset/train/X_train.txt', col.names=featurenames[,2]) 
#data for training group, column names are featurenames
ytrain<-read.table('./UCI HAR Dataset/train/y_train.txt', col.names=c('activity')) 
# test performed for training group, from 1 to 6, match with activities
subtrain<-read.table('./UCI HAR Dataset/train/subject_train.txt', col.names=c('subject')) 
#subjectid for training group
subtest<-read.table('./UCI HAR Dataset/test/subject_test.txt',col.names=c('subject'))
#subjectid for testing group
activities<-read.table('./UCI HAR Dataset/activity_labels.txt')
#matching numbers to activity description, 2 columns


#cbind subject, ydata, xdata w/col names
testdata<-cbind(subtest, ytest, xtest)
traindata<-cbind(subtrain, ytrain, xtrain)
#rbind test, and train data sets
combine<-rbind(testdata,traindata)

combine<-select(combine,subject, activity, contains('.mean..'), contains('.std..')) #to get mean and std observations, changes order

combine[,2]<-factor(combine[,2],labels=activities[,2]) #use factor to use activity name

#make new data table with mean observation for each subject/activity
final<-combine %>% 
  group_by(subject,activity) %>% 
  summarise_each(funs(mean))

write.table(final, file='testobs.txt', row.names=FALSE)