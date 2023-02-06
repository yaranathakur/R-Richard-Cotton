### Advanced Looping ###


# Replication
c(rep(1, 5), rep(2,5))

replicate(1, 4)
typeof(replicate(5,1))
typeof(replicate(5,1, simplify = FALSE))     # simplify=FALSE gives result as list
replicate(1, seq(1,10,1))                    # 1 times seq from 1 to 10 by 1 increment


#  rep will repeat the same random number several times, but
# replicate gives a different number each time
rep(runif(1), 5)                             # rep shows only 1 out every time in case of random number generator
replicate(5, runif(1))                       # replicate didn't follow the same rule
replicate(5, 5)

?sample
x <- 1:5
sample(x)
sample(x, replace = TRUE, prob = c(0.1, 0.2, 0.3, 0.2, 0.2))
sample(c(0, 1), 100, replace = TRUE)



# This Example estimates a person’s time to commute to work via different methods of transport
time_for_commute <- function()
{
  #Choose a mode of transport for the day
  mode_of_transport <- sample(
    c("car", "bus", "train", "bike"),
    size = 1,
    prob = c(0.1, 0.2, 0.3, 0.4)
  )
  #Find the time to travel, depending upon mode of transport
  time <- switch(
    mode_of_transport,
    car = rlnorm(1, log(30), 0.5),
    bus = rlnorm(1, log(40), 0.5),
    train = rnorm(1, 30, 10),
    bike = rnorm(1, 60, 5)
  )
  names(time) <- mode_of_transport
  time
}

replicate(5, time_for_commute())
time_for_commute()



# LOOPING OVER LIST
# lapply, short for “list apply. lapply takes a list and a function as inputs
# It applies the function to each element of the list in turn, and returns another list of results.

prime_factors <- list(
  two = 2,
  three = 3,
  four = c(2, 2),
  five = 5,
  six = c(2, 3),
  seven = 7,
  eight = c(2, 2, 2),
  nine = c(3, 3),
  ten = c(2, 5)
)
head(prime_factors)


# Finding Unique value in prime factors
unique_primes <- vector("list", length(prime_factors))
for(i in seq_along(prime_factors))
{
  unique_primes[[i]] <- unique(prime_factors[[i]])
}
names(unique_primes) <- names(prime_factors)
unique_primes


# lapply make it very easier to do the upper program
lapply(prime_factors, unique)

# vapply stands for "list apply that returns a vector."
vapply(prime_factors, length, numeric(1))

# sapply, which stands for "simplifying list apply."
sapply(prime_factors, unique)
sapply(prime_factors, length) 
sapply(prime_factors, summary)

# If the input list has length zero, then sapply always returns a list
sapply(list(), length)

# So when data is empty it is better to use vapply
vapply(list(), length, numeric(1))

getwd()
r_files <- dir(pattern = "\\.R$")
lapply(r_files, source)


complemented <- c(2, 3, 6, 18)
lapply(complemented, rep.int, times = 4)

rep4x <- function(x){rep.int(x, times = 4)}
lapply(complemented, rep4x)

rep4x1 <- function(x){rep.int(4, times = x)}
lapply(complemented, rep4x1)

lapply(complemented, function(x){rep.int(x, times = 4)})
lapply(complemented, function(x){rep.int(4, times= x)})

# There is also a function called eapply which performs same as above
env <- new.env()
env$name <- c("Yarana", "Vishal", "Yash", "Chandu")
env$number <- c(1,2,3,4,5,6,7,8,9)
eapply(env, length)
lapply(env, length)



#--------------Looping Over arrays

# lapply, and its friends vapply and sapply, can be used on matrices and arrays
install.packages("matlab")
require(matlab)

# The magic function creates a magic square—an n-by-n square matrix of the numbers
# from 1 to n^2, where each row and each column has the same total:
magic4 <- magic(4)
magic4

# Calculating row totals
# We can use rowSums()  function to find sum of rows element
rowSums(magic4)

apply(magic4, 1, sum)
apply(magic4, 1, toString)
apply(magic4, 2, toString)


