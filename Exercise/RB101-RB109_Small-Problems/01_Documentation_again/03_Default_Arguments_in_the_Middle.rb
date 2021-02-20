
############ Default Arguments in the Middle

# Consider the following method and a call to that method:

def my_method(a, b = 2, c = 3, d)
  p [a, b, c, d]
end

my_method(4, 5, 6)

# Use the ruby documentation to determine what this code will print.

##### ANSWER

# Couldn't find a specific page in the documentation.
# I tried to understand the behavior playing with pry.

my_method
# or
my_method(4)  # => ArgumentError: wrong number of arguments
# the method expects 2..4 arguments.

my_method(4, 5)     # => [4, 2, 3, 5]
my_method(4, 5, 6)  # => [4, 5, 3, 6]
# When arguments are less than 4, they will be distributed in smart way.
# If there are enough arguments to cover the ones that have no default
# values, they will used for them from left to right.
# If there are more arguments, while assigning values from left to right,
# also parameters with default will get a new value as long there are
# enough values to cover the remaining parameters without default values.

##### FROM SOLUTION

# https://ruby-doc.org/core-2.7.1/doc/syntax/calling_methods_rdoc.html#label-Default+Positional+Arguments

# I could have just googled the method example!! :P

# The solution is suggesting not use this way (assigning with default
# values in the middle). It can be tricky.  
