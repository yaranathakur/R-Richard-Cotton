### Strings and factors ###

# Strings
# Constructing and Printing Strings
# character vectors can be created with the c function

c(
  "You should use double quotes most of the time",
  'Single quotes are better for including " inside the string'
)

#  paste function combines strings together
paste(c("Yarana","Vibe"),"Yash")

# change the separator by passing an argument called sep
paste(c("Yarana","Vibe"),"Yash", sep = "-")

# use the paste0 function to have no separator
paste0(c("Yarana","Vibe"),"Yash")

# After combining, we can collapse all thing in single string using collapse argument
paste(c("Yarana","Vibe"),"Yash", sep = "-", collapse = ",")

# function toString is a variation of paste that is useful for printing vectors
a <- (1:5)^2
toString(a)

# argument width is used to limit output character
toString(a, width = 10)
nchar(toString(a, width = 10))

# cat is a low-level function that works similarly to paste, but with less formatting
# cat can also accept a file argument to write its output to a file
cat(c("Yarana","Vibe"),"Yash")

b <- 1
cat(c("Yarana"),b)       # cat can take file path too

# Usually strings are printed in a double quote
x <- c("I","am","a","19","year","old","village","boy",".",
       "I","am","currently","living","in","Varanasi")
x
# We can use noquote function to unquote string and store in a variable for readabilty
y <- noquote(x)
y


# Formatting Numbers
# There are several function to do formatting
# We can use formatC function to format numbers

pow <- 1:3
(pow_of_e <- exp(pow))

formatC(pow_of_e, digits = 3)
formatC(pow_of_e, digits = 3, width = 10)  
formatC(pow_of_e, digits = 3, format = "e")        # Scientific formatting
formatC(pow_of_e, digits = 3, flag = "+")          # #precede +ve values with +

# sprintf function also helps in formatting
# %s denotes another string, %f and %e denote a floating-point number in fixed or scientific format
# %d represents an integer.
sprintf("%s %d = %f", "Euler's constant to the power", pow, pow_of_e)

sprintf("To three decimal places, e ^ %d = %.3f", pow, pow_of_e)

sprintf("In scientific notation, e ^ %d = %e", pow, pow_of_e)


# format and prettyNum functions also used for formatting
# format just provides a slightly different syntax for formatting strings
format(pow_of_e)
format(pow_of_e, digits = 3)     # upto 3 significant value
format(pow_of_e, digits = 3, trim = TRUE)    # Remove leading zeroes
format(pow_of_e, digits = 3, scientific = TRUE)
x = 1e10

# We can also do some formatting using prettyNum function on a very large or very small number
prettyNum(c(1e10,1e-10),
          big.mark = ",",
          small.mark = " ",
          preserve.width = "individual",
          scientific = FALSE)

### Special Charcter
# We can use tab character using \t for giving space equal to tab
cat("Hi my name is Yarana\tand i am 19 year old", fill = TRUE)   # We can pass fill argument to send curser to new line after line is executed
# We can't do the  same opeartion using print function as we cant pass extra argument in string using print function
print("Hi my name is Yarana\tand i am 19 year old")

# \n is used to move curser on new line
cat("Hi my name is Yarana\nand i am 19 year old")

# \r will just move the cursor to the start of the current line and overwrite what you have written)
cat("Hi my name is Yarana\rand i am 19 year old")
cat("rse\rrespond")


# Null characters, \0, are used to terminate strings in R's internal code
cat("Hi my name is Yarana\0and i am 19 year old")     # Throws an error


# Backslash characters need to be doubled up so that they aren't mistaken for a special character
cat("\\ This symbol is known as backslash")


# Use \ to esacape the double quoted strings
cat("bear\"bar", fill = TRUE)
cat('bear\'bar', fill = TRUE)

# To include single or double quote we can pass single quote inside double and vice versa
cat("Hellp'World")
cat('Hello"World')


# Alarm  Setting in R
cat("\a")
alarm()




### Changing The Case ###
toupper("hello my name is yarana")
tolower("Hello MY name is Yarana")


# Extracting Substrings
woodchuck <- c(
  "How much wood would a woodchuck chuck",
  "If a woodchuck could chuck wood?",
  "He would chuck, he would, as much as he could",
  "And chuck as much wood as a woodchuck would",
  "If a woodchuck could chuck wood."
)
substring(woodchuck, 1:6, 10)
substr(woodchuck, 1:6, 10)


substr("abcdef", 2:4, 2:4)

substr("abcdef", 2, 4)
substring("abcdef", 1:6, 1:6)


# Splitiing Strings
# We use strsplit() function to split string
# fixed =  TRUE means split string in a fixed string rather than regular exprssion 
strsplit(woodchuck, " ", fixed = TRUE)
strsplit(woodchuck,' ', fixed = TRUE)


# ",? " helps us in ignoring the comma
# ? means makes the previous optional
strsplit(woodchuck, ",? ")
strsplit(woodchuck, ",? ", fixed = TRUE)



### File Paths ###
# getwd() functions helps in accesing the working directory path
getwd()

# setwd() functions hepls in setting new directory
# components of each path are separated by forward slashes,even though they are windows pathnames
setwd("D:photos")
getwd()
setwd("C:/Users/YaranaThakurHindu/Documents")
getwd()


# You can also specify a double backslash to denote Windows paths, but forward slashes are preferred

"c:\\windows" #remember to double up the slashes
"\\\\myserver\\mydir" #UNC names need four slashes at the start

# file.path function is used to construct file path
file.path("c:","Program Files", "R", "R prog")
R.home()

