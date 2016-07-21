#this program was writen for the coursera course Getting and Cleaning data.  the purpose is to merge multiple files and
#extract columns with the word mean or std.  From this the average of these column was taken for each
#individual and test

#load 4 files, file1 & file3 are data,file2 & file4 are the individual (i.e. labels foreach row)
file1 = read.table("./zipFile/test/X_test.txt", header = FALSE)
file2 = read.table("./zipfile/test/y_test.txt")
file3 = read.table("./zipFile/test/subject_test.txt")

file4 = read.table("./zipFile/train/X_train.txt", header = FALSE)
file5 = read.table("./zipFile/train/y_train.txt")
file6 = read.table("./zipFile/train/subject_train.txt")



two_five <- rbind(file2, file5)
#write.csv(two_five,"./zipFile/two_five_test.csv")
two_five1 <- factor(two_five[,1],levels = c(1,2,3,4,5,6),
                  labels = c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))


#write.csv(two_five1, "./zipFile/2_5.csv)

three_six <- rbind(file3, file6)

Y_subj <- cbind(two_five1,three_six)


#write.csv(Y_subj,"./zipFile/Y_subj.csv")




activity_ind <-paste(as.character(Y_subj[,1]),as.character(Y_subj[,2]), sep = "~")
write.csv(activity_ind,"./zipFile/activity_ind.csv")

#add the column headers from file features.txt to file 1 & 3
column_names = read.table("./zipFile/features.txt")
CL_name1 = column_names[,2] # row the column list of names i.e column 2
#CL_name1
#class(CL_name1)
colnames(file1) <-CL_name1
#write.csv(file1,"./ZipFile/file1_names.csv")
colnames(file4) <-CL_name1
#write.csv(file4, "./ZipFile/file3_names.csv")


#add the row titles to file 1 & 3 with the information in file 2 & 4
mergeData1 <- rbind(file1,file4)

#mergeData1 <- mergeData1[,-3] # to elimnate a column

write.csv(mergeData1, "./zipFile/mergedata1.csv")

#subset columns based on key word mean, i.e. take out all columns containing the word column
subset1 <- mergeData1[,grep("mean",colnames(mergeData1))]
#droplevels.data.frame(subset1)
#write.csv(subset1, "./zipFile/subset1.csv")

subset2 <- mergeData1[,grep("std",colnames(mergeData1))]
#droplevels.data.frame(subset2)
#write.csv(subset2, "./zipFile/subset2.csv")

merge_test_train <- cbind(activity_ind,subset1,subset2)

write.csv(merge_test_train,"./zipFile/merge_test_train.csv")


library(dplyr)
final <- merge_test_train %>% group_by(activity_ind) %>% summarise_each(funs(mean))
#write.csv(final,"./zipFile/final.csv")

library(stringr)
fixed <-str_split_fixed(final$activity_ind, "~", 2)
#write.csv(fixed,"./zipFile/fixed.csv")
final1 <-final[,-1]
final2 <- cbind(fixed,final1)
colnames(final2)[1] <- c("activity")
colnames(final2)[2] <- c("individual")
write.csv(final2,"./zipFile/step5.txt")



