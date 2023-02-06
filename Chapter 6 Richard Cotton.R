### ENVIRONMENTS AND FUNCTIONS ###

# Environment
an_environment <- new.env()

# Assigning variables into new environments

an_environment[["yarana"]] <- c(25,22,19,11)
an_environment$vishal <- c(12,1,3,15,67)
# The assign function takes an optional environment argument that can be used to specify where the variable is stored

assign(
  "FullMoonday",
  weekdays(as.Date("2002/12/24")),
  an_environment
)

# Accessing variables from environment

an_environment[["yarana"]]
an_environment$vishal
get("FullMoonday", an_environment)


# The ls and ls.str functions also take an environment argument, allowing you to list their contents:

ls(envir = an_environment)

ls.str(envir = an_environment)


# We can test to see if a variable exists in an environment using the exists function:

exists("yarana", an_environment)


# Conversion from environment to list and back again uses the functions, as.list and as.environment

a_list <- as.list(an_environment)
a_list

as.environment(a_list)

# list2env function also work as as.environment function
list2env(a_list)


# All environments are nested, meaning that they must have a parent environment
# By default, the exists and get functions will also look for variables in the parent environments.
# Pass inherits = FALSE to them to change this behavior so that they will only look in the environment that you've specified:

nested_environment <- new.env(parent = an_environment)
exists("yarana", nested_environment)

exists("yarana", nested_environment, inherits = FALSE)

ls()
ls(an_environment)

non_stormers <<- c(3, 7, 8, 13, 17, 18, 21)
get("non_stormers", envir = globalenv())
head(ls(envir = baseenv()), 20)


### Creating and Calling Functions ###

# function to calculate the length of the hypotenuse of a right-angled triangle
Hypotenuse <- function(x,y){
  sqrt(x^2 + y^2)
}
Hypotenuse(3,4)

# Same as above
Hypotenuse <- function(x,y) sqrt(x^2 + y^2)
Hypotenuse(13,15)
Hypotenuse(x = 4, y = 3)
Hypotenuse(y = 4, x = 3)

# We can also pass value of arguments in function
Hypotenuse <- function(x = 5, y = 6) sqrt(x^2 + y^2)
Hypotenuse()


# formals() is used to retrieve arguments of the function in list form
formals(Hypotenuse)

# args used to retrieve arguments of the function in list form in human readable form
args(Hypotenuse)

# formalArgs returns a character vector of the names of the arguments
formalArgs(Hypotenuse)

# body() of a function is retrieved using the body function
body_of_function <- body(Hypotenuse)
body_of_function


# deparse() function is used find functions that call another function
deparse(Hypotenuse)
deparse(body_of_function)

# The following function, normalize, scales a vector
normalize <- function(x, m = mean(x), s = sd(x)){
  (x-m)/s
}

normalized <- normalize(c(1, 3, 6, 10, 15))

mean(normalized)
sd(normalized)

# If any elements of a vector are missing, then by default, mean and sd will both return NA
normalize(c(1, 3, 6, 10, NA))

# To avoid above situation we can use rm.na = TRUE argument in our function
normalize <- function(x, m = mean(x, na.rm = TRUE), s = sd(x, na.rm = TRUE)){
  (x-m)/s
}

normalize(c(1,2,3,4,NA))

# do.call function provides an alternative syntax for calling other functions
do.call(Hypotenuse, list(x = 3, y = 4))


# most common use case for do.call is with rbind
dfr1 <- data.frame(x = 1:5, y = rt(5, 1))
dfr2 <- data.frame(x = 6:10, y = rf(5, 1, 1))
dfr3 <- data.frame(x = 11:15, y = rbeta(5, 1, 1))

do.call(rbind, list(dfr1, dfr2, dfr3))        #same as rbind(dfr1, dfr2, dfr3)


# It is not compulsory to include function first
menage <- c(1, 0, 0, 1, 2, 13, 80)
mean(menage)

