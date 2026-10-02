# Addition
c(2,3,5,7) + c(-2,-3,-5,8)

# Recycling of shorter vector
c(2,3,5,7) + c(8,9)

# Different incompatible lengths - produces a warning
c(2,3,5,7) + c(8,9,10)

# Subtraction
c(2,3,5,7) - c(-2,-3,-5,8)

c(12,13,15,17) - c(8,9)

# Different incompatible lengths - produces a warning
c(12,13,15,17) - c(8,9,10)

# Multiplication
c(2,3,5,7) * c(-2,-3,-5,8)

c(2,3,5,7) * c(8,9)

# Different incompatible lengths - produces a warning
c(2,3,5,7) * c(8,9,10)

# Division
c(24,20,8,16) / c(3,4,2,8)

c(24,20,8,16) / c(4,2)

# Different incompatible lengths - produces a warning
c(24,20,8,16) / c(4,2,8)


# --- Lecture 7: Assignment and Data Types ---

x <- 20
x = 20

y = x * 2
z = x + y

# Numbers and characters
x <- 20
x = 20

x = "apple"
x <- "apple1"
x = 'apple'
x <- 'apple'

# Numeric / character checks
x = 20
is.numeric(x)
is.character(x)

y = "apple"
is.character(y)
is.numeric(y)

# Converting number to character
x = 20
is.numeric(x)

y = as.character(x)
is.numeric(y)
is.character(y)
y

# Converting character to number
y = "apple"
is.numeric(y)
is.character(y)

z = as.numeric(y)
is.numeric(z)
is.character(z)
z

# Comments
# mu is the mean
# x <- 20 is treated as a comment only

# Case sensitivity
X <- 20
x <- 20

# Combining values into a vector
c(1,2,3,4,5)

# mode()
x = 6
x
mode(x)

y = "apple"
y
mode(y)

# storage.mode()
x = 6
storage.mode(x)

x = TRUE
storage.mode(x)

x = "apple"
storage.mode(x)

# Infinity
3/0
5 + Inf

x = 5 + Inf
is.finite(x)
is.infinite(x)


# --- Lecture 8: R as a Calculator ---

2 + 3
2 * 3

2 - 3
3 / 2
2 * 3 - 4 + 5 / 6

# BODMAS
(2+3)*5 + 5 - 10
(((2+3)*5 + 5) - 10) / 2

# Spaces do not affect calculations
2+5
2  +  5
2    +    5
2    +5

# Scalar and vector operations
c(2,3,5,7) + 10
c(12,13,15,17) - 10
c(2,3,5,7) * 10
c(12,13,15,17) / 10