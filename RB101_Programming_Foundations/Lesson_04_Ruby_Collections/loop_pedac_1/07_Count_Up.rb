# The following code outputs a countdown from 10 to 1. Modify the code so
# that it counts from 1 to 10 instead.
#
# count = 10
#
# until count == 0
#   puts count
#   count -= 1
# end


# PROBLEM
#
# Reverse a loop: count from 1 to 10 instead of countdown 10 to 1
# Code is already existing, just need to work out different settings
# for 'count' variable.

# EXAMPLE
# (result)
#
# 1
# 2
# 3
# 4
# 5
# 6
# 7
# 8
# 9
# 10

# DATA STRUCTURE
#
# just printing integers

# ALGORITHM
#
# - set 'count' integer variable
# - until loop with condition 'count' > 10
#   - print 'count'
#   - add 1 to 'count'
# - end loop

# CODE

count = 1

until count > 10
  puts count
  count += 1
end
