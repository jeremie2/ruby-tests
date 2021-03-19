# Using a while loop, print 5 random numbers between 0 and 99. The code
# below shows an example of how to begin solving this exercise.
#
# numbers = []
#
# while <condition>
#   # ...
# end
#
# Example output (your numbers will most likely be different):
#
# 62
# 96
# 31
# 16
# 36


# PROBLEM
#
# Given an empty array, produce 5 random integer outputs.
#
# - Explicit requirements:
#   - Input: automatically generated with integer
#   - Output: 5 integers
# - Implicit requirements:
#   - The example shows an empty array called 'numbers'. This means that the
#     exercise expects us to store integers inside it.
# - Rules:
#   - 'numbers' array must be filled with 5 random integers.
#   - every number has to be printed

# EXAMPLE
# (a possible result)
#
# 62
# 96
# 31
# 16
# 36

# DATA STRUCTURE
#
# numbers = []
# will be populated like this
# [62, 96, 31, 16, 36]

# ALGORITHM
#
# - set 'numbers' empty array
# - while loop with condition 'numbers' length < 5
#   - add a random number from 0 to 99 to 'numbers'
# - end loop
# - print each element of 'numbers'

# CODE

numbers = []

while numbers.length < 5
  numbers << rand(0..99)
end

puts numbers
