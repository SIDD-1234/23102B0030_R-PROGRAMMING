x = matrix(nrow=4, ncol=3, data=c(1:12))
x

rownames(x) = c("r1", "r2", "r3", "r4")
x

colnames(x) = c("c1", "c2", "c3")
x

# Assign the same value to all matrix elements
x = matrix(nrow=4, ncol=2, data=2)
x

# Diagonal matrices
d = diag(1, nrow=3, ncol=3)
d

d = diag(5, nrow=3, ncol=3)
d

# Transpose
x = matrix(nrow=4, ncol=2, data=1:8, byrow=T)
x

xt = t(x)
xt

# Row and column sums
x = matrix(nrow=4, ncol=2, data=c(1,2,3,4,5,6,7,8))
x

rowSums(x)
colSums(x)

# Row and column means
x = matrix(nrow=4, ncol=2, data=c(1,2,3,4,5,6,7,8))
x

rowMeans(x)
colMeans(x)

# Matrix indexing
x = matrix(nrow=5, ncol=3, byrow=T, data=1:15)

x[3,]
x[,2]
x[4:5, 2:3]
x[c(1,4), c(1,3)]

x

# Scalar operations on matrices
x = matrix(nrow=4, ncol=2, data=1:8, byrow=T)
x
x + 5

x = matrix(nrow=4, ncol=2, data=1:8, byrow=T)
x
x - 5

x = matrix(nrow=4, ncol=2, data=1:8, byrow=T)
x
5 * x

x = matrix(nrow=4, ncol=2, data=1:8, byrow=T)
x
x / 2

# Matrix addition and subtraction
x = matrix(nrow=4, ncol=2, data=1:8, byrow=T)
y = matrix(nrow=4, ncol=2, data=11:18, byrow=T)

x
y
x + y
x - y

# Other scalar expressions
x = matrix(nrow=4, ncol=2, data=1:8, byrow=T)
x

4 * x
x + 4*x
4*x - x

# Matrix multiplication
x = matrix(nrow=4, ncol=2, data=1:8, byrow=T)
y = matrix(nrow=2, ncol=4, data=11:18, byrow=T)

x
y

x %*% y
y %*% x

# X'X and XX'
x = matrix(nrow=4, ncol=2, data=1:8, byrow=T)
x

t(x)
t(x) %*% x
x %*% t(x)

# Cross product
x = matrix(nrow=4, ncol=2, data=1:8, byrow=T)
x

t(x)
crossprod(x)

# Row-wise concatenation
x = matrix(nrow=3, ncol=2, data=1:6, byrow=T)
y = matrix(nrow=3, ncol=2, data=11:16, byrow=T)

x
y
rbind(x, y)

# Column-wise concatenation
x = matrix(nrow=3, ncol=2, data=1:6, byrow=T)
y = matrix(nrow=3, ncol=2, data=11:16, byrow=T)

x
y
cbind(x, y)

# Inverse
y = matrix(
  nrow = 2,
  ncol = 2,
  byrow = T,
  data = c(84,100,100,120)
)
y
solve(y)

# Eigen values and vectors
y = matrix(
  nrow = 2,
  ncol = 2,
  byrow = T,
  data = c(84,100,100,120)
)
y
eigen(y)


# --- Logical operators ---

# OR: || versus |
x = 8
(x < 10) || (x < 2)

x = 18
(x < 10) || (x < 2)

x = c(8,18)
(x < 10) || (x < 2)
(x < 10) | (x < 2)

# AND: && versus &
x = 5
(x < 10) && (x > 2)

x = 15
(x < 10) && (x > 2)

x = c(8,18)
(x < 10) && (x > 2)
(x < 10) & (x > 2)

# Vector filtering
x = 1:6
(x > 2) & (x < 5)
x[(x > 2) & (x < 5)]

x = 1:6
(x > 2) | (x < 5)
x[(x > 2) | (x < 5)]

# Longer form operates using the first element
x = 1:6
(x > 2) && (x < 5)

(x[1] > 2) & (x[1] < 5)

# Basic logical operators
x = TRUE
y = FALSE

x & y
x | y
!x

# Logical values
x = 5

Logical1 = (x > 2)
Logical1
is.logical(Logical1)

Logical2 = (x < 10)
Logical2
is.logical(Logical2)

Logical3 = (x != 5)
Logical3
is.logical(Logical3)

x = 5

Logical4 = (2*x > 11)
Logical4
is.logical(Logical4)

Logical5 = (3*x < 20)
Logical5
is.logical(Logical5)

# Comparisons
8 > 7
7 < 5
7 > 7
7 >= 7
8 < 8
8 <= 8

8 != 9
9 != 9
7 == 7
7 == 8

x = TRUE
!x

# Vector comparisons
x = c(1,2,3)
y = c(4,5,6)

x > y
x < y
x != y
x == y

# isTRUE / isFALSE
isTRUE(8 < 6)
isTRUE(8 > 6)
isFALSE(5 < 8)
isFALSE(5 > 8)