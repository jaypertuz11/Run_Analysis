#Variables and process of scipt

#tep1: Read the data sets that were downloaded from the zip file to my desktop.

Test_Data = Test data provided by website

Train_Data= Train data provided by website

#tep2: Merge the Test and Train data set in to one data frame.

Merge_Data = Merged Test and Train data sets

#tep3: Get the subject identifiers and create a merged data set for later use.

Train_Test_Subj = Train data set subjects

Test_Test_Subj = Test data set subjects

Merge_Data_2 = Merged data set for subjects

#tep4: Get the activity identifiers and create a merged data set for later use.

Test_Activities = Activities from test data set

Train_Activities = Activities from train data set

Merge_Data_3 = Merged data set of activities

#tep5:Get the label names for the variables measured

Label_Names = Data set with the label names of the variables measured that was provided by website data

Column_Names = Vector that takes only the name of the variable dropping the row number from the Labels_Names data set

#tep6: Assign column names to the merged data set using the Column_Names vector

#Step7:Incorporate subject identifiers and activity identifiers to data set.

Merge_Data$Subject_ID= corresponds to the subject id's for each row of data

Merge_Data$Activity= corresponds to the activity for each row of data

#Step8: Get only those column names that have standard deviation and mean in the name using a text expressions

Column_Names = Captures the column names from the merged data set. This vector names is being reused

Extract_Mean_Std = Vector capturing the column that have either "STD()" or "Mean()" in the column name

#Step9: Using the column names identified extract only the required data from the data set

Extract_Data = Data frame that contains only STD() and Mean() data

#Step10:Lable each activity with descriptive names using a factor

Extract_Data$Activity_Names = Factor varialbe based on the activity identifiers

#Step11: Summary the by subject by activity

Column_Names: column names from the Extract_Data set

Column_Names_T= columns that only have STD() or Mean() in the name

Extract_Data_2 = data set from Extract_Data that is grouped by subject by activity with the mean calculated for each variable

#Step12: Clean the variable names to tidy the data set