mean(c(1, 0, 0, 1, 2, 13, 80))


# We can also pass function anonymously
X_plus_y <- function(x, y) x+y
do.call(X_plus_y, list(1:5, 6:10))
do.call(function(x, y) x+y , list(1:5,6:10))


# The ecdf function returns the empirical cumulative distribution function of a vector
(emp_cum_dist_fn <- ecdf(rnorm(50)))

is.function(emp_cum_dist_fn)

plot(emp_cum_dist_fn)


### Variable Scope ###
f <- function(x){
  y <- 1
  g <- function(x){
    (x+y)/2
  }
  g(x)
}
f(sqrt(5))
f(5)

# 
h <- function(x)
{
  x * y
}

y <- 16
h(9)

# 
h2 <- function(x)
{
  if(runif(1) > 0.5) y <- 12
  x * y                           # y is defined locally or globally
}

replicate(10, h2(9))            # when runif return o-0.5 then y=12 is used if not y=16 is used 


### QUESTIONS ###

# 1 What is another name for the global environment?
# workspace

# 2 How would you convert a list to an environment?
# as.environment() function is used to covert list into an environment
yash_env <- new.env()
yash_env[["vishal"]] <- c(1,2,3,4,5,6)
yash_env$yarana <- c(6,4,3,2,1,7)

assign("Birthday",
       weekdays(as.Date("24/12/2002")),
       yash_env)

as.list(yash_env)

list_yash <- as.list(yash_env)
list_yash

as.environment(list_yash)


# 3 How do you print the contents of a function to the console?
# By just typing the name of function
h

# 4 Name three functions that tell you the names of the formal arguments of a function.
# formals , args , formalArgs

fun <- function(x,y){
  x+y
}

formalArgs(fun)        #  vector
args(fun)           # human readable form
formals(fun)             # List form
argsAnywhere(fun)
?argsAnywhere


# 5 What does the do.call function do?
# do.call function provides an alternative syntax for calling other functions
do.call(fun, list(x=1, y=2))
# most common use case for do.call is with rbind
data <- data.frame(x = 1:5, y = rep(1,5))
data2 <- data.frame(1:5, rep(1,5))
data3 <- data.frame(seq(5), rep(1,5))

do.call(rbind, c(data, data2, data3))

do.call(function(x,y) x+y , list(x=1, y=2))


# 6 Create a new environment named multiples_of_pi. Assign these variables into the environment:
#1. two_pi, with the value 2 * ??, using double square brackets
#2. three_pi, with the value 3 * ??, using the dollar sign operator
#3. four_pi, with the value 4 * ??, using the assign function List the contents of the environment, along with their values. 

multiples_of_pi <- new.env()

multiples_of_pi[["two_pi"]] <- 2*pi
multiples_of_pi$three_pi <- 3*pi
assign("four_pi",
       4*pi,
       multiples_of_pi)

list_pi_multiple <- as.list(multiples_of_pi)
list_pi_multiple



# 7 Write a function that accepts a vector of integers (for simplicity, you don't have to
# worry about input checking) and returns a logical vector that is TRUE whenever the
# input is even, FALSE whenever the input is odd, and NA whenever the input is non-
# finite (nonfinite means anything that will make is.finite return FALSE: Inf, -Inf,
# NA, and NaN). Check that the function works with positive, negative, zero, and non-
# finite inputs.

checker <- function(x){
  (x%%2)==0
}
checker(c(4, NA, NaN, 5, 1:5))


# 8 Write a function that accepts a function as an input and returns a list with two elements:
# an element named args that contains a pairlist of the input's formal 
# arguments, and an element named body that contains the input's body. Test it by
# calling the function with a variety of inputs.

args_and_body <- function(fn){
  list(arguments = formals(fn), body = body(fn))
}

args_and_body(mean)
args_and_body(var)
args_and_body(rbind)
args_and_body(checker)
              