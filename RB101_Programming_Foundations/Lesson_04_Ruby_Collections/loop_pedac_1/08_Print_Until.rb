# Given the array of several numbers below, use an until loop to
# print each number.
#
# numbers = [7, 9, 13, 25, 18]
#
# Expected output:
#
# 7
# 9
# 13
# 25
# 18


# PROBLEM
#
# input:
# - array of integers

# output:
# - integers
# 
# rules:
# - use 'until loop' to print the array elements

# EXAMPLE
# (result)
#
# 7
# 9
# 13
# 25
# 18

# DATA STRUCTURE
#
# numbers = [7, 9, 13, 25, 18]
#
# each number will be printed on each loop
# using element's index numbers[0], numbers[1]...

# ALGORITHM
#
# - set 'numbers' array of integers
# - set 'index' integer variable = 0
# - until loop with condition 'index' < 'numbers' length
#   - print 'numbers' element at index 'index'
#   - add 1 to 'index'
# - end loop

# CODE

numbers = [7, 9, 13, 25, 18]
idx = 0

until idx == numbers.length
  puts numbers[idx]
  idx += 1
end
