Train_subject<- read.table("./train/subject_train.txt")
Train_x<- read.table("./train/X_train.txt")
Train_y<- read.table("./train/y_train.txt")
Test_subject<- read.table("./test/subject_test.txt")
Test_x<-read.table("./test/X_test.txt")
Test_y<-read.table("./test/y_test.txt")

Training_x_subject<-cbind(Train_x,Train_subject)
Training_x_subject_y<-cbind(Training_x_subject,Train_y)

Test_x_subject<-cbind(Test_x,Test_subject)
Test_x_subject_y<-cbind(Test_x_subject,Test_y)

Train_test<-rbind(Training_x_subject_y,Test_x_subject_y)

features<-read.table("./features.txt")
ColumnNames<-features[grep("mean\\b|std\\b", features$V2),1:2]
includedColumns <- c(ColumnNames[,1], ncol(Train_test)-1, ncol(Train_test))
filteredColumns<-Train_test[,includedColumns]
filteredData<-setNames(filteredColumns,c(as.character(ColumnNames[,2]), "subject", "activity"))



activity_labs<-read.table("./activity_labels.txt")
activity_labs[,2]<-as.character(activity_labs[,2])

tidyData<-filteredData
tidyData$activity<-activity_labs[match(tidyData$activity,activity_labs[,1]),2]


numCol<-ncol(tidyData)-2
indep_tidy_data<-aggregate(as.matrix(tidyData[,1:numCol])~subject + activity, tidyData, mean)
write.table(indep_tidy_data, "./Independent_Tidy_Data.txt", row.name = FALSE)
