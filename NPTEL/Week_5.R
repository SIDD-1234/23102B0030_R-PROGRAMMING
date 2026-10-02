x = NA
is.na(x)

x = c(11, NA, 13, NA)
is.na(x)

x = c(11,NA,13,NA)
mean(x)
mean(x, na.rm = TRUE)

# Location of missing values
x = c(11,NA,13,NA)
x
which(is.na(x))

# Count missing values
x = c(11,NA,13,NA)
x
sum(is.na(x))

# Complete cases
x = c(11,NA,13,NA)
x
complete.cases(x)

# Remove missing values
x = c(11,NA,13,NA)
x
y = na.omit(x)
y

# Mean after omitting missing values
x = c(11,NA,13,NA)
y = na.omit(x)
y
mean(x)
mean(y)


# --- if() ---

x = 5
if (x > 4) x * 3

x = 3
if (x > 4) x * 3

# Same using braces
x = 5
if (x > 4) {
  x * 3
}

x = 3
if (x > 4) {
  x * 3
}

# Print if value is more than 3
x = 6
if (x > 3) {
  print("The value is more than 3")
}

x = 2
if (x > 3) {
  print("The value is more than 3")
}


# --- if else() ---

x = 5
if (x == 3) {
  x = x - 1
} else {
  x = 2*x
}
x

x = 3
if (x == 3) {
  x = x - 1
} else {
  x = 2*x
}
x

x = 6
if (x > 3) {
  print("The value is more than 3")
} else {
  print("The value is less than 3")
}

x = 2
if (x > 3) {
  print("The value is more than 3")
} else {
  print("The value is less than 3")
}


# --- Nested if else if() ---

x = 5
if (x == 3) {
  x = x - 1
} else if (x < 3) {
  x = x + 5
} else {
  x = 2*x
}
x

x = 2
if (x == 3) {
  x = x - 1
} else if (x < 3) {
  x = x + 5
} else {
  x = 2*x
}
x

x = 3
if (x == 3) {
  x = x - 1
} else if (x < 3) {
  x = x + 5
} else {
  x = 2*x
}
x


# --- ifelse() ---

x = 1:10
x
ifelse(x < 6, x^2, x + 1)

x = c(7,9,8,4)
ifelse(x %% 2 == 0, "even number", "odd number")


# --- switch() ---

switch(2, "apple", "banana", "orange")
switch(1, "apple", "banana", "orange")

switch(
  "colour",
  "colour" = "blue",
  "gender" = "male",
  "volume" = 50
)

switch(
  "volume",
  "colour" = "blue",
  "gender" = "male",
  "volume" = 50
)

switch(4, "apple", "banana", "orange")

switch(
  "size",
  "colour" = "blue",
  "gender" = "male",
  "volume" = 50
)


# --- which() ---

x = c(10,15,8,14,6,12)
x
which(x == 14)
which(x != 12)
which(x > 10)

x = matrix(nrow=3, ncol=3, data=1:9)
x
which.min(x)
which.max(x)

x = matrix(nrow=3, ncol=3, data=1:9)
x
which(x %% 2 == 1)
which(x %% 2 == 1, arr.ind = TRUE)