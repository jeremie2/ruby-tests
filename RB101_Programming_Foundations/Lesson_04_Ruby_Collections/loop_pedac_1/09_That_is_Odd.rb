# The code below shows an example of a for loop. Modify the code so
# that it only outputs i if i is an odd number.
#
# for i in 1..100
#   puts i
# end


# PROBLEM
#
# we got a working for loop that print integers from 1 to 100
# we have to change it so that it prints only odd integers
# 
# output:
# - integers
# 
# rules:
# - only odd numbers must be printed

# EXAMPLE
# (result)
#
# 1
# 3
# 5
# 7
# ...
# 99

# DATA STRUCTURE
#
# iterable 1..100

# ALGORITHM
#
# - for loop with index 'i' that takes values from 1 to 100
#   - print 'i' if 'i' is odd number
# - end loop

# CODE

for i in 1..100
  puts i if i.odd?
end
