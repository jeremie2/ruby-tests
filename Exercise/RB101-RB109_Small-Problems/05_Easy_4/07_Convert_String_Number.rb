# The String#to_i method converts a string of numeric characters (including an 
# optional plus or minus sign) to an Integer. String#to_i and the Integer 
# constructor (Integer()) behave similarly. In this exercise, you will create a 
# method that does the same thing.
#
# Write a method that takes a String of digits, and returns the appropriate number 
# as an integer. You may not use any of the methods mentioned above.
#
# For now, do not worry about leading + or - signs, nor should you worry about 
# invalid characters; assume all characters will be numeric.
#
# You may not use any of the standard conversion methods available in Ruby to 
# convert a string to a number, such as String#to_i, Integer(), etc. Your method 
# should do this the old-fashioned way and calculate the result by analyzing the 
# characters in the string.
#
# Examples
#
# string_to_integer('4321') == 4321
# string_to_integer('570') == 570

#### ANSWER
# :(

#### SOLUTION

DIGITS = {
  '0' => 0, '1' => 1,
  '2' => 2, '3' => 3,
  '4' => 4, '5' => 5,
  '6' => 6, '7' => 7,
  '8' => 8, '9' => 9
}

def string_to_integer(string)
  digits = string.chars.map { |char| DIGITS[char] }

  value = 0
  digits.each { |digit| value = 10 * value + digit }
  value
end

# EXPLANATION EXAMPLE:
#
# string = '482'
# '482'.chars = ['4', '8', '2']
# ['4', '8', '2'].map { |ch| DIGITS[ch] } = [4, 8, 2] = digits
#
# val = 0
# [4, 8, 2].each do |digit|
#   val = (10 * val) + digit
# end
#
# val = 0
# val = (10 * 0)  + 4 = 4    # a way to return the first digit
# val = (10 * 4)  + 8 = 48   # 10*4 so that we can add 8 to 40
# val = (10 * 48) + 2 = 482  # 10*48     ''  ''  ''    2 to 480  


#### FURTHER EXPLORATION

# Write a hexadecimal_to_integer method that converts a string representing a 
# hexadecimal number to its integer value.
#
# Example:
# hexadecimal_to_integer('4D9f') == 19871

EXADIGITS = {
  '0' => 0,  '1' => 1,  '2' => 2,  '3' => 3,
  '4' => 4,  '5' => 5,  '6' => 6,  '7' => 7,
  '8' => 8,  '9' => 9,  'a' => 10, 'b' => 11,
  'c' => 12, 'd' => 13, 'e' => 14, 'f' => 15,
}

def hexadecimal_to_integer(string)
  digits = string.downcase.chars.map { |char| EXADIGITS[char] }

  value = 0
  digits.each { |digit| value = 16 * value + digit }
  value
end
