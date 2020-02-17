==========================================
Coursera data cleaning course final project
==========================================

This project consisted of merging and cleaning up a number of data sets into a single file that is easy to read and adheres to 'tidy data' principles.

The raw data is located in the folder UCI HAR Dataset. Complete descriptions of the raw data are included within the folder.

The codebook, located in the the same directory as this README file, contains descriptions of the data in the final data sets produced by this project.

To steps for converting the data from its raw state into the tidy final state are shown in the script file run_analysis.R

The script itself contains step-by-step documentation. The steps roughly consisted of the following:

First, the script installs and loads packages that make it easier to tidy data.

Second, the script downloads and unzips the raw data. This step has been deactivated in the script to prevent users from downloading the large file unnecessarily.

Third, the script imports all the necessary tables as data tables.

Fourth, the script begins to clean and merge the data tables. It merges the test set and the train set, which have identical columns and are thus simple to merge. Where relevant, namely with activity labels and subjects, it renames columns to make joining and merging tables easier. It adds the activity label and subject variables to the merged set. It cleans the data by replacing numerical variables with clearer variable names. It then subsets the data to choose only the variables that are means or standard deviations.

Finally, the script creates another set that groups the first set by activity and subject. Then it returns the means of the variables for each activity and each subset.
