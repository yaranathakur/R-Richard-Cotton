# 1. Write a R program to take input from the user (name and age) and display the values. Also print the version of R installation
# Taking Input From The User we use readline(prompt = " ") function
# We can use {} brackets to read multiple line sequentially
{
  name = readline(prompt = "Enter Your Name: ")
  age = readline(prompt = "Enter Your Age: ")
  print(paste("My Name is ",name, "and I am ", age, "years old"))
}

# We can print the version of R using the function R.Version
print(R.version.string)
print(R.version)
print(R.Version())

# -------------------------------------------------------------------------------------

# 2. Write a R program to get the details of the objects in memory
# We can use ls() function to list all available objects in our workspace
ls()
# We can use ls(str()) to print the object details pesent in our workspace
ls(str())

# -------------------------------------------------------------------------------------

# 3. Write a R program to create a sequence of numbers from 20 to 50 and find the mean of numbers from 20 to 60 and sum of numbers from 51 to 91
# We use seq() function to create sequence of number
# Syntax: seq(from = 1, to = 1, by = ((to - from)/(length.out - 1)),length.out = NULL, along.with = NULL, ...)
print("Sequence of numbers from 20 to 50:")
print(seq(20,50))

# mean() function is used to find mean
print("Mean of numbers from 20 to 60:")
print(mean(20:60))

# sum() function is used to find sum
print("Sum of numbers from 51 to 91:")
print(sum(51:91))

# -------------------------------------------------------------------------------------

# 4. Write a R program to create a vector which contains 10 random integer values between -50 and +50.
# We can use sample, rnorm, runif to generate random number
# Syntax: sample(x, size, replace = FALSE, prob = NULL)
# Syntax: rnorm(n, mean = 0, sd = 1)
# Syntax: runif(n, min = 0, max = 1)

# Here we use runif because we must define min and max
runif(10, min = -50, max = 50)

# -------------------------------------------------------------------------------------

# 5. Write a R program to get the first 10 Fibonacci numbers
fib <- numeric(10)
fib[1] <- fib[2] <- 1             # First and Second Fibbonacci are same
for(i in 3:10){
  fib[i] <- fib[i-1] + fib[i-2]   # Third element is sum of 2 previous element 
}
print(fib)

# -------------------------------------------------------------------------------------

# 6. Write a R program to get all prime numbers up to a given number (based on the sieve of Eratosthenes).

# -------------------------------------------------------------------------------------

# 7. Write a R program to print the numbers from 1 to 100 and print "Fizz" for multiples of 3, 
# print "Buzz" for multiples of 5, and print "FizzBuzz" for multiples of both.

num <- 1:100
for(i in num)
{
  if(i %% 3 == 0 && i %% 5 == 0)
  {
    print("FizzBuzz")
  }
  else if(i %% 3 == 0)
  {
    print("Fizz")
  }
  else if(i %% 5 == 0)
  {
    print("Buzz")
  }
  else
  {
    print(i)
  }
}

# -------------------------------------------------------------------------------------

# 8. Write a R program to extract first 10 English letter in lower case and 
# last 10 letters in upper case and extract letters between 22nd to 24th letters in upper case.
letters[1:10]
LETTERS[17:26]
LETTERS[22:24]


# -------------------------------------------------------------------------------------

# 9. Write a R program to find the factors of a given number.
factor_finder <- function(n){
  print(paste("The Factor of ",n, "are:"))
  for(i in 1:n){
    if(n %% i == 0){
      print(i)
    }
  }
}
factor_finder(10)
factor_finder(12)
factor_finder(100)

# -------------------------------------------------------------------------------------

# 10. Write a R program to find the maximum and the minimum value of a given vector.
num <- c(1, 2, 99, 78)
min_max <- function(vectr){
  cat("Maximum: ", max(vectr),"\nMinimum: ",min(vectr))
}
min_max(num)

# -------------------------------------------------------------------------------------

# 11. Write a R program to get the unique elements of a given string and unique numbers of vector.

vect <- c(1, 45, 76, 98, 1)
stri <- c("Yarana", "Vishal", "Yash", "Yarana")
unq <- function(vect, stri){
  cat("Unique Number: ", unique(vect), "\nUnique String: ", unique(stri))
}
unq(vect, stri)

# -------------------------------------------------------------------------------------

# 12. Write a R program to create three vectors a,b,c with 3 integers. 
# Combine the three vectors to become a 3×3 matrix where each column represents a vector. 
# Print the content of the matrix.
a <- 1:3
b <- 4:6
c <- 7:9
matrix1 <- cbind(a, b, c)
matrix1

# -------------------------------------------------------------------------------------

# 13. Write a R program to create a list of random numbers in normal distribution and 
# count occurrences of each value.

random = floor(rnorm(1000, 50, 100))
random
tab <- table(random)
tab

# -------------------------------------------------------------------------------------

# 14. Write a R program to read the .csv file and display the content.

csv <- read.csv("R_w3r.csv")
print(csv)

