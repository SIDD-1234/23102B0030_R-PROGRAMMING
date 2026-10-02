# --- Lecture 2: Getting Help in R ---

?read.table

help.search("data input")

help("read.table")
help.start()

find("lowess")

apropos("lm")

# --- Worked examples / demonstrations ---

example(lm)

demo(persp)

demo(graphics)


# --- Lecture 3: Packages and Libraries ---

library(spatial)

library()

packageDescription("spatial")

library(help = spatial)

# Install packages
install.packages("boot")
install.packages("cluster")

# View installed packages
installed.packages()

# Remove a package
remove.packages("cluster")

# Update a package
update.packages("cluster")

# Unload a package
detach("package:cluster", unload = TRUE)