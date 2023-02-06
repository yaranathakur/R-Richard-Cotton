### CHAPTER 5 ####
# LISTS AND DATA FRAMES #

"Chapter Goals
After reading this chapter, you should:
  . Be able to create lists and data frames
  . Be able to use length, names, and other functions to inspect and manipulate these
    types
  . Understand what NULL is and when to use it
  . Understand the difference between recursive and atomic variables
  . Know how to perform basic manipulation of lists and data frames"

#############################################################

# LISTS (Where we can store different data types)
# Creating List

list1 <- list(c(1,2,3,4,5), month.abb, matrix(c(1,2,3), nrow = 1), asin)
names(list1) <- c("Num", "Months", "Matrix", "Trigo")
list1

list1a <- list(
  Num = c(1,2,3,4,5),
  Month = month.abb,
  Matrix = matrix(c(1,2,3), nrow = 1),
  Trigo = asin
)
list1a

# Lists Inside List

number_sys <- list(
  integer = list(-10:10,
                 whole = list(0:10,
                              natural = list(1:10,list(
                                even = seq(from = 2, to = 10, by = 2),
                                odd = seq(from = 1, to = 10, by = 2)
 )))))
number_sys


### Atomic and Recursive Variables ###

is.atomic(list())
is.recursive(list())

is.atomic(numeric())
is.recursive(numeric())

is.atomic(vector())
is.atomic(matrix())
is.atomic(array())


### List Dimensions and Arithmetic ###

length(list1)
length(list1a)
length(number_sys)     # Doesn't include nested lists

# lists don't have dimensions
dim(list1)


# nrow, ncol, NROW on lists

nrow(list1)
ncol(list1)
ncol(list1a)

NROW(list1)
NCOL(list1)

NROW(number_sys)
NROW(list1a)
NCOL(list1a)

# list operation (we can do arithmetic operation on specific lists only)

l1 <- list(1:6)
l2 <- list(7:12)

l1[[1]]+l2[[1]]


# INDEXING LIST #

l <- list(
  first = 1,
  second = 2,
  third = list(
    alpha = 3.1,
    beta = 3.2
  )
)

# We can do list indexing using [] brackets as same as vectors

l[1:2]

l[-2]

l[c("first", "third")]

l[c(TRUE, FALSE, TRUE)]

identical(l[-2],l[c("first", "third")])

# Accesing list element
l[[1]]
l[c("first")]
l[[3]]

# The is.list function returns TRUE if the input is a list, and FALSE otherwise

is.list(l)
is.list(l[1])
is.list(l[[1]])

# For named elements of lists, we can also use the dollar sign operator, $

l$first
l$f        # partial matching

# Accessing nested list  element

l[["third"]]["beta"]
l[["third"]][["beta"]]
l[[c("third","beta")]]

# Accessing not available element(Returns NULL)

l[c(5,2,3)]
l[c("first","second","fifth")]
l[["fourth"]]
l$fourth
l[[4]]      # Throws an error , we should check indices before accessing the element


######################## CONVERTING BETWEEN VECTORS AND LISTS ################################

# Vectors can be converted to list using as.list() function

busy_beaver <- c(1,3,5,6,8)
is.vector(busy_beaver)

as.list(busy_beaver)

# We can convert list using as.numeric, as.character etc when list is scalar

as.numeric(list(1,3,5,6,8))

# Above cannot be applied when list is non-scalar

prime_factor <- list(
  two = 2,
  three = 3,
  four = c(2,2),
  five = 5,
  six = c(2,3),
  seven = 7,
  eight = c(2,2,2),
  nine = c(3,3),
  ten = c(2,5)
)

# This sort of list can be converted into vector using unlist() function

unlist(prime_factor)


################# COMBINIG LISTS ####################

# c function is used to concatenate lists as well as vectors
c(list(a=5, b=6), list(4))

# If we use c function to concatenate lists and vectors, the vectors are converted to lists 

c(list(a=3, b=5),2)

# We can also use rbind and cbind in case of list but it is not useful as result is different

mat <- rbind(c(list(a=2,b=3),
        list(c=4, list(d=5))))
