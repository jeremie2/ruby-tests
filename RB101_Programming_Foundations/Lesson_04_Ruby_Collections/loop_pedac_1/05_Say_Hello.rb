# Modify the code below so "Hello!" is printed 5 times.
#
# say_hello = true
#
# while say_hello
#   puts 'Hello!'
#   say_hello = false
# end


# PROBLEM
#
# - change the loop iterations, from 1 to 5

# EXAMPLE
# (just printing a string)
#
# Hello!

# DATA STRUCTURE
#
# - No particular data structure, just printing a string

# ALGORITHM
#
# - set 'say_hello' = 'true'
# - set 'counter' = 0
# - start loop
#   - print a string
#   - add 1 to 'counter'
#   - set 'say_hello' = if 'counter' = 5
#   - print eventual error handling message
# - end loop

# CODE

say_hello = true
counter = 0

while say_hello
  puts 'Hello!'
  counter += 1
  say_hello = false if counter == 5
end
