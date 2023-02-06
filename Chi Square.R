# Data Entry

data_frame <- read.csv("https://goo.gl/j6lRXD")
table(data_frame$treatment, data_frame$improvement)


# In this test, we have to check the p-values
# We assume this test as a null hypothesis and an alternate hypothesis.
# we reject the null hypothesis if the p-value that comes out in the result 
# is less than a predetermined significance level, which is 0.05 usually
# H0: The two variables are independent.
# H1: The two variables relate to each other.

chisq.test(data_frame$treatment, data_frame$improvement, correct=FALSE)

# Mini Challenge
data(mtcars)
table(mtcars$carb, mtcars$cyl)
chisq.test(mtcars$carb, mtcars$cyl)
