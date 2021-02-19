
############ Included Modules

# Use irb to run the following code:

a = [5, 9, 3, 11]
puts a.min

# Find the documentation for the #min method and change the above code
# to print the two smallest values in the Array.

##### ANSWER

# https://ruby-doc.org/core-3.0.0/Enumerable.html#method-i-min
puts a.min(2)

# -Without argument just a number is returned.
# -With argument (n) an array of n elements is returned.
