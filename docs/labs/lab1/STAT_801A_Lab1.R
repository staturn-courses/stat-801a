# STAT 801A Lab 1: Introduction to R

# For more help, please see: https://r4ds.hadley.nz/
# Chapters 2,4,6,7,8

# Comments begin with #
# Section Labels can be created by pressing ctr + shift + r

# 1. BASIC OPERATIONS --------------------------------------------

2 + 2
10 - 3
6 * 4
20 / 5
2^3

# R is case-sensitive. A shortcut for <- is pressing alt + minus 
X <- 20
x <- 10
x
X


# 2. OBJECTS AND VARIABLES ----------------------------------------

hours_worked <- 15

hourly_wage <- 20

total_earnings <- hours_worked * hourly_wage

total_earnings


# 3. BASIC DATA TYPES ---------------------------------------------

age <- 25
name <- "Alex"
passed <- TRUE

class(age)
class(name)
class(passed)

# 4. VECTORS -------------------------------------------------------

scores <- c(82, 91, 76, 88, 95)

scores
length(scores)
sum(scores)
mean(scores)
median(scores)
max(scores)

# Indexing
scores[1]
scores[3]
scores[2:4]


# Replace a value
scores[3] <- 80
scores


# 5. LOGICAL COMPARISONS ------------------------------------------

scores > 80
scores >= 90
scores == 88
scores != 88


# 6. MISSING VALUES ------------------------------------------------

scores_missing <- c(82, 91, NA, 88, 95)

scores_missing
mean(scores_missing)
mean(scores_missing, na.rm = TRUE)
is.na(scores_missing)

# 7. FUNCTIONS AND ARGUMENTS --------------------------------------

sqrt(25)

round(3.14159, digits = 3)
round(3.14159, 2)

# 8. GETTING HELP --------------------------------------------------

?mean
help(mean)

#Google is your friend

# 9. DATA FRAMES ---------------------------------------------------

data(mtcars)

head(mtcars) 
str(mtcars)
nrow(mtcars)
ncol(mtcars)
names(mtcars)
summary(mtcars)

mtcars$mpg
mean(mtcars$mpg)


# 10. SELECTING OBSERVATIONS --------------------------------------

mtcars$mpg > 25
mtcars[mtcars$mpg > 25, ]

# data[ROWS, COLUMNS]
mtcars[5,2]
mtcars[mtcars$mpg > 25, c("mpg", "hp")]


# 11. CREATING A DATA FRAME ---------------------------------------

student_data <- data.frame(
  name = c("Anna", "Ben", "Carlos", "Dana", "Emily"),
  study_hours = c(4, 7, 3, 6, 5),
  quiz_score = c(78, 92, 71, 88, 84))

student_data


student_data$passed <- student_data$quiz_score >= 80
student_data

# 12. PACKAGES -----------------------------------------------------

# Packages allow us to use functions not in base R

# Install only once:
#install.packages("ggplot2")

library(ggplot2)


# 13. IMPORTING A CSV ---------------------------------------------

getwd()
#setwd()

# Base R can read CSV files:
student_data <- read.csv("Student_data.csv")

student_data








# PART 2. STUDENT PRACTICE ------------------------------------------------

# BASE R does not include a function to read excel files. 
# The function read_excel() from the readxl package works similarly to read.csv()

# 1. Install and load readxl



# 2. Import the cereal data "cereal.xlsx" and assign a logical name to it




# 3. EXPLORE INDIVIDUAL VARIABLES 

# What is the mean sugar content?



# What is the median fat content?



# What is the maximum sodium content?




# 4. LOGICAL COMPARISONS 

# How many cereals have 10 or more grams of sugar? Hint: the sum() function is useful here



# How many cereals have less than 3 grams of fat?




# 5. SELECTING OBSERVATIONS 

# Display all cereals with more than 15 grams of sugar.





# Display all cereals with more than 10 grams of sugar AND less than 3 grams of fat.
# Hint: the & symbol is useful here





# 6. CREATE A NEW VARIABLE 

# Create a variable called high_sodium where TRUE = 200 or more grams of sodium 
# and FALSE = less than 200 grams of sodium




# How many cereals are high sodium?




# 7. ADDITIONAL CHALLENGES

# Use ?table to figure out how many cereals are on each shelf.


# Use ?unique to find the unique values of the Shelf variable.


# Display all cereals with between 5 and 10 grams of sugar.


# What is the average sugar content of cereals on Shelf 1?


