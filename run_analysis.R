
setwd("C:\\Data Science Coursera\\Getting and Cleaning Data\\")
library(dplyr)
features <- as.character(read.table("./UCI HAR Dataset/features.txt")$V2)
train <- cbind(read.table("./UCI HAR Dataset/train/y_train.txt") %>% setNames("activity_id"),
                  read.table("./UCI HAR Dataset/train/subject_train.txt", colClasses = "factor") %>% setNames("subject_id"),
                  read.table("./UCI HAR Dataset/train/X_train.txt") %>% setNames(features))
test <- cbind(read.table("./UCI HAR Dataset/test/y_test.txt") %>% setNames("activity_id"),
                  read.table("./UCI HAR Dataset/test/subject_test.txt", colClasses = "factor") %>% setNames("subject_id"),
                  read.table("./UCI HAR Dataset/test/X_test.txt") %>% setNames(features))
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt") %>% setNames(c("activity_id", "activity"))
HAR <- rbind(train, test)[, unique(colnames(train))] %>% 
    inner_join(activity_labels) %>%
    select(subject_id, activity, contains("-mean"), contains("-std"))
X <- HAR %>% select(-contains("-Y"), -contains("-Z")) %>% cbind(direction = "X") 
names(X) <- gsub("-X", "", names(X))
Y <- HAR %>% select(-contains("-X"), -contains("-Z")) %>% cbind(direction = "Y")
names(Y) <- gsub("-Y", "", names(Y))
Z <- HAR %>% select(-contains("-X"), -contains("-Y")) %>% cbind(direction = "Z")
names(Z) <- gsub("-Z", "", names(Z))
HAR <- rbind(X,Y,Z)
HAR_summarized <- HAR %>% group_by(subject_id, activity) %>%
    summarise_each(funs(mean)) 
write.table(HAR_summarized, "./HAR_summarized.txt", row.names = FALSE)
