# The method below counts from 0 to 4. Modify the block so that it prints
# the current number and stops iterating when the current number equals 2.
#
# 5.times do |index|
#   # ...
# end


# PROBLEM
#
# output:
# - integers using a loop
#
# rules:
# - stop loop when current number = 2


# EXAMPLE
# (result)
#
# 0
# 1
# 2


# DATA STRUCTURE
# 
# 0..4 range


# ALGORITHM
#
# - set 'times' block that iterates 5 times
#   - print current number 'index'
#   - exit loop if 'index' = 2
# - end block


# CODE

5.times do |index|
  puts index
  break if index == 2
end
