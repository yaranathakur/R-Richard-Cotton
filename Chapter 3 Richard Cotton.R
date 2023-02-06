# Chapter 3

# We can find class of variable using class(c())
class(c(TRUE,FALSE))
class(c(0))
class(c(Inf))
class(c(NA))
class(c(NaN))

# Different types of number
class(sqrt(1:9))
class(3+1i)
class(1)
class(1L)
class(0.5:4.5)
class(1:5)

# Other Class
class(c("Yarana","Natasha","Vibe"))
(gender <- factor(c('Male','Female','Male','Female','Male')))

levels(gender)     #By default, factor levels are assigned alphabetically.
nlevels(gender)

# Use of integers for storage makes them very memory-efficient compared to character text
as.integer(gender)   #factor values are stored as integers rather than characters

gender_char <- sample(c('male','female'), 1000, replace = TRUE)
gender_fac <- as.factor(gender_char)

object.size(gender_char)
object.size(gender_fac)

# It is typically best to convert the factors to strings, in order to take 
# advantage of string manipulation functions.

as.character(gender)

# The integers 0 to 255 can be converted to raw using as.raw.
as.raw(1:9)
as.raw(9)
as.raw(c(pi,-Inf,0,1+1i,256))

# For strings, as.raw doesn't work; we must use charToRaw
(name <- charToRaw('YARANA'))
charToRaw('Y')
charToRaw('y')
class(name)


is.logical(FALSE)
is.list(list(a = 1, b = 2))
is.character("red lorry, yellow lorry")
# We can see a complete list of all the is functions in the base package using:
# "^is" -> match strings that begin with "is" ,  baseenv is a function that simply returns
# the environment of the base package
ls(pattern = "^is", baseenv())  


# One small oddity is that is.numeric returns TRUE for integers as well as floating
# point values. 
is.numeric(1)
is.numeric(4.5)
is.numeric(1L)
is.integer(1)
is.integer(1L)
is.double(1)
is.double(4.5)
is.double(1L)


# When converting a string to a number, as.numeric is slightly more efficient than plain 'as'
# but either can be used
x <- "5.657"
as(x,"numeric")
as.numeric(x)

# Converting vector into data frame
y <- c(2, 45, 67, 199)
as(y, "data.frame")     # This throw an error
as.data.frame(y)

x <- "3.145"
class(x) <- "numeric"
x
is.numeric(x)


# Inside loops or functions, the automatic printing doesn't happen, so we have to explicitly
# call print:
y <- c(2, 45, 67, 199)
for (i in y) {i}            # This will not show the result
for (i in y){print(i)}


# The summary function does just that, giving appropriate infor-
# mation for different data types. Numeric variables are summarized as mean, median,
# and some quantiles
num <- runif(10)         # Generates 10 random number uniformmaly distributed between 0 and 1
summary(num)             # Generates summary of num 

fac <- factor(sample(letters[1:5], 30, replace = TRUE))
summary(fac)
fac

bool <- sample(c(TRUE, FALSE, NA), 30, replace = TRUE)
summary(bool)
bool

data_frame <- data.frame(num, fac, bool)
?head      #Return the First or Last parts of an Object
head(data_frame)

summary(data_frame)

# str function shows the object's structure
str(num)

str(fac)

str(bool)

str(data_frame)

#  Sometimes printing omits useful information, unclass function can be used to bypass this
# For example, calling unclass on a factor reveals that it is just an integer vector, with 
# an attribute called levels:

unclass(fac)

# attributes function gives the lists of all attributes belonging to object

attributes(fac)
levels(fac)
class(fac)

# For visualising 2 dimensional variables such as matrices and dataframe the 'View' function
# is used to display as readonly spreadsheet

View(data_frame)
View(head(data_frame, 10))   # View first 10 row

new_data_frame <- edit(data_frame)
fix(data_frame)
new_data_frame

rm(list = ls())
# To list the names of existing variables, use the function ls()
a <- 1
b <- TRUE
c <- "YARANA"
ls()
ls(pattern = "a")

# For more data on our workspace we can use ls.str function
ls.str()

# browseEnv() function is used to view output in HTML format in web browser

browseEnv()










################QUESTIONS################

# 1  What are the names of the three built-in classes of numbers?
# numeric, integer, double

# 2 What function would you call to find out the number of levels of a factor?
levels(a)
levels(c)


# 3 How might you convert the string "6.283185" to a number?
x <- '6.283185'
as.numeric(x)
as(x,"numeric")
as.integer(x)

# 4 Name at least three functions for inspecting the contents of a variable.
# is.numeric(), is.logical(), is.integer()

# 5 How would you remove all the variables in the user workspace?
rm(list = ls())  # Remove all variable in user worksapce
rm(x)            # Remove x from worksapce

# 6 Find the class, type, mode, and storage mode of the following values: Inf, NA, NaN,"".

class(Inf)
class(NA)
class(NaN)
class("")

typeof(Inf)
typeof(NA)
typeof(NaN)
typeof("")

?mode
mode(Inf)
mode(NA)
mode(NaN)
mode("")

storage.mode(Inf)
storage.mode(NA)
storage.mode(NaN)
storage.mode("")

# 7 Randomly generate 1,000 pets, from the choices "dog," "cat," "hamster," and "gold-
#   fish," with equal probability of each being chosen. Display the first few values of the
#   resultant variable, and count the number of each type of pet.

animal <- sample(c('dog','cat','hamster','goldfish'), 1000, replace = TRUE)
str(animal)
head(animal)
summary(as.factor(animal))

# 8 Create some variables named after vegetables. List the names of all the variables in
# the user workspace that contain the letter "a." 

potato <- 2
tomato <- 3
carrot <- 4
lemon <- 5
brinjal <- 6

ls()
ls(pattern = "a")



rm(list = ls())
