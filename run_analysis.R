subject_test<-read.table("subject_test.txt")
X_test<-read.table("X_test.txt")
y_test<-read.table("y_test.txt")
subject_train<-read.table("subject_train.txt")
X_train<-read.table("X_train.txt")
y_train<-read.table("y_train.txt")
features<-read.table("features.txt")
activity_labels<-read.table("activity_labels.txt")

test_master<-cbind(subject_test, "Test", y_test, X_test)
colnames(test_master)[2]<-c("Type")
train_master<-cbind(subject_train,"Train", y_train, X_train)
colnames(train_master)[2]<-c("Type")
all_master<-rbind(train_master, test_master)
colnames(all_master)<-c("Subject","Type","activity",as.character(t(features$V2)))
all_master<-all_master[ ,grep("std\\(\\)|mean\\(\\)|activity|Subject|Type", colnames(all_master)) ]
all_master<-merge(all_master,activity_labels,by.x=c("activity"), by.y=c("V1") )
data_master<-all_master[,c(2,3,70,4:69)]
colnames(data_master)<-c("Subject", "Type", "Activity"  ,        
                         "Time.Body.Acc.Mean.X",    "Time.Body.Acc.Mean.Y"  ,        
                         "Time.Body.Acc.Mean.Z"         ,"Time.BodyAcc.Std.X"      ,     
                         "Time.Body.Acc.Std.Y"          , "Time.BodyAcc.Std.Z"      ,     
                         "Time.Gravity.Acc.Mean.X"    ,  "Time.Gravity.Acc.Mean.Y"  ,     
                         "Time.Gravity.Acc.Mean.Z"   ,   "Time.Gravity.Acc.Std.X"    ,    
                         "Time.Gravity.Acc.Std.Y"   ,    "Time.Gravity.Acc.Std.Z"  ,      
                         "Time.Body.Acc.Jerk.Mean.X",      "Time.Body.Acc.Jerk.Mean.Y",      
                         "Time.Body.Acc.Jerk.Mean.Z",     "Time.Body.Acc.Jerk.Std.X"  ,     
                         "Time.Body.Acc.Jerk.Std.Y",      "Time.Body.Acc.Jerk.Std.Z"  ,     
                         "Time.Body.Gyro.Mean.X"  ,      "Time.BodyGyro.Mean.Y"    ,     
                         "Time.Body.Gyro.Mean.Z" ,       "Time.Body.Gyro.Std.X"     ,     
                         "Time.Body.Gyro.Std.Y" ,        "Time.Body.Gyro.Std.Z"      ,    
                         "Time.Body.Gyro.Jerk.Mean.X"   , "Time.Body.Gyro.Jerk.Mean.Y",     
                         "Time.Body.Gyro.Jerk.Mean.Z"  ,  "Time.Body.Gyro.Jerk.Std.X"  ,    
                         "Time.Body.Gyro.Jerk.Std.Y"  ,   "Time.Body.Gyro.Jerk.Std.Z"   ,   
                         "Time.Body.Acc.Mag.Mean"     ,    "Time.Body.Acc.Mag.Std"    ,      
                         "Time.Gravity.Acc.Mag.Mean",     "Time.Gravity.Acc.Mag.Std"  ,     
                         "Time.Body.Acc.Jerk.Mag.Mean"  ,  "Time.Body.Acc.Jerk.Mag.Std",      
                         "Time.Body.Gyro.Mag.Mean"       ,  "Time.Body.Gyro.Mag.Std"      ,   
                         "Time.Body.Gyro.Jerk.Mag.Mean" ,    "Time.Body.Gyro.Jerk.Mag.Std" ,    
                         "Freq.Body.Acc.Mean.X"        ,   "Freq.Body.Acc.Mean.Y"          ,
                         "Freq.Body.Acc.Mean.Z"       ,    "Freq.Body.Acc.Std.X"           ,
                         "Freq.Body.Acc.Std.Y"       ,     "Freq.Body.Acc.Std.Z"           ,
                         "Freq.Body.Acc.Jerk.Mean.X",       "Freq.Body.Acc.Jerk.Mean.Y"     , 
                         "Freq.Body.Acc.Jerk.Mean.Z"     ,  "Freq.Body.Acc.Jerk.Std.X"       ,
                         "Freq.Body.Acc.Jerk.Std.Y"     ,   "Freq.Body.Acc.Jerk.Std.Z"       ,
                         "Freq.Body.Gyro.Mean.X"       ,   "Freq.Body.Gyro.Mean.Y"         ,
                         "Freq.Body.Gyro.Mean.Z"      ,    "Freq.Body.Gyro.Std.X"          ,
                         "Freq.Body.Gyro.Std.Y"      ,     "Freq.Body.Gyro.Std.Z"          ,
                         "Freq.Body.Acc.Mag.Mean"   ,       "Freq.Body.Acc.Mag.Std"         , 
                         "Freq.Body.Acc.Jerk.Mag.Mean" , "Freq.Body.Acc.Jerk.Mag.Std"  ,
                         "Freq.Body.Gyro.Mag.Mean"    , "Freq.Body.Gyro.Mag.Std"     ,
                         "Freq.Body.Gyro.Jerk.Mag.Mean", "Freq.Body.Gyro.Jerk.Mag.Std" )
mdata<-melt(data_master,id=c("Subject","Type","Activity"))
Data_Final<-aggregate(value~Subject+Activity+Type+variable, mdata,mean)
colnames(Data_Final)=c("Subject","Activity","Type","Variable","Mean")