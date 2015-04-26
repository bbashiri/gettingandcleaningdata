# gettingandcleaningdata
# The code uses dplyr library to tidy data
# file referfences the parent folder as the working directory
# 1 read the features list as a character vector
# 2 using cbind it combine training and tes set respectively and subjects and activity labels while assigning features names 
# 3 read activity labels
# 4 combine train and test set usnig rbind
# 5 select only unique comlumn names
# 6 joins activity labels to assign meaningful activity names
# 7 select only measures with mean and std in their names
# 8 create three sets X, Y, Z with columns containing "-X", "-Y", "-Z" respectively with columns not containing dimensions. 
# 9 Assign dimension column with values X, Y and Z to their corresponding sets 
# 10 remove "-X", "-Y", "-Z" from column names
# 11 combine X,Y, Z into HAR using rbind
# 12 summmarize the set by activity and subject using "mean" and function summarise_each
# 13 write tidy data set using write.table
