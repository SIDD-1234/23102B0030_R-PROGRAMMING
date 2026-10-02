# --- Lecture 40: Substitution and Replacement of Strings ---

y = "Number of participants: 25"
sub("25", "30", y)

y = "Mr. Singh is the smart one. Mr. Singh is funny, too."
y
sub("Mr. Singh", "Professor Jha", y)
gsub("Mr. Singh", "Professor Jha", y)
sub("Mr. Singh", "Professor Jha", y)

# grep() searches for matches
str = c("R Course", "exercises", "include examples of R language")
grep("ex", str, value=TRUE)
grep("ex", str, value=FALSE)

grep("R", str, ignore.case=FALSE, value=TRUE)
grep("R", str, ignore.case=TRUE, value=TRUE)
grep("R", str, ignore.case=TRUE, value=FALSE)
grep("R", str, ignore.case=FALSE, value=FALSE)

x = "R course 24.07.2021"
y = "Number of participants: 25"
c(x,y)
grep("our", c(x,y))

grep("Num", c(x,y))

# grepl() returns TRUE/FALSE for each element
str = c("R Course", "exercises", "include examples of R language")
grepl("R", str)
grepl("ex", str, value=TRUE)


# --- Lecture 41: Data Frames ---

library(MASS)
painters
rownames(painters)

is.numeric(painters$School)
is.numeric(painters$Drawing)

is.factor(painters$School)
is.factor(painters$Drawing)

colnames(painters)
summary(painters)


# --- Lecture 42: Data Frames - Creation and Operations ---
# Lecture 42 introduces the data frame example using MASS/painters.
# The operational examples continue in Lecture 43.
library(MASS)
painters


# --- Lecture 43: Data Frames - Some More Operations ---

summary(painters$School)

attach(painters)
summary(School)
summary(Composition)
detach(painters)

# After detach(), use painters$School again.
summary(painters$School)

subset(painters, School=='F')
painters[painters[["School"]] == "F", ]
subset(painters, Composition <= 6)
subset(painters, School=="F", select=c(-3,-5))

splitted = split(painters, painters$School)
splitted
is.data.frame(splitted$A)


# --- Lecture 44: Data Frames - Combining and Merging ---

# cbind() - combine columns side-by-side
df1=data.frame(state=c("UP", "MP", "AP", "JK"),
               popnsize=c(1000,2000,3000,4000))

df2=data.frame(state=c("UP", "MP", "AP", "JK"),
               samplesize=c(100,200,300,400),
               surveycompleted=c("Yes", "No", "Yes", "No"))

df1
df2
cbind(df1,df2)

# merge() - join data frames using a common column
merge(df1,df2,by="state")

# rbind() - stack data frames vertically
df11=data.frame(state=c("UP", "MP", "AP", "JK"),
                popnsize=c(1000,2000,3000,4000))

df22=data.frame(state=c("Bihar", "Delhi", "Punjab"),
                popnsize=c(100,200,300))

df11
df22
rbind(df11,df22)