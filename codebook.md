Tidy Data Code Book
===================

Group notes if the observation belonged to the test or train group. There are only two groups: test and train.

Subject notes the identifier number of the subject (i.e., the person) associated with the observation. There were thirty (30) subjects.

Activity notes the physical activity associated with the observation. There are six self-explanatory activities: standing, sitting, laying, walking, walk_downstairs, and walking_upstairs.

The remaining variables are the means and standard deviations of a number of accelerometer and gyroscope measurements. Each of these variables is composed of the type of measurement (e.g., "fBodyGyro" or "tGravityAcc"), whether it's a mean or standard deviation (e.g., "_mean", "_meanFreq" or "_std"), and in some cases the axial dimension (e.g., "_X", "_Y", "_Z")

More information on how these remaining accelerometer and gyroscope variables were measured and calculated are below.

The bases of the means and standard deviations come from accelerometer and gyroscope 3-axial raw signals tAcc_XYZ and tGyro_XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc_XYZ and tGravityAcc_XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk_XYZ and tBodyGyroJerk_XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc_XYZ, fBodyAccJerk_XYZ, fBodyGyro_XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'_X', "_Y", and "_Z" are used to denote 3-axial signals in the X, Y and Z directions, respectively.

tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean: Mean value
std: Standard deviation
meanFreq: Weighted average of the frequency components to obtain a mean frequency