"This is a README file" 
"## This is a README file" 
"The script reads in the necessary txt file from the working directory" 
"Please ensure that all files are in the working directory itself and not in a subdirectory" 
"   " 
"The dataset test_master and train_master are created by using cbind to join the subject, Y, and X data sets " 
"The field named Type is added designating whether the data is from the training set or the test set " 
"The test and traing data sets are then joined together using rbind " 
"The data values pertaining to the mean and std are extracted using grep " 
"The activity labels are merged into the file. " 
"The activity number column is dropped and the column order is changed and columns are renamed. " 
"The data is melted so that each variable observation now has its own row. " 
"The aggregate function is applied and the mean taken for each Subject, Activity, and Variable. " 
"The columns are renamed to Subject, Activity, Type, Variable, and Mean. " 
"    " 
"    " 
"Subject - the number of the subject that the observation is about " 
"Activity - the activity that the subject was performing during the observation " 
"Type - denotes whether the data was from the test data set or the train data set " 
"Variable - the variable that data is being observed for " 
"Mean - the mean of the observed variable " 
"    " 
"    " 
"    " 