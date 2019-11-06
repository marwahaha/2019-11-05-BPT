# Learning R
# ?barplot

# Part 1: Variables

weight_kg <- 55 # this makes a variable

weight_lb <- 2.2*weight_kg #makes another one
weight_lb <- 100 #changes weight_lb to 100

# Keyboard shortcuts in Tools menu
# <- with "Alt" then "minus sign"
apple <-  10

weight_kg <- 40
weight_kg

## Functions

round(3.4)

round(weight_kg)

## If you are done:
## try to figure out 
## how to round to 1 decimal point
?round

weight_kg <- 37.42
round(weight_kg, digits = 2)


## Challenge
# Make a new variable "height" 
#(in inches or centimeters, with a decimal pt)
# Round it to the nearest whole number
# And save it as a new variable
## As bonus: Round to the nearest "10s" place

height <- 52.4
rounded_height <- round(height)
rounded_height

round(height , digits = -1)


## Data Types

# Try running the below! What happens?
animal <- "mouse"
str(animal)
?str
class(animal)

str(weight_kg)

numbers <- c(1, 4, 18)
words <- c("hello", "kunal", "data")

str(numbers)
str(words)

length(words)

## Try making your own vector or list!
my_letters <- c("A", "B", "C")
## What happens here?
my_letters <- c(my_letters, "D")
my_letters
## Could be useful for headers!


# Subset vectors
my_letters[2]

# get the first and 3rd element
my_letters[c(1,3)]

## Challenge: 
## Get 2nd and 3rd element of "words" list

words[c(2,3)]
words[c(3,2)]


## Conditional subsetting

numbers

numbers > 10
greater_than_10 <- numbers > 10
numbers[greater_than_10]


## Challenge: Print the numbers less than 3
numbers < 3
numbers[numbers < 3] # this is a shortcut!

# Multiple conditions
# | for "or" (location by Enter)
# & for "and" (location by the 7)
numbers[numbers < 3 | numbers > 10]