# path.expand converts relative paths to absolute paths:
path.expand(".")
path.expand("..")
path.expand("~")


# basename returns the name of a file without the preceding directory location.
basename("~")

# dirname returns the name of the directory that a file is in
dirname("~")



### Factors ### 
# Creating Factors
# Factors are a special variable type for storing categorical variables. 
# They sometimes behave like strings, and sometimes like integers.

heights <- data.frame(
  height_cm = c(153, 181, 150, 172, 165, 149, 174, 169, 198, 163),
  gender = c("female", "male", "female", "male", "male","female","female","male","male","female"),
  stringsAsFactors = TRUE)

print(heights)
class(heights$gender)
is.factor(heights$gender)
heights$gender


levels(heights$gender)


args(data.frame)


heights$gender[1] <- "Female"
heights$gender

levels(heights$gender)
nlevels(heights$gender)

# We can use factor function to create factor
gender_char <- c("male","female","female","male","female")
gender_fac <- factor(gender_char)

print(gender_fac)

# We can change the priority order of level by passing an argument levels inside function factor
gender_fac <- factor(gender_char, levels = c("male","female"))
gender_fac

factor(gender_fac, levels = c("male","female"))

# We can't change directly level of data as it causes some error
levels(gender_fac) <- c("male","female")
gender_fac


# relevel function is an alternative way of changing the order of factor levels.
# it lets us set that which level comes first
relevel(gender_fac, "male")       # Call the factor before applying relevel


# Dropping factors level
getting_to_work <- data.frame(
  mode = c("bike", "car", "bus", "car", "walk","bike", "car", "bike", "car", "car"),
  time_mins = c(25, 13, NA, 22, 65, 28, 15, 24, NA, 14),
  stringsAsFactors = TRUE)

# remove time NA
(getting_to_work <- subset(getting_to_work, !is.na(time_mins)))

# We can check levels by unique function
unique(getting_to_work$mode)


# Dropping the unused levels of factor
getting_to_work$mode <- droplevels(getting_to_work$mode)
levels(getting_to_work$mode)

getting_to_work <- droplevels(getting_to_work)
levels(getting_to_work$mode)





# Ordered Factors
happy_choices <- c("depressed", "grumpy", "so-so", "cheery", "ecstatic")
happy_values <- sample(
  happy_choices,
  10000,
  replace = TRUE
)
happy_fac <- factor(happy_values, happy_choices)
head(happy_fac)

# We can do ordering of factor using ordered function
happy_ord <- ordered(happy_values, happy_choices)
head(happy_ord)

# An ordered factor is a factor, but a normal factor isn't ordered
is.factor(happy_ord)
is.ordered(happy_ord)
is.ordered(happy_fac)


# Converting continuous variables to categorical
# Cut function cuts the numeric variables into pieces returning a factor
# table function is used to get counts of numbers in different groups.
# hist plotting also gives us the ideas of counts in any group
# count do the same work in plyr library

# In the next example, we randomly generate the ages of ten thousand workers (from 16
# to 66, using a beta distribution) and put them in 10-year-wide groups:

ages <- 16 + 50 * rbeta(10000, 2, 3)
grouped_ages <- cut(ages, seq.int(16, 66, 10))
head(grouped_ages)

table(grouped_ages)

class(ages)
class(grouped_ages)

# Converting categorical variables to continuous
dirty <- data.frame(
  x = c("1.23", "4..56", "7.89")
)

as.numeric(dirty$x)
as.numeric(as.character(dirty$x))

as.numeric(levels(dirty$x))[as.integer(dirty$x)]

factor_to_numeric <- function(f)
{
  as.numeric(levels(f))[as.integer(f)]
}
factor_to_numeric(dirty$x)


# Generating Factor Levels
# gl() function can be used to generate a factor.
gl(4,2)
gl(3,2)
gl(2,2)
gl(1,2)
gl(4,3)


# We can also pass the argument labels to specify the vector elements
gl(3,2, labels = c("Yarana","Vibe", "Raunak"))
gl(3,3, labels = c("Yarana","Vibe", "Raunak"))
gl(26,2, labels = letters)


# Combining factor
name <- gl(3,2, labels = c("Yarana","Vibe","Raunak"))
gender <- gl(2,1, labels = c("can-be-male","can-be-female"))
# We use interaction function to combine 2 different categorical factor where each level contains interaction of both variables
interaction(name,gender)




### QUESTION ###
# 1 Name as many functions as you can think of for formatting numbers.
# formatC, format, sprintf, prettyNum


# 2 How might you make your computer beep?
# by using alarm() function
x <- 2
alarm()
# By using \a args inside cat function 
cat("Hi how are you \a where are you going")


# 3 What are the classes of the two types of categorical variable?
# factor and ordered


# 4 What happens if you add a value to a factor that isn't one of the levels?
# NA will be generated 
gender < -c("M","F","T")
gender[3] <- "O"

# 5 How do you convert a numeric variable to categorical?
# cut and bin is used 
?cut
x <- c(5,1,2,6,3,4)
class(x)

y <- cut(x, breaks = 5, oredered_result = TRUE)
y
class(y)


# 6 Display the value of pi to 16 significant digits
format(pi, digits = 16)
formatC(pi, digits = 16)
prettyNum(pi)


# 7 Split these strings into words, removing any commas or hyphens:
x <- c(
  "Swan swam over the pond, Swim swan swim!",
  "Swan swam back again - Well swum swan!"
)

strsplit(x, ",? ")
strsplit(x, " -? ")

# 8 