####################### CHAPTER 4 ########################

### VECTOR ###
8.5:4.5

c(1,1:3,c(5,6),9)

vector('numeric',5)
vector('character',5)
vector("logical",5)
vector("complex",5)
vector("list",5)

# The fllowing comand do the same work as previous command
numeric(5)
character(5)
logical(5)
complex(5)
list(5)    # list function does not the same


### SEQUENCE ###
2:9

# seq function is used to do the sam operation
seq.int(2,9)
seq.int(2,9,1)

seq.int(1,2,0.1)


# seq_len creates a sequence from 1 up to its input
seq_len(5)

# seq_along creates a sequence from 1 up to the length of its input

pp <- c("Peter", "Piper", "picked", "a", "peck", "of", "pickled", "peppers")
for(i in seq_along(pp)) print(pp[i])

for (i in pp) {print(i)}

#### LENGTHS OF A VECTOR ####
length(0:5)
length(1:5)
length(c(1,2,3))
length(c(TRUE,FALSE,NA,NaN))


sn <- c("Sheena", "leads", "Sheila", "needs")
 length(sn)     # shows the no of strings

# nchar() shows the number of character in given vector 
nchar(sn)



poincare <- c(1, 0, 0, 0, 2, 0, 2, 0)
(length(poincare) <- 3)           # Decrease the length of the vector
poincare

(length(poincare) <- 8)           # Increase the length of the vector
poincare


#### NAME IS GIVEN TO VECTOR #####
c(apple = 1, banana = 2, "kiwi fruit" = 3, 4)

# We can assign the name to the element using names() function
x <- 1:4
names(x) <- c("apple", "bananas", "kiwi fruit", "")
x

names(x)     # Retrieve the name of the vector


#If a vector has no element names, then the names function returns NULL:
names(1:4)


### INDEXING ###
x <- (1:5) ^ 2
x

x[c(1, 3, 5)]

# Passing a vector of negative numbers returns the slice of the vector containing the
#elements everywhere except at those locations.
x[c(-2, -4)]

x[c(TRUE, FALSE, TRUE, FALSE, TRUE)]

# After naming each element, this method also returns the same values:

names(x) <- c('one','four','nine','sixteen','twentyfive')

x[c('one','nine','twentyfive')]

# Mixing positive and negative values is not allowed, and will throw an error
x[c(1,-1)]

# Using missing value as index return missing value
x[c(1, NA, 5)]
x[c(TRUE, FALSE, NA, FALSE, TRUE)]

# Missing values don't make any sense for negative indices, and cause an error:
x[c(-2, NA)]

# Noninteger indices are silently rounded toward zero
x[c(1.9)]
x[2.5]
x[-1.9]

# empty index return all elements but we should avoid this as this cause problem sometimes
x[]

# The which function returns the locations where a logical vector is TRUE.
which(x>4)       # Replace logical indexing with integer indexing

# which.min and which.max are more efficient shortcuts for which(min(x)) and which(max(x))
which.max(x)
which.min(x)

which(min(x))
?which
?min
?which.min


#### Vector Recycling and Repetition ####
1:5+1
1+1:5

1:5+1:15

1:5+1:7    # Warning is shown when length of vector is not multiple of shorter one

# The rep function create a vector with repeated elements
rep(1:5,3)
rep(1:5, each=3)
rep(1:5, times=1:5)
rep(1:5, length.out=8)

# like seq also rep has simpler and fast variant
rep.int(1:5,3)
rep_len(1:5,7)


########### MATRICES AND ARRAYS #####################

# creating matrices and arrays
# Creating arrays we use array function

array1 <- array(1:24, dim = c(4,3,2), dimnames = list(c("row1","row2","row3","row4"),
                                                        c("col1","col2","col3"),
                                                      c("matrix1","matrix2")))
print(array1)

class(array1)


# Creating a matrix we use matrix function
matrix1 <- matrix(1:12, nrow = 4, dimnames = list(c("row1","row2","row3","row4"),
                                                   c("col1","col2","col3")))
print(matrix1)
class(matrix1)
is.matrix(matrix1)
is.array(matrix1)


array2 <- array(1:12, dim = c(4,3), dimnames = list(c("row1","row2","row3","row4"),
                                                     c("col1","col2","col3")))
identical(matrix1,array2)                
class(array2)

rm(list=ls())

# We can also arrange element of matrix row wise by using byrow = TRUE argument

matrix1 <- matrix(1:12, nrow = 4, byrow = TRUE,  dimnames = list(c("row1","row2","row3","row4"),
                                                  c("col1","col2","col3")))
matrix1

#### ROWS COLUMN and DIMENSIONS ####
dim(array2)
dim(matrix1)

# For a matrix nrow and ncol returns number of rows and columns

nrow(matrix1)
ncol(matrix1)

# nrow and ncol also works on arrays

nrow(array2)
ncol(array2)

# Length() function returns the length of matrices and arrays

length(matrix1)
length(array2)

# We can also reshape a matrix or array using dim() function
dim(matrix1) <- c(6,2)
matrix1

dim(matrix1) <- c(2,3)      # Shows an error because we have to pass axb=cxd

dim(array2) <- c(2,6)
array2


# nrow, ncol, and dim return NULL when applied to vectors.
# The functions NROW and NCOL are counterparts to nrow and ncol 
# that pretend vectors are matrices with a single column

identical(nrow(matrix1),NROW(matrix1))
identical(ncol(matrix1),NCOL(matrix1))

# EXAMPLE
recaman <- c(0, 1, 3, 6, 2, 7, 13, 20)