# -------------------------------------------------------------------------------------

# 15. Write a R program to create three vectors numeric data, character data and logical data. 
# Display the content of the vectors and their type.

a <- c(1, 4, 5, 6, 8, 9)
b <- c("Yarana", "Yash", "Vishal")
c <- c(TRUE, FALSE, TRUE, FALSE)
cont <- function(x, y, z){
  cat("Content of a is: ", typeof(a), "\nContent of b is: ", typeof(b), "\nContent of c is: ", typeof(c))
}
cont(a, b, c)

# -------------------------------------------------------------------------------------

# 16. Write a R program to create a 5 x 4 matrix , 3 x 3 matrix with labels and fill the matrix by rows 
# and 2 × 2 matrix with labels and fill the matrix by columns.

(mat1 <- matrix(1:20, nrow = 5))
(mat2 <- matrix(1:9, nrow = 3, byrow = TRUE))
(mat3 <- matrix(1:4, nrow = 2))


# -------------------------------------------------------------------------------------

# 17. Write a R program to create an array, passing in a vector of values and a vector of dimensions. 
# Also provide names for each dimension.
arr <- array(1:9, dim = c(3, 3, 3), dimnames = list(c("r1", "r2", "r3"),
                                                    c("c1", "c2", "c3"),
                                                    c("m1", "m2", "m3")))
print(arr)

# -------------------------------------------------------------------------------------

# 18. Write a R program to create an array with three columns, three rows, and two "tables", 
# taking two  vectors as input to the array.  Print the array.  

v1 <- c(1, 3, 5, 7, 9)
v2 <- c(2, 4, 6, 8)
arr1 <- array(c(v1, v2), dim = c(3, 3, 2))
print(arr1)

# -------------------------------------------------------------------------------------

# 19. Write a R program to create a list of elements using vectors, matrices and a functions. 
# Print the content of the list.  

v3 <- c(1, 2, 3, 4)
mat3 <- matrix(1:9, nrow = 3) 
list1 <- list(v3, mat3, sum(v3), mean(mat3))
list1

# -------------------------------------------------------------------------------------

# 20. Write a R program to draw an empty plot and an empty plot specify the axes limits of the graphic. 

plot.new()
plot(0,0,xlab = "", ylab = "", xlim = c(-10, 10), ylim = c(-10, 10))
plot(1, type="n", xlab="", ylab="", xlim=c(0, 20), ylim=c(0, 20))

# -------------------------------------------------------------------------------------

# 21. Write a R program to create a simple bar plot of five subjects marks.

marks <- c(90, 80, 70, 75, 85)
subjects <- c("History", "Geo", "Maths", "Science", "Art")
barplot(marks, names.arg = subjects, col = "Orange", border = "Red",)

# -------------------------------------------------------------------------------------

# 22. Write a R program to create bell curve of a random normal distribution.

randm <- floor(rnorm(1000, 50, 10))
tabl <- table(randm)
par(mfrow = c(1,2))
barplot(tabl)
plot(tabl)

# -------------------------------------------------------------------------------------

# 23. Write a R program to compute sum, mean and product of a given vector elements.

v4 <- 1:20
cat("Vector: ", v4, "\nSum: ", sum(v4), "\nMean: ", mean(v4), "\nProduct: ", prod(v4))


# -------------------------------------------------------------------------------------

# 24. Write a R program to create a list of heterogeneous data, which include character, 
# numeric and logical vectors. Print the lists. 

name <- c("Yarana", "Yash", "Vishal", "Natasha")
marks <- c(23, 30, 87, 90)
pass <- c(FALSE, FALSE, TRUE, TRUE)
list2 <- list(name, marks, pass)
print(list2)

# -------------------------------------------------------------------------------------  

# 25. Write a R program to create a Data frames which contain details of 5 employees and display the details. 

emp_df <- data.frame(id = c(1, 2, 3, 4, 5),
                     name = c("Yarana", "Yash", "Vishal", "Natasha", "Divya"),
                     gender = c("M", "M", "M", "F", "F"),
                     dept = c("Security", "Transport", "Cleaning", "Head", "CEO"),
                     salary = c(15000, 17000, 20000, 500000, 700000)
                     )
print("Detail Of Employee")
emp_df

# -------------------------------------------------------------------------------------

# 26. Write a R program to create a Data Frames which contain details of 5 employees and 
# display summary of the data. 

emp_df <- data.frame(id = c(1, 2, 3, 4, 5),
                     name = c("Yarana", "Yash", "Vishal", "Natasha", "Divya"),
                     gender = c("M", "M", "M", "F", "F"),
                     dept = c("Security", "Transport", "Cleaning", "Head", "CEO"),
                     salary = c(15000, 17000, 20000, 500000, 700000)
)
print("Summary Of Employee Data")
summary(emp_df)


# -------------------------------------------------------------------------------------

# 27. Write a R program to create the system's idea of the current date with and without time. 

message("System current date with and without time")
Sys.Date()
Sys.time()

# -------------------------------------------------------------------------------------

