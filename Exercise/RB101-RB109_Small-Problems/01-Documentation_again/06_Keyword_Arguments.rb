
############ Multiple Signatures

# What does this code print?

5.step(to: 10, by: 3) { |value| puts value }

##### ANSWER

# https://ruby-doc.org/core-2.7.0/Numeric.html#method-i-step
# after reading still a bit confuse...
# I finally run the code and discovered what happens whit this numeric method.
# - 5 is the base from which we start 
# - we increment by 3 before reaching 10
# - 1st iteration: value = 5 => 5 is printed
# - 2nd iteration: value = 5 + 3 => 8 is printed
# - then value = 8 + 3 = 11 => out of range.

5.step(to: 10, by: 3) { |value| puts value }
# 5
# 8
