# The code below is an example of a nested loop. Both loops currently loop
# infinitely. Modify the code so each loop stops after the first iteration.
#
# loop do
#   puts 'This is the outer loop.'
#
#   loop do
#     puts 'This is the inner loop.'
#   end
# end
#
# puts 'This is outside all loops.'


# PROBLEM
#
# A loop and a nested loop run infinitely.
# Stop both loops after first iteration.
#
# Expected output:
#   This is the outer loop.
#   This is the inner loop.
#   This is outside all loops.

# EXAMPLE
#
# Result of the script:
#   This is the outer loop.
#   This is the inner loop.
#   This is the inner loop.
#   This is the inner loop.
#   ....

# DATA STRUCTURE
#
# - 3 strings

# ALGORITHM
#
# - start outer loop
#   - print a given string
#     - start inner loop
#       - print a given string
#       - exit inner loop
#   - exit outer loop
# - end loop
# - print last string

# CODE

loop do
  puts 'This is the outer loop.'

  loop do
    puts 'This is the inner loop.'
    break
  end

  break
end

puts 'This is outside all loops.'
