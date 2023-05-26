###this file will explain how to make code more readable and efficient 

#to get rid of multiple lines of code, and avoid repeating yourself, functions can be built
#it is important to remember that functions can be manipulated the same as any other object in R
#always document the functions you create
#functions take a set of inputs (arguments) and either produce an output or perform a task
#this is an example of a basic function 


function(arg, optional_arg = "TRUE") {
    result = arg + 3
    if (optional_arg){
        result = result + 1
    }

    return(result)
}

#you can share functions you have written with other people, making it easy to collaborate 

#to further make your code more efficient, recursive functions can be used
#this just means that a function is called inside of another function 

factorial <- function(n) {
  if (n == 0 || n == 1) {
    return(1)  # Base case: factorial of 0 and 1 is 1
  } else {
    return(n * factorial(n - 1))  # Recursive case: n! = n * (n-1)!
  }
}

#the most common example is a factorial function

#if you write a function that returns many objects, they can be put into a list

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

#lists can also hold objects of different types



#formatting 

#file names should always be meaningful 

#variable and function names should be lowercase and _ should be used when separating words
day_1 <- 5

#syntax
#place spaces around operators such as <, >, =

#put spaces in front of left parenthesis, except when calling a function
if ( )
plot(x, y)

#an opening curly brace should not be placed on its own line, but a closing brace should be on it own line

f <- function(){

}

#this makes it easy to see which opening and closing braces go together 

#use two spaces to indent code, do not use tab 






