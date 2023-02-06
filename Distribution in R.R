### Distribution in R ###

# The concept of data distribution where distributions are simply the population, holding scattered data.
# Data distribution is a function that determines the values of a variable and quantifies relative 
# frequency, it transforms raw data into graphical methods to give valuable information

# when statisticians or data experts analyze data sets, the very first step is to conduct exploratory
# data analysis (EDA) for learning about characteristics of a specific feature in data sets that help 
# in understanding any pattern present in the data distributions.

# Through this way, they can tailor machine learning models suitable for particular case studies
# as ML models are designed under some data distribution assumptions. 



# Types Of Distribution in Statistics


# 1. Bernoulli Distribution
#  Bernoulli distribution has possibly two outcomes (success or failure) and a single trial.
# For example, tossing a coin, the success probability of an outcome to be heads is p, 
# then the probability of having tail as outcome is (1-p). 
# Bernoulli’s distribution is the special case of binomial distribution with a single trial.

# f(x) = p^x (1-p)^(1-x)   where x € (0,1)

# In r there is 4 function   to do Bernoulli distribution
# 1. dbern(x, prob, log = FALSE)
# x -> vector quantiles
# prob -> Probability of success of each trial
# log -> Logical if TRUE probability p is given as log(p)

install.packages("Rlab")
require(Rlab)
x <- seq(0, 10, by = 1)
y <- dbern(x, prob = .7)
plot(y, type = "o")


# 2. pbern(x, prob, lower.tail, log.p = FALSE)
# lower.tail -> Logical
# log.p -> logical; if TRUE, probabilities p are given as log(p).
x
y <- pbern(x, prob = .7)
plot(y, type = "o")


# 3. qbern
# qbern(p, prob, lower.tail = TRUE, log.p = FALSE)
x <- seq(0, 1, by = 0.2)
y <- qbern(x, prob = 0.5,lower.tail = TRUE, log.p = FALSE)  
y
plot(y, type = "o")


# 4. rbern
# rbern( ) function in R programming is used to generate a vector of random numbers which are Bernoulli distributed.
# Syntax: rbern(n, prob)
# n -> Number of observations
N <- 1000
random_values <- rbern(N, prob = 0.5)
random_values
hist(random_values)

#----------------------------------------------------------------------------------------------#

# 2. Binomial Distribution 
# The binomial distribution is applied in binary outcomes events where the probability of 
# success is equal to the probability of failure in all the successive trials. 
# Its example includes tossing a biased/unbiased coin for a repeated number of times.
# It is also used in many real-life scenarios such as in determining 
# whether a particular lottery ticket has won or not, 
# whether a drug is able to cure a person or not, 
# it can be used to determine the number of heads or tails in a finite number of tosses, 
# for analyzing the outcome of a dice, etc.
# The outcomes from different trials are independent

# We have 4 types of function in r to do binomial distribution

# 1. dbinom
# Syntax: dbinom(k, n, p)
# n -> total number of trials
# p -> probability of success
# k -> the value at which the probability has to be found out.
# This function gives the probability density distribution at each point.

x <- seq(0,50,by = 1)
y <- dbinom(x,50,0.5)
plot(x,y)


# 2. pbinom
# Syntax(k, n, p)
# n -> total number of trials
# p -> probability of success
# k -> the value at which the probability has to be found out.
# This function gives the cumulative probability of an event. 
# It is a single value representing the probability.

# Probability of getting 26 or less heads from a 51 tosses of a coin.
x <- pbinom(26,51,0.5)
x


# 3. qbinom
# Syntax(P, n, p)
# P -> the probability
# n -> the total number of trials
# p -> the probability of success.
# This function takes the probability value and gives a number whose 
# cumulative value matches the probability value.

# How many heads will have a probability of 0.25 will come out when a coin
# is tossed 51 times.
x <- qbinom(0.25,51,1/2)
x


# 4. rbinom
# Syntax: rbinom(n, N, p)
# n -> numbers of observations
# N -> the total number of trials
# p -> the probability of success.
# This function generates required number of random values of given probability from a given sample.