str(mat)


########################## NULL #######################
# NULL : it is special variable which represents an empty variable

uk_bank_holidays_2013 <- list(
  Jan = "New Year's Day",
  Feb = NULL,
  Mar = "Good Friday",
  Apr = "Easter Monday",
  May = c("Early May Bank Holiday", "Spring Bank Holiday"),
  Jun = NULL,
  Jul = NULL,
  Aug = "Summer Bank Holiday",
  Sep = NULL,
  Oct = NULL,
  Nov = NULL,
  Dec = c("Christmas Day", "Boxing Day")
)

print(uk_bank_holidays_2013)

# Difference between NULL and NA

length(NULL)  # takes no space

length(NA)   # Scalar Value

# You can test for NULL using the function is.null. Missing values are not null

is.null(NULL)

is.null(NA)

# Checking whether NULL is missing or not

is.na(NULL)

# NULL can also be used to remove elements of a list.

uk_bank_holidays_2013$Jan <- NULL
uk_bank_holidays_2013$Feb <- NULL
uk_bank_holidays_2013


# To set an existing element to be NULL, we cannot simply assign the value of NULL

uk_bank_holidays_2013["Aug"] <- list(NULL)
uk_bank_holidays_2013


########################## PAIR LISTS ###########################

# Pairlists are used internally to pass arguments into functions

(arguments_of_sd <- formals(sd))

pairlist()
list()



######################## DATA FRAMES #########################

# Dataframes are used to store data in spreadsheet like structure

# Creating Data Frames #

# we can create data frame using data.frame() function

number <- data.frame(
  ALPHABET = LETTERS[1:5],
  alphabet = letters[1:5],
  Number = 1:5,
  Random = rnorm(5),
  Rlog = runif(5)>0.5
)

print(number)

class(number)



y <- rnorm(5)
names(y) <- month.name[1:5]
data.frame(
  x = letters[1:5],
  y=y,
  z = runif(5) < 0.5
)

# We can ommit row name using row.names = NULL

y <- rnorm(5)
names(y) <- month.name[1:5]
data.frame(
  x = letters[1:5],
  y=y,
  z = runif(5) < 0.5,
  row.names = NULL
)

# We can also give row name by ourself

y <- rnorm(5)
names(y) <- month.name[1:5]
data.frame(
  x = letters[1:5],
  y=y,
  z = runif(5) < 0.5,
  row.names = c("Alpha","Beta","Gama","Delta","Sigma")
)


# We can retrieve row and col names 
row.names(number)
colnames(number)

dimnames(number)

nrow(number)
ncol(number)
dim(number)

# length() function returns number of column (but avoid these)
length(number)

# names() function return the names of column ( but avoid these)
names(number)

# We should use ncol and nrow instead




# We can create data frame using vector of different length
# Vector recycling is done when we provide vectors of different length

num1 <- data.frame(
  a= 1,                           # recycled 4 times
  b = 2:3,                        # recycled 2 times
  c= 4:7                          # longest vector no recyling
)
print(num1)


# If length are not compatible then throw an error

num2 <- data.frame(
  a = 1,                              
  b = 1:3,                             
  c = 4:8                              
)

num3 <- data.frame(
  a = 1,                                    
  b= 1:3,                                   
  c = 1:6                                   
)
print(num3)




# We can only gave row and col names a unique and valid variable name
# But we can surpass it by using check.names = FALSE

num4 <- data.frame(
  "A" = 3:5,
  "~!@#" = 1:3,
  check.names = FALSE
)
print(num4)



######################## INDEXING DATA FRAMES ##########################

# positive integers, negative integers, logical values, and characters can be use to index elements

all <- data.frame(
  Number = 1:5,
  Month  = month.name[1:5],
  Alphabet = LETTERS[1:5],
  alphabet = letters[1:5]
)
print(all)

all[c(2,3),4]      
all[2:3,4]        
identical(all[c(2,3),4],all[2:3,4])

all[2,-4]          # Accessing 2 row and excluding column 4

all[c(TRUE,FALSE,TRUE,TRUE,FALSE),c(-2,-3,-4)]             # Accesing using logical 


