plot(0,0)
plot(c(1,2),c(2,3))



plot(x, y)

x <- c(1,2,3,4,5,6)
y <- c(1,2,3,4,5,8)

plot (x1, y1)

plot(1)
plot(1:10)


plot(1:10, type="o")
plot(1:10, type="l")
plot(1:10, type="p")

# xlab or ylab
plot(x,y, xlab = "X - Axis", ylab = "Y - Axis")

# col arg used colour defination
plot(x,y, xlab = "X - Axis", ylab = "Y - Axis", col = "red", type = "o")

# size defineation cex arg
plot(x,y, xlab = "X - Axis", ylab = "Y - Axis", col = "red", type = "o", cex = 5)

# pch args used to define 
plot(x,y, xlab = "X - Axis", ylab = "Y - Axis", col = "red", type = "o", cex = 5, pch = 12)
plot(x,y, xlab = "X - Axis", ylab = "Y - Axis", col = "red", type = "o", cex = 5, pch = 20)





# Line graph
# type = "l"
a <- c(1,4,5,6,7,9)
b <- c(9,0,8,7,5,5)
plot(a,b, type = "l")

# col is used 
plot(a,b, type = "l", col = "blue")

# lwd args is used to maintain width of line
plot(a,b, type = "l", col = "blue", lwd = 2)
plot(a,b, type = "l", col = "blue", lwd = 5)

# line styling args used lty
plot(a,b, type = "l", col = "blue", lwd = 2, lty = 0)
plot(a,b, type = "l", col = "blue", lwd = 2, lty = 1)
plot(a,b, type = "l", col = "blue", lwd = 2, lty = 2)
plot(a,b, type = "l", col = "blue", lwd = 2, lty = 3)
plot(a,b, type = "l", col = "blue", lwd = 2, lty = 4)
plot(a,b, type = "l", col = "blue", lwd = 2, lty = 5)
plot(a,b, type = "l", col = "blue", lwd = 2, lty = 10)



# two or more than two lines
line1 <- 1:10
line2 <- 10:1

plot(line1, type = "l", col = "blue", lwd = 3)
lines(line2)

plot(c(1,2,3), type = "l", col  = "red", lwd = 5)
lines(c(2,5,6), col = "yellow", lwd = 4)





# Scatter plot
x <- c(1,2,3,4,5,6)
y <- c(7,8,10,9,11,12)

plot(x,y)

# main args used to name graph
plot(x,y, main = "X-Y", xlab = "X", ylab = "Y", col = "Red", lwd = 5, type = "o")

head(mtcars)

plot(mtcars$cyl)

# Bar plot
Name <- c("Rahul","Rohan","Raunak","Rohit","Raman")
marks <- c(78,90,79,67,99)

barplot(marks)

# args names.arg = x, used to define name of each bar
barplot(marks, names.arg = Name)

# colour 
barplot(marks, names.arg = Name, col = "blue")



# density can be defined using density arg
par(mfrow=c(3,3))
barplot(marks, names.arg = Name, density = 1)
barplot(marks, names.arg = Name, density = 10)
barplot(marks, names.arg = Name, density = 100)
barplot(marks, names.arg = Name,col = "blue", density = 1000)


# witdh can be changed using width args
barplot(marks, names.arg = Name,col = "blue", density = 111, width = c(2,4,3,1,5))

# we can pass horiz args to change side
barplot(marks, names.arg = Name,col = "blue", density = 111, width = c(2,4,3,1,5), horiz = TRUE)




# Adavance plotiing in R
# Box plot
# boxplot() function

x <- c(1,2,3,4,5)
boxplot(x, horizontal = TRUE)

# boxplot hide data
# data fully visualise: strpchart() function
stripchart(x, method = "jitter", pch = 19, add = TRUE, col = "red")

# notch arg
boxplot(x, notch = FALSE)

data("mtcars")
boxplot(mtcars$cyl~mtcars$mpg, horizontal = TRUE)
boxplot(cyl~mpg, data = mtcars)
par(mfrow = c(2,2))
boxplot(mtcars$cyl)
boxplot(mtcars$mpg)
x <- 1:10
y <- 10:1
boxplot(y~x)


x <- 1:5
y <- 6:10
z <- 10:15
boxplot(x,y,z, col = c("blue","red","green"))
stripchart(x,y,z, method = "jitter", pch = 19, add = TRUE, col = "red")



boxplot(mtcars$cyl, mtcars$mpg, mtcars$am)  
mtcars$cyl


data("trees")
boxplot(trees, col = rainbow(ncol(trees)))
plot(trees)
summary(trees)
boxplot(trees$Volume)

trees


# Pie
require(plotrix)
x <- c(10,20,30,40)
pie(x, col = rainbow(length(x)), labels = percent, main = "Rupee")
percent <- 100*x/sum(x)

y <- c("Ram","Shyam","RAman", "Raunak")
legend("bottomright", y, fill = rainbow(length(x)), cex = 1)


# linear regression
# response var :height, y
# explantory var : month, x
# c : constant
# m : slope/coeeficient

# y = mx +c 
# height = a + age * b

x <- 1:10
y <- x+1
plot(y ,col = "red", pch = 25)


# lr function : lm()
# lm([target]~[predictor], data = [])
# lm(y~x, data = )

data("mtcars")

lm(mpg~cyl, data = mtcars)

head(mtcars)

# mpg = 37.885 + cyl*-2.876
mpg = 37.885 + 12*-2.876
print(mpg)




age <- 18:29
height <- seq(from = 77, to =79.2 , by = .2)


lm(height~age)
summary(lm(height~age))
# height = 73.4 + 0.2*age
height = 73.4 + 0.2*18
print(height)

plot(height~age, type = "o")



# multiple lr
# y = a1x1+ a2x2 + . . .. . . .
data(mtcars)
head(mtcars)

model <- lm(mpg~cyl+hp, data = mtcars)
summary(model)
plot(model, col = "blue", pch = 12)
last_plot()
# mpg = 36.90833 + -2.26469*cyl - 0.01912*hp
mpg = 36.90833 + -2.26469*6 - 0.01912*110
mpg

summary(mtcars$mpg - model$fitted.values)
return()

# mpg = 36.90833  + cyl*-2.26469 + hp*-0.01912
mpg = 36.90833  + 6*-2.26469 + 110*-0.01912
print(mpg)



# Logical Regression
# glm() function

df <- read.csv("binary.csv")
str(df)
summary(df)

df$rank <- as.factor(df$rank)

logical_model <- glm(admit~gre+gpa+rank, data = df, family = "binomial")
logical_model
summary(logical_model)

x <- data.frame(gre = 790, gpa = 38, rank = as.factor(1))
p <- predict(logical_model, x)
p