(baldwins <- data.frame(
  name = c("Alec", "Daniel", "Billy", "Stephen"),
  date_of_birth = c(
    "1958-Apr-03", "1960-Oct-05", "1963-Feb-21", "1966-May-12"
  ),
  n_spouses = c(2, 3, 1, 1),
  n_children = c(1, 5, 3, 2),
  stringsAsFactors = FALSE
))

apply(baldwins, 1, toString)
apply(baldwins, 2, toString)
# When apply() function is applied to column its behaviour is identical to sapply 
sapply(baldwins, toString)

# Using sapply combined with range, on the other hand, is a great way to quickly determine the extent of your data: 
# It shows first and last
sapply(baldwins, range)



#--------------Multiple input apply

# One of the drawbacks of lapply is that it only accepts a single vector to loop over.
# Another is that inside the function that is called on each element, you don’t have access to the name of that element

# The function mapply, short for “multiple argument list apply,” lets you pass in as many vectors as you like
# Syntax: mapply(FUN, ..., MoreArgs = NULL, SIMPLIFY = TRUE, USE.NAMES = TRUE)
msg <- function(name, factors)
{
  ifelse(
    length(factors) == 1,
    paste(name, "is prime"),
    paste(name, "has factors", toString(factors))
  )
}

mapply(msg, names(prime_factors), prime_factors)

# By default, mapply behaves in the same way as sapply
# We can turn this behavior off (so it behaves more like lapply) by passing the argument SIMPLIFY = FALSE.



#--------------Instant Vectorization

# Vectorize() function is a wrapper to mapply that takes a function that usually accepts
# a scalar input, and returns a new function that accepts vectors

# This below function is not vectorize because it uses switch which takes scalar input
baby_gender_report <- function(gender)
{
  switch(
    gender,
    male = "It's a boy!",
    female = "It's a girl!",
    "Um..."
  )
}

gender <- c("male","female","male")

baby_gender_report(gender) # this will throw an error 

# While we can do it by using Vectorize() function
baby_gender_report_vectorize <- Vectorize(baby_gender_report)
baby_gender_report_vectorize(gender)



#-------------- Split - Apply - Combine
# A really common problem when investigating data is how to calculate some statistic on
# a variable that has been split into groups

# Here are some scores on the classic road safety awareness computer game, Frogger
(frogger_scores <- data.frame(
  player = rep(c("Tom", "Dick", "Harry"), times = c(2, 5, 3)),
  score = round(rlnorm(10, 8), -1)
))

# If we want to calculate mean score of each player we have to go through 3 steps
#-1> Split The Data Sets
(scores_by_player <- with(
  frogger_scores,
  split(score, player)
))

#-2> Now apply the mean 
(scores_by_player_mean <- lapply(scores_by_player, mean))

#-3> Now Combine the result in a vector
(mean_by_player <- unlist(scores_by_player_mean))


# The last two steps can be condensed into one by using vapply or sapply
# tapply() function performs all three steps in one go
# syntax: tapply(X, INDEX, FUN = NULL, ..., default = NA, simplify = TRUE)
with(frogger_scores, tapply(score, player, mean))

# There are a few other wrapper functions to tapply, namely by and aggregate



#--------------The plyr Package

# The *apply family of functions are mostly wonderful, but they have three drawbacks
# Firstly, the names are a bit obscure.
# Secondly, the arguments aren’t entirely consistent.
# Thirdly, the form of the output isn’t as controllable as it could be.

# This is why plyr function is introduced
# The package contains a set of functions named **ply, 
# where the blanks (asterisks) denote the form of the input and output respectively
# So, llply takes a list input, applies a function to each element, and returns a list

install.packages("plyr")
library("plyr")

# syntax: llply(.data,.fun = NULL,...,.progress = "none",.inform = FALSE,.parallel = FALSE,.paropts = NULL)
llply(prime_factors, unique)

# laply takes a list and returns an array, mimicking sapply.
laply(prime_factors, length)

laply(list(), length)

# raply replaces replicate (not rapply!)
raply(5, runif(1))

#  rlply and rdply functions let us return the result in list or data frame form
a <- rlply(5, runif(1))
class(a)

b <- rdply(5, runif(1))
b
is.data.frame(b)


# r_ply function that discards the result (useful for drawing plots)
c <- r_ply(5, runif(1))
c

