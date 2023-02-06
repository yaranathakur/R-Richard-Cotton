# 1. Write a R program to create an empty data frame.

empty_df <- data.frame()
print(empty_df)

#-------------------------------------------------------------------------------------------------------

# 2. Write a R program to create a data frame from four given vectors.

name <- c("Yarana", "Yash", "Vishal", "Abhay", "Abhishek")
location <- c("Maharani", "Pipra", "Chakia", "Pipra", "Motihari")
age <- c(19, 18, 17, 18, 17)
department <- c("IT", "Admin", "Office", "Sales", "Support")
fourv_df <- data.frame(name, location, age, department)
print(fourv_df)

#-------------------------------------------------------------------------------------------------------

# 3. Write a R program to get the structure of a given data frame.

str(fourv_df)

#-------------------------------------------------------------------------------------------------------

# 4. Write a R program to get the statistical summary and nature of the data of a given data frame.
summary(fourv_df)

#-------------------------------------------------------------------------------------------------------

# 5. Write a R program to extract specific column from a data frame using column name.

fourv_df$name
fourv_df$name[2]
fourv_df$location[1]

#-------------------------------------------------------------------------------------------------------

# 6. Write a R program to extract first two rows from a given data frame.

fourv_df[1:2,]

#-------------------------------------------------------------------------------------------------------

# 7. Write a R program to extract 3rd and 5th rows with 1st and 3rd columns from a given data frame.

fourv_df[c(3, 5),c(1, 3)]

#-------------------------------------------------------------------------------------------------------

# 8. Write a R program to add a new column in a given data frame.

fourv_df$gender <- c("M", "M", "M", "M", "M")
print(fourv_df)

id <- 1:5
new_fourv_df <- cbind(id, fourv_df)
print(new_fourv_df)

#-------------------------------------------------------------------------------------------------------

# 9. Write a R program to add new row(s) to an existing data frame.

new_row <- data.frame(id = 6, name = "Natasha", location = "Imagi", age = 18, department = "Diary", gender = "F")
new_row_df <- rbind(new_fourv_df, new_row)
print(new_row_df)

#-------------------------------------------------------------------------------------------------------

# 10. Write a R program to drop column(s) by name from a given data frame.

print("Original Data Frame")
print(fourv)
print("Data Frame After Dropping Columns By Name")
new_fourv_df_cdrop <- subset(fourv_df, select = -c(age, gender))
print(new_fourv_df_cdrop)

#-------------------------------------------------------------------------------------------------------

# 11. Write a R program to drop row(s) by number from a given data frame.

print("Original Data Frame")
print(fourv)
print("Data Frame After Dropping Rows By Number")
new_fourv_df_rdrop <- fourv_df[-c(1, 2, 3),]
print(new_fourv_df_rdrop)

#-------------------------------------------------------------------------------------------------------

# 12. Write a R program to sort a given data frame by multiple column(s).

print("Original Data")
print(fourv_df)
print("Original Data After Sorting")
fourv_df <- fourv_df[with(fourv_df, order(age)),]
print(fourv_df)

#-------------------------------------------------------------------------------------------------------

# 13. Write a R program to create inner, outer, left, right join(merge) from given two data frames.

#-------------------------------------------------------------------------------------------------------

# 14. Write a R program to replace NA values with 3 in a given data frame.

#-------------------------------------------------------------------------------------------------------

# 15. Write a R program to change a column name of a given data frame.

#-------------------------------------------------------------------------------------------------------

# 16. Write a R program to change more than one column name of a given data frame.

#-------------------------------------------------------------------------------------------------------

# 17. Write a R program to select some random rows from a given data frame.

#-------------------------------------------------------------------------------------------------------

# 18. Write a R program to reorder an given data frame by column name.

#-------------------------------------------------------------------------------------------------------

# 19. Write a R program to compare two data frames to find the row(s) in first data frame that are not present in second data frame.

#-------------------------------------------------------------------------------------------------------

# 20. Write a R program to find elements which are present in two given data frames.

#-------------------------------------------------------------------------------------------------------

# 21. Write a R program to find elements come only once that are common to both given data frames.

#-------------------------------------------------------------------------------------------------------

# 22. Write a R program to save the information of a data frame in a file and display the information of the file.

#-------------------------------------------------------------------------------------------------------

# 23. Write a R program to count the number of NA values in a data frame column.

#-------------------------------------------------------------------------------------------------------

# 24. Write a R program to create a data frame using two given vectors and display the duplicated elements and unique rows of the said data frame.

#-------------------------------------------------------------------------------------------------------

# 25. Write a R program to call the (built-in) dataset airquality. Check whether it is a data frame or not? Order the entire data frame by the first and second column.

#-------------------------------------------------------------------------------------------------------

# 26. Write a R program to call the (built-in) dataset airquality. Remove the variables 'Solar.R' and 'Wind' and display the data frame.
