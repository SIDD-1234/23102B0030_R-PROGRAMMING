# --- Lecture 43: Data Frames - Some More Operations ---
# Included here as it is present in the Week 11 notes as well.

library(MASS)
painters
summary(painters$School)

attach(painters)
summary(School)
summary(Composition)
detach(painters)

subset(painters, School=='F')
painters[painters[["School"]] == "F", ]
subset(painters, Composition <= 6)
subset(painters, School=="F", select=c(-3,-5))

splitted = split(painters, painters$School)
splitted
is.data.frame(splitted$A)


# --- Lecture 46: Importing and Reading Excel and Other Data Files ---

# Set working directory as shown in the notes
# setwd("C:/RCourse/")

# Install once if required:
# install.packages("readxl")
library(readxl)

read_excel("datafile.xlsx")
read_excel("datafile.xls")
read_excel(datasets, sheet_number)
read_excel(datasets, "sheet_name")

# Example Excel file from the notes
dataspexcel = read_excel("spexcel.xlsx", sheet=1)
dataspexcel

dataspexcel$`Variable 1`
dataspexcel$`Variable 2`
mean(dataspexcel$`Variable 1`)

dataspexcel2 = read_excel("spexcel.xlsx", sheet=2)
dataspexcel2

dataspexcel2$`Variable 4`
dataspexcel2$`Variable 5`
dataspexcel2$`Variable 6`
mean(dataspexcel2$`Variable 6`)

# Read a limited number of rows
read_excel(datasets, n_max=3)
dataspexcel4 = read_excel("spexcel.xlsx", n_max=3)
dataspexcel4

# Read from an Excel range
read_excel(datasets, range="C1:E7")
read_excel(datasets, range="R1C2:R2C5")

# SPSS data
# install.packages("foreign")
library(foreign)
data = read.spss("datafile.sav")

# HTML table data
# install.packages("XML")
library(XML)
data = readHTMLTable("filename")

# Other formats supported by foreign include:
# read.octave("<Path to file>")
# read.systat("<Path to file>")
# read.xport("<Path to file>")
# read.dta("<Path to file>")


# --- Lecture 47: Saving and Writing Data Files ---

x = c(1:100)
x
write(x, file="shalabh")

# CSV / tabular writing examples
write.csv(x, file="data.csv", append=FALSE)
write.table(x, file="data.txt", append=FALSE)

# Examples of important options from the notes:
# write.csv(x, file="data.csv", quote=TRUE, row.names=TRUE)
# write.table(x, file="data.txt", quote=TRUE, sep=" ",
#             row.names=TRUE, col.names=TRUE)


# --- Lecture 48: Introduction to Statistical Functions ---

# Absolute and relative frequencies
gender <- c(1, 2, 1, 2, 1, 1, 1, 2, 1, 1)
gender
table(gender)
table(gender)/length(gender)

# Pizza home delivery directions
direction = c(
  1,1,2,1,2,3,2,2,3,3,3,1,2,3,2,2,3,1,1,3,3,1,2,
  1,3,3,3,2,2,2,2,1,2,2,1,1,1,3,2,2,1,2,3,2,2,1,
  2,3,3,2,1,2,2,3,1,1,2,1,2,3,2,3,2,2,3,1,2,3,3,3,
  2,1,1,1,2,1,1,2,1,2,3,3,1,2,3,3,2,1,2,3,2,1,3,
  2,2,2,2,3,2,2
)

table(direction)
table(direction)/length(direction)

# Partition values / quantiles
marks = c(68, 82, 63, 86, 34, 96, 41, 89, 29,
          51, 75, 77, 56, 59, 42)

quantile(marks)
quantile(marks, probs=c(0,0.25,0.5,0.75,1))
quantile(marks, probs=c(0,0.20,0.4,0.6,0.8,1))


# --- Lecture 49: Graphics - Scatter Plot and Bar Plots ---

# Scatter plot data: heights of 50 persons
height = c(
  166,125,130,142,147,159,159,147,165,156,149,164,137,166,135,142,
  133,136,127,143,165,121,142,148,158,146,154,157,124,125,158,159,
  164,143,154,152,141,164,131,152,152,161,143,143,139,131,125,145,
  140,163
)

plot(height)
plot(height, col="red")

# Bar plots
gender = c(1, 2, 1, 2, 1, 1, 1, 2, 1, 1)
gender
barplot(gender)
table(gender)
barplot(table(gender))
table(gender)/length(gender)
barplot(table(gender)/length(gender))

# Direction data
barplot(direction)
barplot(table(direction))
barplot(table(direction)/length(direction))

# Bar plot formatting examples from the notes
barplot(table(direction), col=c("red", "green", "blue"))
barplot(table(direction), col=c("red", "green", "blue"),
        main="Directions of food delivery")
barplot(table(direction), col=c("red", "green", "blue"),
        main="Directions of food delivery",
        legend.text=c("dir1", "dir2", "dir3"))
barplot(table(direction), col=c("red", "green", "blue"),
        main="Directions of food delivery",
        legend.text=c("dir1", "dir2", "dir3"),
        sub="Three directions")
barplot(table(direction), col=c("red", "green", "blue"),
        main="Directions of food delivery",
        legend.text=c("dir1", "dir2", "dir3"),
        sub="Three directions",
        xlab="Food Delivery Directions",
        ylab="Number of Deliveries")