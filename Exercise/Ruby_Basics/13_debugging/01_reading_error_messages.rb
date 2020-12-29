# You come across the following code. What errors does it raise for
# the given examples and what exactly do the error messages mean?
# 
# def find_first_nonzero_among(numbers)
#   numbers.each do |n|
#     return n if n.nonzero?
#   end
# end
# 
# # Examples
# 
# find_first_nonzero_among(0, 0, 1, 0, 2, 0)
# find_first_nonzero_among(1)


def find_first_nonzero_among(numbers)
  numbers.each do |n|
    return n if n.nonzero?
  end
end


# Example 1
find_first_nonzero_among(0, 0, 1, 0, 2, 0)

# Example 2
find_first_nonzero_among(1)


# ANSWER:
#
# Example 1
#
# 01_reading_error_messages.rb:16:in `find_first_nonzero_among':
# wrong number of arguments (given 6, expected 1) (ArgumentError)
# ------------
# As reported in the error message the method take one argument
# like an array. But we give 6 numbers as parameters.
# 
# 
# Example 2
# 
# 01_reading_error_messages.rb:17:in `find_first_nonzero_among':
# undefined method `each' for 1:Integer (NoMethodError)
# ------------
# There is no 'each' method for integers. We shoud use an array
# as argument.
