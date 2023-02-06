# Que - What is the name of the function used to search for R-related help on the Internet?
RSiteSearch("mean")

1:5 + 6:10

# -> Median 
median(1:5)
median(1, 2, 3, 4, 5)

-2:2 * -2:2

# '^' and '**' do the same operation
2^3
2**3
identical(2^3,2**3)

1:10/3
1:10 %/% 3
1:10 %% 3

# -> Trigonometric Function
sin(c(0, pi / 4, pi / 2, pi)) 
cos(c(0, pi / 4, pi / 2, pi)) 
cos(pi/4)
cos(0)
(sin(pi/4))^2+(cos(pi/4))^2
cos(pi)
cos(pi/2)
sin(pi/2)

# -> Euler's Formula and Exponentiation
exp(pi * 1i) + 1
exp(1:5)
exp(1)
exp(2)

2.718282^2
exp(pi * 1i) + 1

# -> Factorial(for finding factorial factorial function is used)
factorial(7) + factorial(1)
factorial(7)

(5, 0:5)

#choose(k, n) calculates the number of sets with n elements than can be chosen from a set with k elements
choose(1,1)
choose(3,2)
choose(5, 0:5)


c(3+1,5-1,1+1+2)==4

(1:5)
exp(1:5)

# -> For square root function we use sqrt() function
27^2
sqrt(2)^2==2
sqrt(2)^2 - 2

# -> Equality (For equality we use all.equal function)
# -> To check that two numbers are the same, don't use ==. Instead, use the all.equal function.
all.equal(sqrt(2)^2,2)
all.equal(sqrt(2)^2,3)              
isTRUE(all.equal(sqrt(2)^2,3))


c("Can", "you", "can", "a", "can", "as","a", "canner", "can", "can", "a", "can?") == "can"
c("A", "B", "C", "D") < "C"
c("a", "b", "c", "d") < "C" 
c("a", "b", "c", "d") <= "C"
x <- 1:5
y = 6:10
x + 2 * y - 3
?make.names
sum(1:5)
median(1, 2, 3, 4, 5)
sum(1:5)-2
sum(1, 2, 3, 4, 5)-2
?Arithmetic

x <- -1:12
x
x + 1
-1%%2
2 * x + 3
x %% 2 #-- is periodic
x %/% 5
x %% Inf # now is defined by limit (gave NaN in earlier versions of R)
2.5%/%2
sqrt(2)%/%2
pi%/%(22/7)
pi/(22/7)
exp
exp(1)
exp(1)%/%1
exp(1)%/%2
exp(1)/2
?edge
help.edge
?Arithmetic
?Trig
is.finite(tanpi(0.5))
is.infinite(tanpi(0.5))
is.nan(tanpi(0.5))
?Special
lfactorial(7)
help.lfactorial
?lfactorial
gamma(1)
gamma(9)
9*9*9*9*9*9*9*9*9
gamma(9)/9
4480/9



rm(list = ls())
a <- c(sqrt(Inf), sin(Inf))
a
b <- c(log(Inf), log(Inf, base = Inf))
b

c <- c(NA+NA, NaN+NaN, NaN+NA, NA+NaN)
c


# Nan And NA
d <- c(0, Inf, -Inf, NaN, NA)
is.finite(d)
is.infinite(d)
is.nan(d)
is.na(d)
NaN>NA
Inf>-Inf
NA+1 >- NA
runif(1)
runif(2)
runif(3)
runif(4)
runif(5)
floor(runif(5, min=10, max=12))
sample(10:12, 3, replace=TRUE)
rnorm(1)
rnorm(5)



x <- readline(prompt = "Enter X")
y <- readline(prompt = "Enter Y")
z <- x+y
paste("The Sum of X", x, "And Y is",y,x+y)




X <- 3
y <- 'a'
class(c(x,y))
class(x)
class(y)
is.numeric(x)


?typeof
typeof(X)
typeof(y)
storage.mode(X)
storage.mode(y)
mode(X)
.Machine
identical(X,y)
gender <- factor(c("male", "female", "female", "male", "female"))
gender

Fibonacci <- numeric(10)
Fibonacci
[1] <- Fibonacci[2] <- 1
for (i in 3:10) Fibonacci[i] <- Fibonacci[i - 2] + Fibonacci[i - 1]
print("The first 10 fibonnacci series number is")
print(Fibonacci)


n=67
x = seq(2, n)
x


x <- 2:90
print(x[(x%%2) != 0])
print(letters)

install.packages("Rmpfr")
?Rmpfr


df <- data.frame(x = 1:4, y = 5:8, z = 10:13)
df
apply(X = df, MARGIN = 1, FUN = sum)
apply(df, 1, sum)
apply(df[c(1, 2), ], 2, sum)
apply(df[, c(1, 3)], 2, sum)
