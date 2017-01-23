#Getting and Cleaning Data Peer Assessment
This repository contains the solution for my getting and cleaning data assessment.
In order to run this code you'll need all the information from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Unzip it first in order to run the code. In order to see that the code works try to set your working directory in the file unzipped: "UCI HAR Dataset".

This code just simply tidies the data entered from the source already named.
First of all, it orders in columns all the variables from x, y and also of subjects either in test and in training.
Then, the the columns that have mean or std deviation are seleted and then it's names are assigned.
Finally, the output represents the average of each variable for each activity and each subject. As you will see the output is a .txt file named Independent_Tidy_Data.

In order to get your global environment clean at the end, you can clean the variables generated in the process.
