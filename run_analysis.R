 if(!file.exists("~/Coursera/GettingData/")){dir.create("~/Coursera/GettingData/")}
 fileUrl<-"http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
 download.file(fileUrl,destfile="~/Coursera/GettingData/dataset.zip")
 setwd("~/Coursera/GettingData")
 unzip("dataset.zip")
 setwd("~/Coursera/GettingData/UCI HAR Dataset/test")
 y_test<- read.table("y_test.txt")
 x_test<- read.table("X_test.txt")
 subject_test<-read.table("subject_test.txt")
 setwd("~/Coursera/GettingData/UCI HAR Dataset/train")
 X_train<- read.table("X_train.txt")
 y_train<- read.table("y_train.txt")
 subject_train<-read.table("subject_train.txt")
 Train<- cbind(y_train,subject_train,X_train)  
 Test<- cbind(y_test,subject_test,x_test)
 Total_Dataset<- rbind(Train, Test) 
 setwd("~/Coursera/GettingData/UCI HAR Dataset")
 Features<- read.table("features.txt")  
 Names<- Features[,2]
 Names<- as.character(Names)
 colnames(Total_Dataset)<- c("Activity","Subject",Names)
 names(Total_Dataset)<-gsub("-","",names(Total_Dataset))  ##Not sure I agree, but seems like instructors want no dashes
 Total_Dataset$Activity<- factor(Total_Dataset$Activity,labels=c("walking","walkingupstairs","walkingdownstairs","sitting","standing","laying"))
 Total_Dataset<-Total_Dataset[grepl(pattern = "Subject|std|mean|Activity", names(Total_Dataset))]
 Final<-aggregate(Total_Dataset,list(Total_Dataset$Subject,Total_Dataset$Activity),mean)
 Final$Group.1<-NULL
 Final$Activity<-NULL
 colnames(Final)[1]<- "Activity"
 write.table(Final,"final.txt",sep="\t")