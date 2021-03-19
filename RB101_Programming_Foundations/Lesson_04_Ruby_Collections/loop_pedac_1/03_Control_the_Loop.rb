# Modify the following loop so it iterates 5 times instead of just once.
#
# iterations = 1
#
# loop do
#   puts "Number of iterations = #{iterations}"
#   break
# end


# PROBLEM
#
# - A loop is printing a string just one time.
# - We the loop printing the string 5 times

# Expected output:
#   Number of iterations = 1
#   Number of iterations = 2
#   ....
#   Number of iterations = 5

# EXAMPLE
#
# Result of the script:
#   Number of iterations = 1

# DATA STRUCTURE
#
# - No particular data structure, just a integer variable
#   that can be used as a loop parameter for the iteration

# ALGORITHM
#
# - start loop
#   - print the string
#   - exit loop if 'iteration' = 5
#   - increase 'iteration' by 1
# - end loop

# CODE

iterations = 1

loop do
  puts "Number of iterations = #{iterations}"
  break if iterations == 5
  iterations += 1
end
