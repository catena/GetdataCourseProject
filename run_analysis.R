
# read table from a file and returns as a data.table object
reader <- function(file) {
    records <- read.table(file, nrows = 10, stringsAsFactors = F)
    records.classes <- sapply(records, class)
    records <- read.table(file, colClasses = records.classes, comment.char = "")
    records <- as.data.table(records)
    records
}

# filter table and extract only the columns specified in subset (numeric vector)
colFilter <- function(DT, subset) {
    deleteCols <- setdiff(1:ncol(DT), subset)
    DT[, (deleteCols) := NULL]
    DT
}

# replace src column values with target column values, linked to each
# other by the target_key and src_key
colSubstitute <- function(target, target_key, src, src_key) {
    setkeyv(target, target_key)
    target[J(src[[src_key]])]
}

# create a reader that substitutes activity identifiers with activity names
makeActivityLabelReader <- function(activity_list_file) {
    activity_list <- reader(activity_list_file)
    
    function(activity_id_file) {
        activity_id <- reader(activity_id_file)
        activity_id <- colSubstitute(activity_list, "V1", activity_id, "V1")
        colFilter(activity_id, 2)
    }
}

# creates a reader that extracts the required mean and standard deviation
# features from the feature vector
makeFeatureVectorReader <- function(features_file) {
    features <- reader(features_file)
    
    # find the indices/names of required features to preserve
    feature_idx <- grep("mean\\(\\)|std\\(\\)|meanFreq\\(\\)", 
                        features[[2]], ignore.case = T)
    
    # remove parantheses in feature names
    feature_names <- features[feature_idx][[2]]
    feature_names <- gsub("\\(\\)", "", feature_names)

    function(feature_vector_file) {
        records <- reader(feature_vector_file)
        colFilter(records, feature_idx)     # remove unwanted features
        setnames(records, feature_names)
        records
    }
}

# build the activity dataset
buildActivityData <- function() {
    trainFiles <- list(feature_vector = "train/X_train.txt",
                       activity_id = "train/y_train.txt",
                       subject_id = "train/subject_train.txt")
    testFiles <- list(feature_vector = "test/X_test.txt",
                      activity_id = "test/y_test.txt",
                      subject_id = "test/subject_test.txt")
    
    activityLabelRead <- makeActivityLabelReader("activity_labels.txt")
    featureVectorRead <- makeFeatureVectorReader("features.txt")
    strategy <- list(activityLabelRead = activityLabelRead, 
                     featureVectorRead = featureVectorRead)
    
    trainRecords <- buildActivityDataSingle(c(trainFiles, strategy))
    testRecords <- buildActivityDataSingle(c(testFiles, strategy))
    
    # merge train and test records
    records <- rbindlist(list(trainRecords, testRecords))
    setorderv(records, c("subjectId", "activityName"))
}

buildActivityDataSingle <- function(context) {
    subjectId <- reader(context$subject_id)
    activityName <- context$activityLabelRead(context$activity_id)
    records <- context$featureVectorRead(context$feature_vector)
    
    # add subjectId and activityName columns
    records[, subjectId := subjectId][, activityName := activityName]
    
    # move subjectId and activityName to the front
    n <- ncol(records)
    setcolorder(records, c(n - 1, n, seq_len(n - 2)))
    
    records
}

# build average activity data, mean of all features grouped by subjectId
# and activityName
buildMeanActivityData <- function(feature_data) {
    avgFeature <- feature_data[, lapply(.SD, mean), 
                               by = list(subjectId, activityName)]
    setorderv(avgFeature, c("subjectId", "activityName"))
}

# persist data.table to disk
write.dataset <- function(dt, file) {
    write.table(dt, file = file, quote = FALSE, sep = "\t",
                row.names = FALSE, col.names = TRUE)
}

# create the datasets, driver method
createDatasets <- function() {
    featureData <- buildActivityData()
    meanFeatureData <- buildMeanActivityData(featureData)
    write.dataset(featureData, "./activityData.txt")
    # write.dataset(meanFeatureData, "./averageActivity.txt")
}

library(data.table)
createDatasets()