# Class of indexed part of data frame

class(all[1,1])
class(all[2:3,-4])
class(all[2:3,2])
class(all[2:3,3])

# We can also access whole row or whole column using $ sign

all$Alphabet
all$Number
all$Alphabet[1:2]                    
all[[2]][2]                         
all[["Month"]][2]
identical(all[[2]][2],all[["Month"]][2])

####### SUBSET OF DATA FRAME #######


























################# DATA FRAME MANIPULATION BASICS ###################

# Transpose of matrix
# t() function is used to find transpose of a matrix
t(all)


all
all1 <- data.frame(
  Number = 6:10,
  Month = month.name[6:10],
  Alphabet = LETTERS[6:10],
  alphabet = letters[6:10]
)

rbind(all,all1)
cbind(all,all1)


# Merge data frame
# merge() function is used 

merge(all,all1)
merge(all1,all)





################ QUESTIONS ###################

# 1 What is the length of this list?
list(alpha = 1, list(beta = 2, gamma = 3, delta = 4), eta = NULL)

length(list(alpha = 1, list(beta = 2, gamma = 3, delta = 4), eta = NULL))


# 2 Where might you find a pair list being used
# When passing arguments to the functions
# When calling formals
# Or in global environment variable .options


# 3 Name as many ways as you can think of to create a subset of a data frame.

We can use matrix-style indexing with pairs of positive integers/negative integers/ logical values/characters in single square brackets.
We can also use list-style indexing with one index value inside single or double square brackets, or the dollar sign ($) operator. 
Thirdly, you can call the subset function.












# 4 How would you create a data frame where the column names weren't unique, valid variable names?

# check.names = FALSE :  is used to ignore name of list

data2 <- data.frame(
  "~!)" = 1:2,
  "a" = 2:3,
  check.names = FALSE
)
data2


# 5 Which function would you use to append one data frame to another?

# cbind and r bind is used to append one dataframe to another  dataframe


data3 <- data.frame(
  month = month.name[1:3],
  days = c(31,28,31)
)

data4 <- data.frame(
month = month.name[4:6],
days = c(30,1,30)
)

data3
data4

rbind(data3,data4)
cbind(data3,data4)


# 6 Create a list variable that contains all the square numbers in the range 0 to 9 in the
"first element, in the range 10 to 19 in the second element, and so on, up to a final
element with square numbers in the range 90 to 99. Elements with no square num-
bers should be included!"

square <- list(
  "0 to 9" = c(0,1,4,9),
  "10 to 19" = 16,
  "20 to 29" = 25,
  "30 to 39" = 36,
  "40 to 49" = 49,
  "50 to 59" = NULL,
  "60 to 69" = 64,
  "70 to 79" = NULL,
  "80 to 89" = 81,
  "90 to 99" = NULL
)
print(square)

# Another Method using function cut

x <- 0:99
sqrt_x <- sqrt(x)
is_square <- sqrt_x == floor(sqrt_x)

squares <- x[is_square]

# Cut function creates different groups with the ranges 0 to 9, 10 to 19 and so on
group <- cut(squares, seq.int(min(x),max(x), 10), include.lowest = TRUE, right = TRUE)
group

split(squares, group)      # Split function splits squares number vector into list


# 7 R ships with several built-in datasets, including the famous3 iris (flowers, not eyes)
"data collected by Anderson and analyzed by Fisher in the 1930s. Type iris to see
the dataset. Create a new data frame that consists of the numeric columns of the
iris dataset, and calculate the means of its columns."

iris

new_iris <- iris[c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width")]

new_iris

colMeans(new_iris)


# 8 The beaver1 and beaver2 datasets contain body temperatures of two beavers. Add
"a column named id to the beaver1 dataset, where the value is always 1. Similarly,
add an id column to beaver2, with value 2. Vertically concatenate the two data
frames and find the subset where either beaver is active."


beaver1
beaver2
id <- rep(1,)
cbind(id, beaver1)
id2 <- rep(2,)
cbind(id2, beaver2)
both_beaver <- rbind(beaver1, beaver2)
subset(both_beaver, as.logical(activ))










