# Look at the following programs...
# 
# x = 0
# 3.times do
#   x += 1
# end
# puts x
# 
# and...
# 
# y = 0
# 3.times do
#   y += 1
#   x = y
# end
# puts x
# 
# What does x print to the screen in each case? Do they both give errors?
# Are the errors different? Why?

## ANSWER

# First part: puts x → 3
# x has been defined out the times method block scope, then it can be read and changed
# from the inside of the scope.

# Second part: puts x → error message
# x has been defined inside times method block scope and it cannot be read from outside
