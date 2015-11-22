## This is a README file 

The script run_analysis.R reads in the necessary txt files from the working directory.  

Pleae ensure that all files are in the working directory itself and not in a subdirectory.  

The datasets test_master and train_master are creaed by using cbind to join th esubject , T, and X datasets.  

The field named Type is added designating whether the data is from the training set or the test set.  

The test and training data sets are then jouned together using rbind.  

The data values pertaining to the mean and std are extracted using grep.  

The activity labels are merged into the file.  

The activity number column is dropped and the column order is changed and the columns are renamed.  
 
The data is melted so that each variable observation now has its own row.  

The aggragate function is applied and the mean taken for each Subject, Activity, and Variable.  

The columes are renamed to Subject, Activity, Type, Variable, and Mean.  
 