# Most commonly used function in plyr is ddply() function
# Takes data frames as inputs and outputs and can be used as a replacement for tapply.
# Its big strength is that it makes it easy to make calculations on several columns at once

# Adding a level column to the Frogger data set, denoting the level the player reached in the game
frogger_scores$level <- floor(log(frogger_scores$score))
frogger_scores


# There are several different ways of calling ddply. 
# All methods take a data frame, 
# The name of the column(s) to split by, 
# The function to apply to each piece. 
# The column is passed without quotes, but wrapped in a call to the . function.
# For the function, we can either use colwise to tell ddply to call the function on every column
# or use summarize and specify manipulations of specific columns
ddply(
  frogger_scores,
  .(player),
  colwise(mean) #call mean on every column except player
)

ddply(
  frogger_scores,
  .(player),
  summarize,
  mean_score = mean(score), #call mean on score
  max_level = max(level) #... and max on level
)


# colwise is quicker to specify, but you have to do the same thing with each column,
# whereas summarize is more flexible but requires more typing.

# There is no direct replacement for mapply, 
# Though the m*ply functions allow looping with multiple arguments. 
# Likewise, there is no replacement for vapply or rapply.




################### QUESTIONS ##################
# 1 > Name as many members of the apply family of functions as you can.
# vapply,tapply, sapply, mapply, rapply, lapply, apply, eapply
# Use apropos("apply") to find

# 2 > What is the difference between lapply, vapply, and sapply?
# All 3 functions accept list
# lapply returns list
# vapply returns vector or arrays
# sapply returns either

# 3 > How might you loop over tree-like data?
# rapply is recursive and ideal for deeply nested object like trees


# 4 > Given some height data, how might you calculate a mean height by gender?
# This is split apply combine problem
# We can do it by tapply or by using plyr packages 


# 5 > In the plyr package, what do the asterisks mean in a name like **ply?
# It denote the form of input and output
# First asterisks shows type of input
# Second asterisks shows types of output

# 6 > Loop over the list of children in the celebrity Wayans family. How many children
# does each of the first generation of Wayanses have?
wayans <- list(
  "Dwayne Kim" = list(),
  "Keenen Ivory" = list("Jolie Ivory Imani","Nala","Keenen Ivory Jr","Bella","Daphne Ivory"),
  Damon = list("Damon Jr","Michael","Cara Mia","Kyla"),
  Kim = list(),
  Shawn = list("Laila","Illia","Marlon"),
  Marlon = list("Shawn Howell","Arnai Zachary"),
  Nadia = list(),
  Elvira = list("Damien","Chaunté"),
  Diedre = list("Craig","Gregg","Summer","Justin","Jamel"),
  Vonnie = list()
)

# Since Input is the list and output is same known length therefore vapply is the best choice.

vapply(wayans, length, integer(1))


# 7 > state.x77 is a dataset that is supplied with R. It contains information about the
# population, income, and other factors for each US state. You can see its values by
# typing its name, just as you would with datasets that you create yourself:
#   state.x77
# 1. Inspect the data set using the method that you learned in Chapter 3.
dim(state.x77)      # shows the dimensions of the data frame by row and column
str(state.x77)      # shows the structure of the data frame
summary(state.x77)  # provides summary statistics on the columns of the data frame
colnames(state.x77) # shows the name of each column in the data frame
head(state.x77)     # shows the first 6 rows of the data frame
tail(state.x77)     # shows the last 6 rows of the data frame
View(state.x77)     # shows a spreadsheet-like display of the entire data frame
edit(state.x77)
fix(state.x77)


# 2. Find the mean and standard deviation of each column.
state.x77
apply(state.x77, 2, mean)
apply(state.x77, 2, sd)

# 8 > Recall the time_for_commute function from earlier in the chapter. Calculate the
# 75th-percentile commute time by mode of transport:

commute_times <- replicate(1000, time_for_commute())
commute_data <- data.frame(
  time = commute_times,
  mode = names(commute_times)
)
commute_times
commute_data

# tapply is best option
with(commute_data, tapply(time, mode, quantile, prob = 0.75))

# we can also  use ddply from the plyr package
require(plyr)
ddply(commute_data, .(mode), summarize, time_75p = quantile(time, 0.75))
