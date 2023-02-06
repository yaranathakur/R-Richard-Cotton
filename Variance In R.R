# Variance
# The variance is a numerical measure of how the data values is dispersed around the mean.
# Variance is a measurement of the spread between numbers in a data set.

# The variance is a measure of variability. 
# It is calculated by taking the average of squared deviations from the mean.

# Variance tells you the degree of spread in your data set. 
# The more spread the data, the larger the variance is in relation to the mean.

# Standard deviation is expressed in the same units as the original values (e.g., meters).
# Variance is expressed in much larger units (e.g., meters squared)

# It is the measure of how much value is away from the mean value.


# var() function is used to calculate variance in R
# Syntax : var(x)
# x -> Numeric Vector

x <- c(1, 2, 3, 4, 5, 6, 7)
y <- var(x)                       
print(y)

