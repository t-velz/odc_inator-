# Description  -------------------------------------------------------- ----
#this file will explain how to make your files more readable through 
#formatting your code correctly.
#the process of creating functions will also be explained, which makes 
#the code you write more efficient 


# * Formatting Guide -------------------------------------------------- ----

# use outlines ----

# Section ----

## Subsection ----

### Sub-subsection ----


# file names should always be meaningful and end in .R
# avoid use of spaces! or special characters
# do use numbers, letters and _ 
# decide to use or avoid capitalization, but never use caps to differentiate
# because some files systems are case insensitive but processes are not 

# good
bma_example.R
content_inator.R

# if files should be run in order prefix with 0 padded numbers, with gaps

05_rurl_get_inator.R
10_comment_inator.R
15_sentiment_inator.R


# variable and function names should be lowercase and _ should be used when 
# separating words
day_1 <- 5

# place spaces around operators such as <, >, =
day_1 = 5

# put spaces in front of left parenthesis, except when calling a function
if (day_5 = 5)
plot(x, y)

# always put a space after a comma, but never before
x[, 1]

# place a space after parenthesis that are used for function arguments
function(x) {
}

# curly braces, {}, define the most important hierarchy of R code
# an opening curly brace should not be placed on its own line, but a closing brace 
# should be on its own line
f <- function(){
  
}

# Good
if (y < 0 && debug) {
  message("y is negative")
}

if (y == 0) {
  if (x > 0) {
    log(x)
  } else {
    message("x is negative or zero")
  }
} else {
  y^x
}


# Bad
if (y < 0 && debug) {
  message("Y is negative")
}

if (y == 0)
{
  if (x > 0) {
    log(x)
  } else {
    message("x is negative or zero")
  }
} else { y ^ x }


# use two spaces to indent code, do not use tab 

# to increase the readability of your code, try to avoid making long lines of code:
# Good
do_something_very_complicated(
  something = "that",
  requires = many,
  arguments = "some of which may be long"
)

# Bad
do_something_very_complicated("that", requires, many, arguments,
                              "some of which may be long"
)

# avoid reusing names of common functions, such as mean()


# * Writing functions -------------------------------------------------------



# to get rid of multiple lines of code, and to avoid repeating yourself, 
# functions can be built
# it is important to remember that functions can be manipulated like other objects in R
# always document the functions you create
# functions take a set of inputs (arguments) and either produce an output or perform a task
# you can share functions you have written with other people, making it easy to collaborate 

# to declare a user-defined function, use the keyword "function"
# this is an example of the syntax of a basic function 

function_name <- function(parameters){
  function body 
}

# the function name is what will be used to call a function
# it should be explanatory, but also concise; usually a verb 

# function parameters are the variables inside of the parenthesis that will be set
# to actual values 

circumference <- function(r){
  2*pi*r
}
print(circumference(2))

# after defining the function, it was called with a value of 2 for the parameter, r

# the function body is a set of commands inside of the function

sum_two_nums <- function(x, y){
  x + y
}
print(sum_two_nums(1, 2))

# this function adds x and y, so x+y is inside of the curly brackets



# to further make your code more efficient, recursive functions can be used
# this just means that a function is called inside of another function 

factorial <- function(n) {
  if (n == 0 || n == 1) {
    return(1)  # Base case: factorial of 0 and 1 is 1
  } else {
    return(n * factorial(n - 1))  # Recursive case: n! = n * (n-1)!
  }
}

# the most common example is a factorial function

# if you write a function that returns many objects, they can be put into a list

sqrt_newton <- function(a,
                        init = 1,
                        eps = 0.01,
                        steps = 1){

    stopifnot(a >= 0)
    while(abs(init**2 - a) > eps){
        init <- 1/2 *(init + a/init)
        steps <- steps + 1
    }
    list(
      "result" = init,
      "steps" = steps
    )
}




