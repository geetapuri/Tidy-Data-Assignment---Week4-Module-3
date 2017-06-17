## This is the CodeBook for describing the various variables used for run_analysis.R

List of variables used in the script along with their description - 

1. destfile = "Dataset.zip" // downloaded the file as..

2. x_train // training data table x read from file

3. y_train // training data table y read from file

4. subject_train // subjects for training

5. x_test // test data for x

6. y_test // test data for y

7. subject_test // subjects for test

8. activity_labels // activity names

9. common_train // common table for training

10. common_test // common table for test

11. common_data // common data table for training and test

12. mean_std_new // subset of common data with variables related to activity ID, subject ID, mean and std

13. final_table_descriptive // added names of activities 

14. second_tidy_data // second data set with means per subject per activity