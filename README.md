<<<<<<< HEAD
Supplement to Human Activity Recognition Using Smartphones Dataset

Author: OYA
Version 1.0

README is a supplement to the README.txt file provided with the original dataset


The dataset includes the following additional files:
=======
GetData_CourseProject
==================================================================
Supplement to Human Activity Recognition Using Smartphones Dataset
Author: OYA
Version 1.0
==================================================================

README is a supplement to the README.txt file provided with the original dataset
================================================================================

The dataset includes the following additional files:
====================================================
>>>>>>> 902e51a9cfe494a3db274ea70ffe3bcde84776e4
- 'README.md'
- 'CODEBOOK.md'
- 'run_analysis.R': script that constructs the 'tidy_dataset.txt' from the original data files
- 'tidy_dataset.txt': consists of 180 rows and 68 columns
		      Each row identifies a subject while performing a certain activity.
		      For each activity and subject combination several parameters have been calculated.
		      These 66 parameters are the averages values of the mean or standard deviation of the features that were measured per activity and subject. 
		      A further description of the 'tidy_dataset.txt' can be found in the 'CODEBOOK.md'.

<<<<<<< HEAD

How tidy_dataset.txt is constructed:
=======
How tidy_dataset.txt is constructed:
====================================
>>>>>>> 902e51a9cfe494a3db274ea70ffe3bcde84776e4
- Test and training dataset were first constructed separately using the original data files (see README.txt with original dataset for more info)

	- Test set
		- 'y_test.txt' was used to create a 1-column dataframe containing the activity that was performed (df1)
		- 'subject_test.txt' was used to create a 1-column dataframe containing the ID of the subject that was measured (df2)
		- 'x-test.txt' was used to create the dataframe containing the values of all features (df3)
		- 'features.txt' was used to write the column names for df3
		- df1, 2 and 3 were combined into the Test set

	- Training set
		- All steps performed to create the Test set were repeated using the equivalent datafiles for the Training set to create the Training set

- Test set and Training set were combined into the Full set

	- The activity column in the Full set was changed from a numeric to a factor class using the 'activity_labels.txt' file

- Columns containing the mean or standard deviation of the measurements were extracted from the Full set
	- Column names were selected if they contained mean() or std().
	- Column names containing meanFreq were not selected, as these values describe the mean frequency of a measurement.
	- Column names containing mean as a parameter for the angle() function were also not included.

- 'tidy_dataset.txt' was created
<<<<<<< HEAD
	- This dataset contains the average values of the mean or standard deviation of the features that were measured per activity(6) and per subject(30).
=======
	- This dataset contains the average values of the mean or standard deviation of the features that were measured per  activity(6) and per subject(30).
>>>>>>> 902e51a9cfe494a3db274ea70ffe3bcde84776e4



