# Standard Deviation
# It is a measure that indicates how much data is scattered around the mean/average
# Standard deviation is the root of sum of squared deviations
 
# There is 2 ways to calculate Standard Deviation in R

# Method1 : Naive Approach
# Direct Formula Applying
# Formula : sqrt(sum((x-mean(x))^2/(length(x)-1)))
# Where x -> Datasets
v <- c(12,24,74,32,14,29,84,56,67,41)
s<-sqrt(sum((v-mean(v))^2/(length(v)-1)))
print(s)

# Method2 : Using sd() function
# Syntax: sd(x, na.rm = FALSE)
# x: a numeric vector, matrix or data frame.
# na.rm: missing values be removed?

v <- c(12,24,74,32,14,29,84,56,67,41)
s<-sd(v)
print(s)


