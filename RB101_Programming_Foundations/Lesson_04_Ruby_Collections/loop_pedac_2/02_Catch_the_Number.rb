# Modify the following code so that the loop stops if number is equal
# to or between 0 and 10.
#
# loop do
#   number = rand(100)
#   puts number
# end


# PROBLEM
#
# rules:
# - stop looping if 'number' variable is >= 0 or <= 10


# EXAMPLE
#
# 99
# 21
# 8    # stop


# DATA STRUCTURE
#


# ALGORITHM
#
# - start loop
#   - set 'number' = random integer between 0 and 99
#   - print 'number'
#   - stop loop if 'number' variable is >= 0 or <= 10
# - end loop

# CODE

count = 1

loop do
  number = rand(100)
  puts number
  break if number < 11
  # break if number.between?(0, 10)
end
