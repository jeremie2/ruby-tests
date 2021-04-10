# In the previous exercise, you developed a method that converts simple numeric 
# strings to Integers. In this exercise, you're going to extend that method to work
# with signed numbers.
#
# Write a method that takes a String of digits, and returns the appropriate number 
# as an integer. The String may have a leading + or - sign; if the first character 
# is a +, your method should return a positive number; if it is a -, your method 
# should return a negative number. If no sign is given, you should return a 
# positive number.
#
# You may assume the string will always contain a valid number.
#
# You may not use any of the standard conversion methods available in Ruby, such as 
# String#to_i, Integer(), etc. You may, however, use the string_to_integer method 
# from the previous lesson.
#
# Examples
#
# string_to_signed_integer('4321') == 4321
# string_to_signed_integer('-570') == -570
# string_to_signed_integer('+100') == 100

#### ANSWER

DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

# def string_to_signed_integer(string)
#   string.delete!('+') if string[0] == '+'
#   if string[0] == '-'
#     minus = true
#     string.delete!('-')
#   end

#   digits = string.chars.map { |char| DIGITS[char] }

#   value = 0
#   digits.each { |digit| value = 10 * value + digit }

#   if minus
#     value * (-1)
#   else
#     value
#   end
# end

#### 2nd ATTEMPT

# Just watched the beginning of the solution and realized that I should have
# not changed the original string_to_integer method, but include it inside
# the new string_to_signed_integer method :P

def string_to_integer(string)
  digits = string.chars.map { |char| DIGITS[char] }

  value = 0
  digits.each { |digit| value = 10 * value + digit }
  value
end

def string_to_signed_integer(string)
  string.delete!('+') if string[0] == '+'
  if string[0] == '-'
    minus = true
    string.delete!('-')
  end

  if minus
    string_to_integer(string) * (-1)
  else
    string_to_integer(string)
  end
end


#### SOLUTION

def string_to_signed_integer(string)
  case string[0]
  when '-' then -string_to_integer(string[1..-1])
  when '+' then string_to_integer(string[1..-1])
  else          string_to_integer(string)
  end
end


#### FURTHER EXPLORATION

# In our solution, we call string[1..-1] twice, and call string_to_integer three 
# times. This is somewhat repetitive. Refactor our solution so it only makes these 
# two calls once each.

def string_to_signed_integer(string)
  if string[0] == '-' || string[0] == '+'
    result = string_to_integer(string[1..-1]
  else
    result = string_to_integer(string)
  end

  return -result if string[0] == '-'
  result
end

#### NICE SOLUTION BY Stephen Gontzes

def string_to_signed_integer(str)
  sign = str[0] == '-' ? -1 : 1
  str = str.delete("+-")
  string_to_integer(str) * sign
end
