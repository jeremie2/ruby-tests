# Write a method that takes one argument, a positive integer, and returns
# a list of the digits in the number.
# Examples:

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true

######## ANSWER

def digit_list(number)
  arr = number.to_s.split('')     # ex. 753 => ['7', '5', '3']
  arr.map { |elem| elem.to_i }
end

######## FROM SOLUTION

# The solution is based on more basic functionalities.
# Let's think we don't have powerful methods as #to_s.split.
# Knowing that we can't directly iterate all digits of a number,
# we have to find an alternative way...
#
# Just take an integer and divide it by 10:
# 753 : 10 = 75 and 3 as remainder (75,3) 
# We can now find a way to separate the reminder and add it to an array.
#
# To make things easier we can use Integer#divmod method:
# 12345.divmod(10) # => [1234, 5] it returns an array with result and
# remainder of an integer division.
# And here the method:

def digit_list(number)
  digits = []
  loop do
    number, remainder = number.divmod(10) # [1234, 5] = 12345.divmod(10)
    digits.unshift(remainder)             # digits = [5]
    break if number == 0
  end
  digits
end

# If we want to go more 'basic', instead #divmod we could use % operator
# and with the remainder build an array in the same way:
# 753 % 10 => 3
# then 753 : 10 => 75
# 75 % 10 => 5 ....and so on!

# Another example, this time much more short and similar to mine:

def digit_list(number)
  number.to_s.chars.map(&:to_i)
end

# I can't completely understand (&:to_i), but it looks that is basically
# doing what { |elem| elem.to_i } would do.
# The #to_i method is represented as a symbol next '&'.

######## OTHERS SOLUTIONS

# Will Fowls

def digit_list(number)
  number.digits.reverse
end

a = 735
a.digits = [5, 3, 7]
a.digits.reverse = [7, 3, 5]
