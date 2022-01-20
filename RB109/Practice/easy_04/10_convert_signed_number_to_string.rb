=begin

In the previous exercise, you developed a method that converts
non-negative numbers to strings. In this exercise, you're going to
extend that method by adding the ability to represent negative numbers
as well.

Write a method that takes an integer, and converts it to a string
representation.

You may not use any of the standard conversion methods available in
Ruby, such as Integer#to_s, String(), Kernel#format, etc. You may,
however, use integer_to_string from the previous exercise.

Examples

signed_integer_to_string(4321) == '+4321'
signed_integer_to_string(-123) == '-123'
signed_integer_to_string(0) == '0'

=end

CONVERS = ('0'..'9').to_a

def integer_to_string(int)
  str = ''
  loop do
    str.prepend(CONVERS[int % 10])
    int /= 10
    break if int == 0
  end
  str
end

# def signed_integer_to_string(int)
#   return '0' if int == 0
#   sign = int < 0 ? '-' : '+'
#   int *= (-1) if int < 0
#   sign + integer_to_string(int)
# end

def signed_integer_to_string(int)
  return '0' if int == 0
  sign = if int < 0
           int *= (-1)
           '-'
         else
           '+'
         end
  sign + integer_to_string(int)
end

puts signed_integer_to_string(4321) == '+4321'
puts signed_integer_to_string(-123) == '-123'
puts signed_integer_to_string(0) == '0'