nrow(recaman)
ncol(recaman)
NROW(recaman)
NCOL(recaman)

#### ROW COLUMN AND DIMENSIONS names ####

rownames(matrix1)
row.names(matrix1)       # Both rownames and row.names does samething
colnames(matrix1)

rownames(array2)
row.names(array2)
colnames(array2)

dimnames(matrix1)
dimnames(array2)

dimnames(array1)

matrix1[1,c("col1","col2")]
matrix1
array2[1,c(2,3)]
array2

# To include all of a dimension, leave the corresponding index blank

matrix1[1,]
array2[,1]



#### Combining Matrices ####

matrix2 <-  matrix(seq.int(2, 24, 2), nrow = 4, dimnames = list(
                                                              c("row5","row6","row7","row8"),
                                                              c("col4", "col5", "col6")))
matrix2
matrix1

# c function converts matrices to vectors before concatenating them
c(matrix1,matrix2)

cbind(matrix1,matrix2)
rbind(matrix1,matrix2)


# ARRAY ARITHEMATIC  (Works element wise)

matrix1 + matrix2
matrix1 * matrix2

matrix2 * matrix1 


# Note that matrices size should be same
matrix2 <- matrix(1:12, nrow = 2)
matrix2

matrix1 + matrix2      # throws an error : non-conformable arrays

# Vector is less prior than array therefore when we do vector and array operation 
# usual vector recycling rules apply, but the
# dimension of the results is taken from the array.

# t() function transposes matrices

t(matrix1)
matrix1


#  %*% is used for inner multiplication of matrix
matrix1 %*% t(matrix1)


# %o% is used for outer multiplication

1:3 %o% 4:6

# outer() function do the same operation as %*% 
outer(1:3,4:6)


# Power operator, ^, also works element-wise on matrices

m <- matrix(c(1, 0, 1, 5, -3, 1, 2, 4, 7), nrow = 3)
m

m^-1

# To invert a matrix you cannot simply raise it to the power of minus one.
# Solve function is used

m_inverse <- solve(m)
m_inverse

# Inverse and matrix when multiplied returns identity matrix of same order.
m %*% m_inverse



############### QUESTIONS #####################

# 1 How would you create a vector containing the values 0, 0.25, 0.5, 0.75, and 1?
x <- c(0,0.25,0.5,0.75,1)
is.vector(x)

# 2 Describe two ways of naming elements in a vector.

# names(x) and 
names(x) <- c("zero","point 2 5","point 5","point 7 5","one")
names(x) <- LETTERS[1:5]
names(x)


# 3 What are the four types of index for a vector?

# logical index
x <- c(0,0.25,0.5,0.75,1)
x[c(TRUE,FALSE,TRUE,FALSE,TRUE)]

# empty index
x[]

# integer index (negative)
x[c(-2,-3)]

# place value index
x[c(1,2,5)]

# which() function returns where logical are true
which(x>.5)

# noninteger indexing retuns
x[c(1.9,2.5,5.6)]


# 4 What is the length of a 3-by-4-by-5 array?
array1 <- array(1:12, dim = c(3,4,5))
array1

length(array1)


# 5 Which operator would you use to perform an inner product on two matrices?
mat1 <- matrix(1:9, nrow = 3, ncol = 3)
mat2 <- matrix(9:17, nrow = 3, ncol = 3)

# %*% is used for inner product on 2 matrices
mat1 %*% mat2

mat1
mat2

# %o% is used for outer multiplication
mat1 %o% mat2

# 6 The nth triangular number is given by n * (n + 1) / 2. Create a sequence of the
# first 20 triangular numbers. R has a built-in constant, letters, that contains the
# lowercase letters of the Roman alphabet. Name the elements of the vector that you
# just created with the first 20 letters of the alphabet. Select the triangular numbers
# where the name is a vowel.

# sequence of 20 traingular number 
n <- 1:20
traingular_seq <- n*(n+1/2)

traingular_seq

# alphabet is assigned to them
names(traingular_seq) <- letters[1:20]
traingular_seq

name <- c(Four=4)
name

# traingular sequence containing vowel
traingular_seq[c("a","e","i","o","u")]


# 7 The diag function has several uses, one of which is to take a vector as its input and
# create a square matrix with that vector on the diagonal. Create a 21-by-21 matrix
# with the sequence 10 to 0 to 11 (i.e., 11, 10, . , 1, 0, 1, ., 11).

diag(seq(-11,11))


# 8 By passing two extra arguments to diag, you can specify the dimensions of the
# output. Create a 20-by-21 matrix with ones on the main diagonal. Now add a row
# of zeros above this to create a 21-by-21 square matrix, where the ones are offset a
# row below the main diagonal

matrix20by21 <- diag(rep.int(1,20),20,21)
matrix20by21

below_the_diag <- rbind(0,matrix20by21)
adding_row0



# 9 Create another matrix with the ones offset one up from the diagonal

matrix21by20 <- diag(rep(1,20),21,20)

adding_col0_inbegin <- cbind(0,matrix21by20)
adding_col0_inbegin
rm(list = ls())

on_the_diagonal <- diag(seq.int(-10,10))


# 10 Add these two matrices together, then add the answer from Exercise 4-2. The re-
 "sultant matrix is called a Wilkinson matrix"
willinkson_mat <- below_the_diag+adding_col0_inbegin+on_the_diagonal



# 11 The eigen function calculates eigenvalues and eigenvectors of a matrix. Calculate
  "the eigenvalues for your Wilkinson matrix. What do you notice about them?

eigen(willinkson_mat)$values  

