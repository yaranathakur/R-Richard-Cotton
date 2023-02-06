# Quantiles
# A quantile defines a particular part of a data set
# A quantile determines how many values in a distribution are above or below a certain limit. 
# Special quantiles are the quartile (quarter), the quintile (fifth) and percentiles (hundredth).

# The measures of position such as quartiles, deciles, and percentiles are available in quantile function
# Syntax: quantile(x, probs = seq(0, 1, 0.25), na.rm = FALSE, names = TRUE, type = 7, ...)
# x -> The data points
# prob –> The location to measure
# na.rm –> if FALSE, NA (Not Available) data points are not ignored
# names –> for attributes, FALSE means no attributes, hence speeds-up the computation
# type –> type of the quantile algorithms

# Quartile
scores <- c(88, 84, 83, 80, 94, 90, 81, 79, 79, 81, 85, 87, 86, 89, 92)
quantile(scores)                                                         # type = default : quartile

# Q0 = 0% means that 0% of data lies below or  =1 and 100% above 1 
# Q1 = 25% means that 25% of data lies below or  =81 and 75% above 81
# Q2 = 50% is median which means 50% data lies below or =85  and other 50% above 85 
# Q3 = 75% means that 75% of data lies below or  =88.5 and 25% above 88.5
# Q4 = 100% means that 100% of data lies below or  =94 and 0% above 94

# Deciles
weights <- c(69, 70, 75, 66, 83, 88, 66, 63, 61, 68, 73, 57, 52, 58, 77)
quantile(weights, prob = seq(0, 1, length = 11), type = 5)                  # type = 5 : decile

# D1 = 10% means 1/10 data lies below or equal to 57.0 and remaining 9/10 fall above 57.0
# D1 = 20% means 2/10 data lies below or equal to 59.5 and remaining 8/10 fall above 59.5
# And So on


# Calculating user passed quantile 15th , 25th , 35th percentile
quantile(scores, probs = c(.15, .25, .35))
# P15 means 15% data lies below or equal to 80.1 and remaining 85% lies above 80.1
# P25 means 25% data lies below or equal to 81 and remaining 85% lies above 81
# P35 means 35% data lies below or equal to 82.8 and remaining 85% lies above 82.8

quantile(weights, probs = c(.15, .25, .35))
# P15 means 15% data lies below or equal to 58.3 and remaining 85% lies above 58.3
# P25 means 25% data lies below or equal to 62.0 and remaining 85% lies above 62.0
# P35 means 35% data lies below or equal to 65.7 and remaining 85% lies above 65.7
