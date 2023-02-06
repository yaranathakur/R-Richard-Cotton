# Flow Control And Loop
# For while and repeat



# Flow Control
# if and else

if(TRUE) message("It is TRUE")
if(FALSE) message("It isn't TRUE")  # Throws an error as missing value is not allowed to pass to if


if(NA) message("Who knows if it was true?") 
# To check missing value use is.na()
is.na(NA)

if(is.na(NA)) message("It is missing Value")


if(runif(1) > 0.5) message("This message appears with a 50% chance.")
runif(1)


# For multiple expression to be executed we use curly braces
x <- 5
if(x>3){
  y <- 2*x
  z <- y*2
}
cat(x,y,z)


if(FALSE){
  message("It won't execute")
}else{
  message("It will work")
}


# else statement must occur on the same line as the closing curly brace from the if clause.
# If you move it to the next line, you'll get an error:  
if(FALSE){
  message("It won't execute")
}
else
{
  message("It Will execute")
}


# if else ladder
(r <- round(rnorm(2), 1))
(x <- r[1]/r[2])

if(is.nan(x)){
  message("It is not a number")
}else if(is.na(x)){
  message("It is missing")
} else if(x>0){
  message("Positive")
}else if(x<0){
  message("Negative")
} else{
  message("Zero")
}


# Re returns the real component of a complex number
# Im returns the imaginary component

x <- sqrt(4 + 0i)
(reality <- if(Im(x) == 0) "Real" else "Imaginary")


# Vectorized if

# Standard if take only one logical value if you pass 2 throw error
if(c(TRUE, FALSE)) message("two choices")    # only first choice is used

# ifelse takes 3 argument
# first is logical vector of condition
# second contains value which returned when condition is TRUE
# third contains value which returned when condition is FALSE

ifelse(rbinom(10, 1, 0.5), "Head", "Tail")


# ifelse can also accept vectors in the second and third arguments
# if not equal vector is recycled
(y <- rep.int(c(TRUE, FALSE), 6))

ifelse(y, 1:3, -1:-12)

y[c(3,6,9,12)] <- NA

ifelse(y, 1:3, -1:-12)

# Multiple Selection
# Use of many else reduce readability of program
# We use switch statement 
# first argument is string which values is returned

(greek <- switch(
  "gamma",
  alpha = 1,
  beta = sqrt(4),
  gamma =
    {
      a <- sin(pi / 3)
      4 * a ^ 2
    }
))


# If no names match, then switch (invisibly) returns NULL:
(greek <- switch(
  "delta",
  alpha = 1,
  beta = sqrt(4),
  gamma =
    {
      a <- sin(pi / 3)
      4 * a ^ 2
    }
))


# switch can also take a first argument that returns an integer
switch(1, "one","two","three")

# We can also pass the argument value in the form of string
switch(
  as.character(2147483647),
  "2147483647" = "a big number",
  "another number"
)

# LOOPS
# Three Kinds of loop: repeat, while, for

# repeat loops (easiest loop): do while
# It execute the same code over and over until you tell it to stop

# This below loop will execute until we stop it
repeat{message("Happy Groundhog Day!")}

# To break out of the infinite loop include a break statement


# sample returns one action in each iteration of the loop:
repeat{
  message("Yarana")
  qualities <- sample(c("He is a good boy","He is emotional","He never tell a lie","He is male"),1)
  message("Qualities = ", qualities)
  if(qualities=="He is male") break
  }
# Sometimes, rather than breaking out of the loop we just want to skip the rest of the
# current iteration and start the next iteration

repeat{
  message("Yarana")
  next_word <- sample(c("are", "is", "a", "good", "boy"),1)
  if(next_word=="are"){
    message("Leave it") 
    next
    }
  message(next_word)
  if(next_word=="boy") break
}


# While loops
# While loops ar like backward repeat loop
# First check the statement and then execute

action <- sample(
  c(
    "Learn French",
    "Make an ice statue",
    "Rob a bank",
    "Win heart of Andie McDowell"
  ),
  1
)
while(action != "Win heart of Andie McDowell")
{
  message("Happy Groundhog Day!")
  action <- sample(
    c(
      "Learn French",
      "Make an ice statue",
      "Rob a bank",
      "Win heart of Andie McDowell"
    ),
    1
  )
  message("action = ", action)
}



# For loops
# How many times you want a code to repeat loop
# for loop accepts an iterator variable and a vector.
# It repeats the loop, giving the iterator each element from the vector in turn

for(i in 1:4) message("i = ", i)

# To execute multiple expression use curly braces around expression
for(i in 1:5){
  j <- i**2
  message("j = ", j)
}

# R for loop is not limited to integer or even odd
# We can pass character vectors, logical vectors, or lists
for(month in month.name){
  cat("\n", month)
}

for(y in c(TRUE, FALSE, NA)){
  message("This is", y)
}

l <- list(
  pi,
  LETTERS[1:5],
  charToRaw("Yarana"),
  list(c(TRUE))
)
for(i in l){
  print(i)
}



### QUESTIONS ###
# 1 What happens if you pass NA as a condition to if?
# Throws an error as it always takes TRUE or FALSE
if(NA)message("HI")

# 2 What happens if you pass NA as a condition to ifelse?
# It will return NA

x <- 1:10
x[c(1,3,5)] <- NA
ifelse(x, 1:10)

# 3 What types of variables can be passed as the first argument to the switch function?
# First argument is string or character or integer which value is returned

# 4 How do you stop a repeat loop executing?
# By inserting the statement break inside our loop or by console ext button

# 5 How do you jump to the next iteration of a loop?
# By using next statement

# 6 In the game of craps, the player (the "shooter") throws two six-sided dice. If the
# total is 2, 3, or 12, then the shooter loses. If the total is 7 or 11, she wins. If the total
# is any other score, then that score becomes the new target, known as the "point."
# Use this utility function to generate a craps score

two_d6 <- function(n)
{
  random_numbers <- matrix(
    sample(6, 2 * n, replace = TRUE),
    nrow = 2
  )
  colSums(random_numbers)
}
two_d6(6)