# Find 8 random values from a sample of 150 with probability of 0.4.
x <- rbinom(8, 150, 0.4)
x


#------------------------------------------------------------------------------------------------#


# 3. NORMAL(GAUSIAN) DISTRIBUTION
# Definition : Normal Distribution is a probability function used in statistics that tells about how the data values are distributed

# A normal distribution, sometimes called the bell curve
# The bell curve is symmetrical. 
# Half of the data will fall to the left of the mean; half will fall to the right.
# The mean, mode and median are all equal.
# The total area under the curve is 1.

# 68% of the data falls within one standard deviation of the mean.
# 95% of the data falls within two standard deviations of the mean.
# 99.7% of the data falls within three standard deviations of the mean.

# In R, there are 4 built-in functions to generate normal distribution:

# 1. dnorm()
# dnorm() function in R programming measures density function of distribution
# dnorm(x, mean, sd)
# x -> Datasets of Values
# mean -> mean of x
# sd -> standard deviation of x
x <- seq(-15, 15, by=0.1)
y <- dnorm(x, mean(x), sd(x))
print(y)
plot(x,y)
plot(y)

# 2. pnorm()
# pnorm() function is the cumulative distribution function which measures the probability
# pnorm(x, mean, sd)
# x -> Datasets of Values
# mean -> mean of x
# sd -> standard deviation of x
x <- seq(-10, 10, by=0.1)
y <- pnorm(x, mean = 2.5, sd = 2)
plot(x, y)

# 3. qnorm()
# qnorm() function is the inverse of pnorm() function. 
# It takes the probability value and gives output which corresponds to the probability value. 
# It is useful in finding the percentiles of a normal distribution.
# qnorm(p, mean, sd)
# p -> P is vector of probabilities
# mean -> mean of x
# sd -> standard deviation of x
x <- seq(0, 1, by = 0.02)
y <- qnorm(x, mean(x), sd(x))
plot(x, y)

# 4. rnorm()
# rnorm() function in R programming is used to generate a vector of random numbers which are normally distributed.
# rnorm(n, mean, sd)
# n -> Number of observation
# mean -> mean of x
# sd -> standard deviation of x
x <- rnorm(10000, mean=90, sd=5)
hist(x, breaks = 50)


#------------------------------------------------------------------------------------------------#


# Poisson Distribution
# poisson distribution outlines the probability for a given number of events that 
# take place in a fixed time period or space, or particularized intervals such as distance, 
# area, volume.

# For example, conducting risk analysis by the insurance/banking industry, 
# anticipating the number of car accidents in a particular time interval and in a specific area

# 1. dpois
# This function is used for illustration of Poisson density in an R plot.
# The function dpois() calculates the probability of a random variable that is available within a certain range.
# Syntax : dpois(x, lambda, log = FALSE)
# x -> vector of (non-negative integer) quantiles.
# lambda -> vector of (non-negative integer) quantiles.
# log, log.p -> logical; if TRUE, probabilities p are given as log(p).
dpois(2, 3)
dpois(6, 6)


# 2. ppois
# ppois(q, lambda, lower.tail = TRUE, log.p = FALSE)
# q -> vector of quantiles.
# lower.tail -> logical; if TRUE (default), probabilities are P[X≤x], otherwise, P[X > x]P[X>x].
# This function is used for the illustration of cumulative probability function in an R plot. 
# The function ppois() calculates the probability of a random variable that will be equal to or less than a number.

# Problem : If there are twelve cars crossing a bridge per minute on average, 
# find the probability of having seventeen or more cars crossing the bridge in a particular minute.
# Solution :
# The probability of having sixteen or less cars crossing the bridge in a particular minute is given by the function ppois.
x <- ppois(16, lambda = 12)
x
# Hence the probability of having seventeen or more cars crossing the bridge in a minute is in the upper tail of the probability density function.
x <- ppois(16, lambda = 12, lower = FALSE)
x




# 3. qpois
# qpois(p, lambda, lower.tail = TRUE, log.p = FALSE)
# vector of probabilities.


# 4. rpois
# rpois(n, lambda)
# n -> number of random values to return.