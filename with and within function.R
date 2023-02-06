#-------------------------- with() function

# Syntax: with(data, expr, ...)
# The with function evaluates an R expression in an environment constructed based on a data frame.
data <- data.frame(
  A = 1:5,
  B = 6:10
)
data

# Now we want to add another column C which is sum of A and b
data$C <- with(data, C <- A + B)
data

# We can also do the row sum 
with(data, A + B + C)



#-------------------------- within() function

# Syntax: within(data, expr, ...)
# Syntax: within(data frame, new-column <- R expression)
# The within function evaluates an R expression in an environment constructed based on a data frame 
# AND modifies the original data.

within(data, sum <- A + B + C)

