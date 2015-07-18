
# Getting and Cleaning Data Course Project


***


## Description of source dataset

See [here][1] for a description of the source dataset. 


***


## Work/Transformations applied

The subject identifier for each pattern is read from 'UCI HAR Dataset/train/subject_train.txt'. The activity labels are read from 'UCI HAR Dataset/train/y_train.txt' and then substituted with activity names linked to their class labels by 'UCI HAR Dataset/activity_labels.txt'. The next step is to extract mean and standard deviation measurements from the training set 'UCI HAR Dataset/train/X_train.txt', which is a table of 'pattern X feature vector'. The required measurements are a subset of components of the feature vector for all patterns. The position of the required elements of feature vector is computed from 'features.txt' and is then used to extract the measurements from the training set. The subject identifiers, activity labels and extracted measurements are merged columnwise to build the training table. Similary, the measurements table for test data is created (only filenames change). Finally the training and test data tables are merged together to create a single dataset. *Note: there are no changes to the units of feature variables.*

The final tidy data will be created as a txt file `activityData.txt`.


***


## Description of variables

### subjectId

An identifier of the subject who carried out the experiment. Its range is from 1 to 30. 

### activityName 

Activity name could be one of the six activities: 

- WALKING
- WALKING_UPSTAIRS
- WALKING_DOWNSTAIRS
- SITTING
- STANDING
- LAYING


### Features selected from database 

Measurements of mean and standard deviation of features were selected. Feature variables were named using the following convention:
    
* 'BodyAcc', 'GravityAcc' denotes body and gravitational acceleration signals respectively
* 'Jerk' denotes acceleration jerk signals
* 'Gyro' indicates gyroscope signals
* 'Mag' specifies magnitude of signal calculated using euclidean norm
* '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
* Time domain signals (prefix 't' to denote time)
* Prefix 'f' indicates frequency domain signals, computed by applying FFT.
* 'mean': Mean value
* 'std': Standard deviation
* 'meanFreq': Weighted average of the frequency components to obtain a mean frequency.

For example: tBodyGyroJerkMag-std => Magnitude of the time-domain gyroscope body jerk signal
    
*Note: Features are normalized and bounded within [-1,1].*


***


## Complete list of variables

1.	subjectId
2.	activityName
3.	tBodyAcc-mean-X
4.	tBodyAcc-mean-Y
5.	tBodyAcc-mean-Z
6.	tBodyAcc-std-X
7.	tBodyAcc-std-Y
8.	tBodyAcc-std-Z
9.	tGravityAcc-mean-X
10.	tGravityAcc-mean-Y
11.	tGravityAcc-mean-Z
12.	tGravityAcc-std-X
13.	tGravityAcc-std-Y
14.	tGravityAcc-std-Z
15.	tBodyAccJerk-mean-X
16.	tBodyAccJerk-mean-Y
17.	tBodyAccJerk-mean-Z
18.	tBodyAccJerk-std-X
19.	tBodyAccJerk-std-Y
20.	tBodyAccJerk-std-Z
21.	tBodyGyro-mean-X
22.	tBodyGyro-mean-Y
23.	tBodyGyro-mean-Z
24.	tBodyGyro-std-X
25.	tBodyGyro-std-Y
26.	tBodyGyro-std-Z
27.	tBodyGyroJerk-mean-X
28.	tBodyGyroJerk-mean-Y
29.	tBodyGyroJerk-mean-Z
30.	tBodyGyroJerk-std-X
31.	tBodyGyroJerk-std-Y
32.	tBodyGyroJerk-std-Z
33.	tBodyAccMag-mean
34.	tBodyAccMag-std
35.	tGravityAccMag-mean
36.	tGravityAccMag-std
37.	tBodyAccJerkMag-mean
38.	tBodyAccJerkMag-std
39.	tBodyGyroMag-mean
40.	tBodyGyroMag-std
41.	tBodyGyroJerkMag-mean
42.	tBodyGyroJerkMag-std
43.	fBodyAcc-mean-X
44.	fBodyAcc-mean-Y
45.	fBodyAcc-mean-Z
46.	fBodyAcc-std-X
47.	fBodyAcc-std-Y
48.	fBodyAcc-std-Z
49.	fBodyAcc-meanFreq-X
50.	fBodyAcc-meanFreq-Y
51.	fBodyAcc-meanFreq-Z
52.	fBodyAccJerk-mean-X
53.	fBodyAccJerk-mean-Y
54.	fBodyAccJerk-mean-Z
55.	fBodyAccJerk-std-X
56.	fBodyAccJerk-std-Y
57.	fBodyAccJerk-std-Z
58.	fBodyAccJerk-meanFreq-X
59.	fBodyAccJerk-meanFreq-Y
60.	fBodyAccJerk-meanFreq-Z
61.	fBodyGyro-mean-X
62.	fBodyGyro-mean-Y
63.	fBodyGyro-mean-Z
64.	fBodyGyro-std-X
65.	fBodyGyro-std-Y
66.	fBodyGyro-std-Z
67.	fBodyGyro-meanFreq-X
68.	fBodyGyro-meanFreq-Y
69.	fBodyGyro-meanFreq-Z
70.	fBodyAccMag-mean
71.	fBodyAccMag-std
72.	fBodyAccMag-meanFreq
73.	fBodyBodyAccJerkMag-mean
74.	fBodyBodyAccJerkMag-std
75.	fBodyBodyAccJerkMag-meanFreq
76.	fBodyBodyGyroMag-mean
77.	fBodyBodyGyroMag-std
78.	fBodyBodyGyroMag-meanFreq
79.	fBodyBodyGyroJerkMag-mean
80.	fBodyBodyGyroJerkMag-std
81.	fBodyBodyGyroJerkMag-meanFreq


[1]: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones