list1 = list(1,2,3)
list2 = list("water", "juice", "lemonade")
list12 = c(list1, list2)
list12

unlist(list1)
unlist(list2)
mode(list1)
mode(unlist(list1))

append(list1, 100)
append(list2, "coffee")
append(list1, 100, after = 2)
append(list2, "coffee", after = 2)

list1 = list(1,2,3,4,5,6)
list2 = list("water", "juice", "lemonade", "tea", "coffee", "milk")
list1[-2]
list2[-1]
list1[2:4]
list1[c(1,3,5)]
list2[2:4]
list2[c(1,3,5)]

# --- Lecture 32: Vector Indexing ---
x = 1:10
x[(x > 5)]
x[(x %% 2 == 0)]
x[(x %% 2 == 1)]

x[5] = NA
y = x[!is.na(x)]
mean(x)
mean(y)

x = 1:10
x[-(1:5)]
x[6:10]

z = list(a1 = 1, a2 = "c", a3 = 1:3)
z
names(z)
names(z)[3] = "c2"
z

x = c(water=1, juice=2, lemonade=3)
names(x)
x["juice"]

x = 1:10
x[]

ab = list(1, 2, 3, "X", "Y", "Z")
dim(ab) = c(2,3)
print(ab)
mode(print(ab))

# --- Lecture 33: Factors ---
x = c(3, 4, 5, 6, 1, 2, 3, 3, 4, 4, 5, 6)
y = as.factor(x)
y

x = factor(c("lemonade", "lemonade", "juice", "lemonade", "water"))
x
help("factor")

y = c(1, 4, 3, 5, 4, 2, 4)
possible.dieface = c(1, 2, 3, 4, 5, 6)
labels.dieface = c("one", "two", "three", "four", "five", "six")
facy = factor(y, levels = possible.dieface, labels = labels.dieface)
facy

# --- Lecture 34: Factors - Class and Unclass ---
x = c(3, 4, 5, 6, 1, 2, 3, 3, 4, 4, 5, 6)
y = as.factor(x)
y

x = factor(c("lemonade", "lemonade", "juice", "lemonade", "water"))
x

class(9)
class("9")
class(print)
x = matrix(nrow=2, ncol=2, data=1:4)
class(x)

brands = c("A","A","B","B","B","B","C")
brands_fac = factor(brands)
brands_fac
unclass(brands_fac)

colours = c("blue", "green", "red")
colours[unclass(brands_fac)]

x = factor(c("lemonade", "lemonade", "juice", "lemonade", "water"))
unclass(x)

x = factor(c("lemonade", "lemonade", "juice", "lemonade", "water"),
           levels=c("water", "juice", "lemonade"))
x
unclass(x)
levels(x)

income = ordered(c("high", "high", "low", "medium", "medium"),
                 levels=c("low", "medium", "high"))
income
unclass(income)

# --- Lecture 35: Strings - Display and Formatting ---
print(sqrt(2))
print(sqrt(2), digits=5)
print(sqrt(2), digits=10)

print("apple")
print(c("apple", "banana"))
print(c("apple", "banana", 6, 10))

format(0.5)
print(format(0.5, digits=10, nsmall=15))

format(c("A", "BB", "CCC", "DDDD"), width=7, justify="centre")
format(c("A", "BB", "CCC", "DDDD"), width=14, justify="centre")
format(c("A", "BB", "CCC", "DDDD"), width=7, justify="left")
format(c("A", "BB", "CCC", "DDDD"), width=7, justify="right")
format(c("A", "BB", "CCC", "DDDD"), width=7, justify="none")

x = matrix(nrow=3, ncol=2, data=1:6, byrow=T)
print(x)

format(1234567, big.mark=",")
format(12345678, big.mark=",")
format(123456789, big.mark=",")
format(123456789, big.mark=" ")