CodeBook
================

GitHub Documents
----------------

This script will import specific files, extract columns with a specific mean, merge both test and training files plus generate the mean for those columns for each individual (ind)..

Including Code
--------------

You can include R code in the document as follows:

load 4 files, file1 & file3 are data,file2 & file4 are the individual (i.e. labels foreach row)
===============================================================================================

file1 = read.table("./zipFile/test/X\_test.txt", header = FALSE) file2 = read.table("./zipfile/test/y\_test.txt")

file3 = read.table("./zipFile/train/X\_train.txt", header = FALSE) file4 = read.table("./zipFile/train/y\_train.txt")

add the column headers from file features.txt to file 1 & 3
===========================================================

column\_names = read.table("./zipFile/features.txt") CL\_name1 = column\_names\[,2\] \# row the column list of names i.e column 2 \#CL\_name1 \#class(CL\_name1) colnames(file1) &lt;-CL\_name1 \#write.csv(file1,"./ZipFile/file1\_names.csv") colnames(file3) &lt;-CL\_name1 \#write.csv(file3, "./ZipFile/file3\_names.csv")

add the column header to file 2 & 4 "individual
===============================================

colnames(file2) &lt;-"individual" \#head(file2) \#write.csv(file2,"./ZipFile/file2\_names.csv") colnames(file4) &lt;-"individual" \#write.csv(file4, "./zipFile/file4\_names.csv")

add the row titles to file 1 & 3 with the information in file 2 & 4
===================================================================

mergeData1 &lt;- merge(file2,file1,by="row.names", sort = FALSE) \#write.csv(mergeData1, "./zipFile/mergedata1.csv") mergeData2 &lt;- merge(file4,file3, by="row.names", sort = FALSE) \#write.csv(mergeData2,"./zipFile/mergeData2.csv")

merge the test and training sets
================================

mergeData &lt;- merge(mergeData1, mergeData2,all = TRUE, sort = FALSE) write.csv(mergeData,"./zipFile/mergedata.csv")

make individual names for the larger file
=========================================

Ind &lt;- mergeData\[,2\] \#write.csv(Ind,"./zipFile/Ind.csv") \# can I delete this????write.csv(mergeInd,"./zipFile/mergeInd.csv")

subset columns based on key word mean, i.e. take out all columns containing the word column
===========================================================================================

subset1 &lt;- mergeData\[,grep("mean",colnames(mergeData))\] \#droplevels.data.frame(subset1) \#write.csv(subset1, "./zipFile/subset1.csv")

subset2 &lt;- mergeData\[,grep("std",colnames(mergeData))\] \#droplevels.data.frame(subset2) \#write.csv(subset2, "./zipFile/subset2.csv")

combine the subset and add individual names to them
===================================================

mean\_std\_set &lt;- cbind(Ind,subset1,subset2) write.csv(mean\_std\_set, "./zipFile/Data\_set\_step4")

require(data.table) DT &lt;-data.table(mean\_std\_set) \#write.csv(DT,"./zipFile/DT.csv") Ind\_mean &lt;-DT\[,lapply(.SD, mean), by = mean\_std\_set$Ind\] write.csv(Ind\_mean, "./zipFile/Data\_set-step4\_mean\_std.csv")

Including Plots
---------------

You can also embed plots, for example:

![](Codebook_files/figure-markdown_github/pressure-1.png)

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.
