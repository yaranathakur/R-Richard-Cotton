#We want to examine whether a variable stored as quantity is above 20. If quantity is
#greater than 20, the code will print You sold a lot! otherwise Not enough for today.
x <- 19
  if(x >= 20){
    print("You sold a lot")
  } else
    print("Not enough for today")

#We are interested to know if we sold quantities between 20 and 30. If we do, then the 
#print Average day. If quantity is > 30 we print What a great day!, otherwise Not enough for today.
y <- 25
  if (y>20 && y<30){
    print("Average day")
  } else if(y>30){
    print("What a great day!")
  } else if(y<20){
    print("Not enough for today")
  }
                 #OR#
y <- 10
if(y>30){
  print("What a great day!")
} else if(y<20){
  print("Not enough for today")
} else {
  print("Average day")
}

#VAT has different rate according to the product purchased. Imagine we have three 
#different kind of products with different VAT applied:
#Categories	        Products	                            VAT
#A                  Book, magazine, newspaper, etc..	    8%
#B	                Vegetable, meat, beverage, etc..	    10%
#C	                Tee-shirt, jeans, pant, etc..	        20%
#calculate the total price of products
categories <- "A"
price <- 100
if (categories=="A"){
  cat("The applied VAT is 8% and total price is",price*1.08)
}else if (categories=="B"){
  cat("The applied VAT is 10% and total price is",price*1.10)
}else {
  cat("The applied VAT is 20% and total price is",price*1.20)
}



#Find whether the letter is found in a variable or not "a" "b" "c" "d" "e" "f" "g"
#     "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "s" "t" "u" "v" "w" "x" "y" "z"
letters[1:26]
print(letters)
if("A" %in% letters){
  print("It is found in letters")
}else {
  print("It is not found in letters")
}

# Find whether the given character is vowel or not
character <- "C"
if(character=="a"||character=="e"||character=="i"||character=="o"||character=="u"||character=="A"||character=="E"||character=="I"||character=="O"||character=="U"){
  print("Given input is Vowel")
} else {
  print("It is not Vowel")
}


rm(list = ls())
# Switch simple implementation
res <- switch(3,
              "Mumbai",
              "Delhi",
              "Motihari",
              "Pipra")
print(res)


rm(list = ls())
# R expression outputs with the switch() function
x  <- 1000
y <- 500
result <- switch("sum",
                 "sum"=print(x+y),
                 "sub"=print(x-y),
                 "mul"=print(x*y),
                 "Div"=print(y/x)
                 )
rm(list = ls())
#R switch() function with multiple match cases
code <- "A"
fruit <- switch(code,"A"="Apple","A"="Banana","C"="Change")
print(fruit)


rm(list = ls())
#Null printing
call <- switch(4,"Ram","Vibe","Alu")
print(call)

rm(list = ls())


#others
x <- 0
y <- 1
z <- switch(x+y,"Hello Vibe",
            "Hello Yarana",
            "Hello Shyam",
            "Hello Ram",
            "Hello Sandhya")
print(z)


rm(list = ls())
# Switch Example
x <- 1
y <- 9


z <- switch(paste(x,y,sep="1"),
            "12"="Vibe",
            "21"="Vishal",
            "1"="Yarana",
            "2"="Yash")
print(z)

paste(x,y,sep="1")
a <- 7
paste(x,y,a,sep="")
?sep


rm(list = ls())
# switch example
y = "18"  
a=10  
b=2  
x = switch(  
  y,  
  "9"=cat("Addition=",a+b),  
  "12"=cat("Subtraction =",a-b),  
  "18"=cat("Division= ",a/b),  
  "21"=cat("multiplication =",a*b)  
)  

print(x)  



#1. Write a R program to take input from the user (name and age) and display the values. 
#Also print the version of R installation.

name <- readline(prompt = "Input Your Name: ")          #readline(prompt=)---> take input from user
age <- readline(prompt = "Input Your Age: ")
print(paste("My name is",name, "and my age is",age))  #paste(x,y)----> write two statement adjacent to each other
print(R.version.string)


# Write a R program to get the details of the objects in memory.
a <- "Chand"
b <- c(1:9)
c <- c("Ram", "Ramayan")
print(ls())
print(ls.str())

# Write a R program to get the first 10 Fibonacci numbers.
Fibonacci <- numeric(10)
Fibonacci[1] <- Fibonacci[2] <- 1
for(i in 3:10){
  Fibonacci[i] <- Fibonacci[i-1]+Fibonacci[i-2]
}
print("The 10 Fibonacci series are")
print(Fibonacci)

# Write a R program to get all prime numbers up to a given number (based on the sieve of Eratosthenes).
prime_numbers <- function(n) {
  if (n >= 2) {
    x = seq(2, n)
    prime_nums = c()
    for (i in seq(2, n)) {
      if (any(x == i)) {
        prime_nums = c(prime_nums, i)
        x = c(x[(x %% i) != 0], i)
      }
    }
    return(prime_nums)
  }
  else 
  {
    stop("Input number should be at least 2.")
  }
} 
prime_numbers(12)




# Write a R program to print the numbers from 1 to 100 and print "Fizz" for multiples of 3,
#print "Buzz" for multiples of 5, and print "FizzBuzz" for multiples of both

x <- 1:100
for (n in x) {
  if (n %% 3 == 00 & n %% 5 == 0) {print("FizzBuzz")}
  else if (n %% 3 == 0) {print("Fizz")}
  else if (n %% 5 == 0) {print("Buzz")}
  else print(n)
}


# Write a R program to extract first 10 english letter in lower case and last 10 letters
# in upper case and extract letters between 22nd to 24th letters in upper case.
a <- head(letters, 10)
b <- tail(LETTERS, 10)
c <- tail(LETTERS[22:24])

cat("first 10 english letter in lower case are")
print(a)

cat("last 10 letters in upper case are")
print(b)

cat("letters between 22nd to 24th letters in upper case are")
print(c)


# Random Number Generator dividing them and storing them in another 
# Variable x and checking + - 0 or missing
(random <- rnorm(2, sd = 1))
x <- random[1] %/% random[2]


verify <- function(x){
  if(x == 0)
  {
    print("It is Zero")
  }
  else if(x > 0)
  {
    print("It is Positive")
  }
  else if(x < 0){
    print("It is Negative")
  }
  else
  {
    print("It is Missing")
  }
}

random
x
verify(x)



runif(2, min = -1, max = 1)

# Finding Greatest of three number
a <- 100
b <- 500
c <- 333
a > b && a > c ? print("A is Largest"): b > c ? print("B is Largest"):print("C is Largest")

if(a > b && a > c)
{
  cat(a)
}else if(b > c)
{
  cat(b)
}else
{
  cat(c)
}


