# 1. Write a R program to convert a given matrix to a 1 dimensional array.

mat <- matrix(1:12, nrow = 3)
print(mat)
arr_of_mat <- as.vector(mat)
arr_of_mat

# -------------------------------------------------------------------------------------

# 2. Write a R program to create an array of two 3x3 matrices each with 3 rows and 3 columns 
# from two given two vectors. 

v1 <- 1:6
v2 <- 7:12
mat2 <- matrix(c(v1, v2), nrow = 3)
print(mat2)

# -------------------------------------------------------------------------------------

# 3. Write a R program to create an 3 dimensional array of 24 elements using the dim() function. 

arr_ele <- sample(1:5, 24, replace = TRUE)
dim(arr_ele) <- c(3, 2, 4)
message("3 Dimensional Array")
print(arr_ele)

# -------------------------------------------------------------------------------------

#  4. Write a R program to create an array of two 3x3 matrices each with 3 rows and 3 columns 
# from two given two vectors. Print the second row of the second matrix of the array and the 
# element in the 3rd row and 3rd column of the 1st matrix. 

v1 <- 1:6
v2 <- 7:12
mat2 <- array(c(v1, v2), dim = c(3,3,2))
mat2[2, ,2]
mat2[3,3,1]

# -------------------------------------------------------------------------------------

# 5. Write a R program to combine three arrays so that the first row of the first array is followed by 
# the first row of the second array and then first row of the third array. 

v3 <- rbind(rep(1, 3), rep(2, 3), rep(3, 3))
v4 <- rbind(rep(4, 3), rep(5, 3), rep(6, 3))
v5 <- rbind(rep(7, 3), rep(8, 3), rep(9, 3))

comb_arr <- matrix(c(rbind(v3, v4, v5)), ncol = 3, byrow = TRUE)
comb_arr

# -------------------------------------------------------------------------------------

# 6. Write a R program to create an array using four given columns, three given rows, 
# and two given tables and display the content of the array. 

arr3 <- array(1:24, dim = c(3, 4, 2))
print(arr3)

# -------------------------------------------------------------------------------------

# 7. Write a R program to create a two-dimensional 5x3 array of sequence of even integers greater than 50. 

arr4 <- array(seq(from = 50, length.out = 15, by = 2), dim = c(5, 3))
arr4
