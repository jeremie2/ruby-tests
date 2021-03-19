# Using 'next', modify the code below so that it only prints even numbers.
#
# number = 0
#
# until number == 10
#   number += 1
#   puts number
# end


# PROBLEM
#
# output:
# - integers using an 'until' loop
#
# rules:
# - don't print odd numbers
# - skip odd numbers using 'next'


# EXAMPLE
# (result)
#
# 2
# 4
# 6
# 8
# 10


# DATA STRUCTURE
# 
# integers


# ALGORITHM
#
# - set 'number' = 0
# - until loop which stops if number == 10
#   - add 1 to 'number'
#   - skip if 'number' is odd
#   - print 'number'
# - end block


# CODE

number = 0

until number == 10
  number += 1
  next if number.odd?
  puts number
end
