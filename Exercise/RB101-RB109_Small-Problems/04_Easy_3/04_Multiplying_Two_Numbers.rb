# Create a method that takes two arguments, multiplies them together, and
# returns the result.
# Example:

multiply(5, 3) == 15


######## ANSWER

def multiply(x, y)
  x * y
end


######## EXTRA

# For fun: what happens if the first argument is an Array? What do you think
# is happening here?

#### ANSWER

# Trying to guess I thought that it could be that every element (if number)
# would have been multiplied for that number. 
# WRONG!
#
# The elements will be repeated:
["ciao "] * 3  # => ["ciao ", "ciao ", "ciao "]
[4, 5] * 3     # => [4, 5, 4, 5, 4, 5]
