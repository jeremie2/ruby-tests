# Write a loop that prints numbers 1-5 and whether the number is even or odd.
# Use the code below to get started.
#
# count = 1
#
# loop do
#   count += 1
# end
#
# Expected output:
#
# 1 is odd!
# 2 is even!
# 3 is odd!
# 4 is even!
# 5 is odd!


# PROBLEM
#
# input:
# - integer
# output:
# - strings
# 
# rules:
# - use a 'loop do' to iterate through 1..5

# EXAMPLE
# (result)
#
# 1 is odd!
# 2 is even!
# 3 is odd!
# 4 is even!
# 5 is odd!

# DATA STRUCTURE
#
# count = 1
#
# The output sting is in the form:
#   '1 is odd!'
#
# It will be useful to use string interpolation: "#{count}1 is odd!"

# ALGORITHM
#
# - set 'count' as integer variable
# - start loop
#   - if 'count' is odd
#     - print 'count is odd'
#   - else
#     - print 'count is even'
#   - end if
#   - exit loop if count = 5
#   - count = count + 1
# - end loop

# CODE

count = 1

loop do
  if count.odd?
    puts "#{count} is odd!"
  else
    puts "#{count} is even!"   
  end
  break if count == 5
  count += 1
end
