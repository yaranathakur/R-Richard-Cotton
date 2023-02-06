# MEAN MEDIAN MODE

# Mean
# def: Sum of all value/total number of value
# Syntax: mean(x, trim = 0, na.rm = TRUE)
# x-> input vector
# trim -> drop some value from both end of the sorted vetor
# na.rm -> Remove all the missing value

# Example
x <- c(12,7,3,4, .2,18,2,54,-21,8,-5,NA)
mean(x)           
mean(x, na.rm = TRUE)

# Median
# def: Middle most value in a data series
# Syntax: median(x, na.rm = TRUE)
# x-> input vector
# na.rm -> Remove all the missing value
x <- c(12,7,3,4.2,18,2,54,-21,8,-5)
median(x, na.rm = TRUE)


# Mode
# Highest occuring value in a data set 
# It has both numeric and character data
# R has not inbuilt function to calculate mode

# Unique function
# The unique() function in R is used to eliminate or delete the 
# duplicate values or the rows present in the vector, data frame, matrix
# Syntax: unique(x, incomparables = FALSE, ... ...)
# x -> vector,data frame,matrix

x <- c(1,2,3,2,4,5,1,6,8,9,8,6)
unique(x);message("Eliminate The Duplicate Value in Data Set")


matrixx <- matrix(1:20,nrow = 6, ncol = 4, byrow = TRUE)
matrixx
unique(matrixx); message("Row 6 is eliminated")

data_frame <- data.frame(Name = c("Yarana", "Vibe", "Ballu", "Raman", "Raman", "Ballu"),
                         Age = c(19, 18, 20, 23, 23, 20),
                         Gender = c("Male", "Female", "Male", "Male", "Male", "Male"))
data_frame
unique(data_frame); message("Duplicate Data Will BE Eliminated")

unique(data_frame$Name); message("Print Unique Value Of A Particular Column")
unique(data_frame$Age); message("Print Unique Value Of A Particular Column")
unique(data_frame$Gender); message("Print Unique Value Of A Particular Column")

# Finding Length of Unique Value
datasets::BOD
unique(BOD$demand)
length(unique(BOD$demand))


# Creating a function to calculate mode
getmode <- function(v){
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}


x <- c(2,1,2,3,1,2,3,4,1,5,5,3,2,3)
getmode(x)
table(x)
-table(x)

charv <- c("o","it","the","it","it")
getmode(charv)
table(charv)

mode = function(x){
  return(sort(-table(x))[1])
}

mode(x)
mode(charv)


# We can also calculate the most frequent value using modeest library mfv() function
# By using modest package
install.packages("modeest")
require(modeest)
mfv(x)
x
