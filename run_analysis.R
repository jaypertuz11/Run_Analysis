#read the data from the train data set and the test data set
  Test_Data<-read.table("C:/Users/jpnw/RWorking/X_test.txt",header = FALSE)
  Train_Data<-read.table("C:/Users/jpnw/RWorking/X_train.txt",header = FALSE)
#merge the two data sets
  Merge_Data<-merge(Test_Data,Train_Data,all = TRUE)
#get subject identifiers and merge them
  Train_Test_Subj<-read.table("C:/Users/jpnw/RWorking/subject_train.txt")  
  Test_Test_Subj<-read.table("C:/Users/jpnw/RWorking/subject_test.txt")
  Merge_Data_2<-merge(Test_Test_Subj,Train_Test_Subj,all = TRUE)
# get activities and assign to data set
  Test_Activities<-read.table("C:/Users/jpnw/RWorking/y_test.txt")
  Train_Activities<-read.table("C:/Users/jpnw/RWorking/y_train.txt")
  Merge_Data_3<-rbind(Test_Activities,Train_Activities)
#get the label names for the activities
Label_Names<-read.delim("C:/Users/jpnw/RWorking/Label_names.txt",header = FALSE,sep = " ")
Column_Names<-Label_Names[,2]
#assign column names toM the merged data set
colnames(Merge_Data)<-Column_Names
# incorporate subject identifiers and activity identifiers to data set
Merge_Data$Subject_ID=Merge_Data_2$V1
Merge_Data$Activity=Merge_Data_3$V1
# get only those column names that have standard deviation and mean in the name
Column_Names<-colnames(Merge_Data)
Extract_Mean_Std<-grep("std()|mean()|Subject|Activity",Column_Names)
# extract only the data set that has the mean and std deviation of each measurement
Extract_Data<-Merge_Data[,Extract_Mean_Std]
#lable each activity with descriptive names
Extract_Data$Activity_Names<-as.factor(Extract_Data$Activity)
levels(Extract_Data$Activity_Names)<-c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS",
"SITTING","STANDING","LAYING")
#summarize the data by subject by activty
Column_Names<-colnames(Extract_Data)
Column_Names_T<-grep("std()|mean()",Column_Names)
Extract_Data_2<-aggregate(Extract_Data[, Column_Names_T], 
list(Extract_Data$Subject_ID,Extract_Data$Activity_Names), mean)
#reassign the variable names to clean data
Column_Names_T1<-colnames(Extract_Data_2)
Column_Names_T1[1]="Subject_ID"
Column_Names_T1[2]="Activity_Name"
colnames(Extract_Data_2)<-Column_Names_T1


