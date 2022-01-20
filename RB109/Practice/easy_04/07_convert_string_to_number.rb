=begin

The String#to_i method converts a string of numeric characters
(including an optional plus or minus sign) to an Integer. String#to_i
and the Integer constructor (Integer()) behave similarly. In this exercise,
you will create a method that does the same thing.

Write a method that takes a String of digits, and returns the appropriate
number as an integer. You may not use any of the methods mentioned above.

For now, do not worry about leading + or - signs, nor should you worry about
invalid characters; assume all characters will be numeric.

You may not use any of the standard conversion methods available in Ruby
to convert a string to a number, such as String#to_i, Integer(), etc. Your
method should do this the old-fashioned way and calculate the result by
analyzing the characters in the string.

Examples

string_to_integer('4321') == 4321
string_to_integer('570') == 570

## PEDAC

input: string of numerical character
mid section: - create an hash for characters conversion (str to int)
             - loop into string's characters to create the integer
               version of the number
output: integer (corresponding numerical representation of the given
                 numerical string)

data structure: hash conversion helper  {'0' => 0, '1' => 1,.... }

algorithm:
- given a string representation of a integer 'int_str'
- set 'convers' as hash like {'0' => 0, '1' => 1,.... } where keys are
  string representation of numeric characters and values are the effective
  integer value
- set empty array 'numbers'
- loop through 'int_str'
  - append convers[character] to 'numbers'
- end loop
- set 'num' equal zero
- set 'idx' equal -1
- set 'factor' equal 1
- loop through 'numbers' starting from last element
  - add to 'num' the current element multiplied by 'factor'
  - exit loop if 'numbers' size is equal 'idx' * (-1)
  - decrease 'idx' by -1
  - multiply factor by 10
- end loop
- return 'num'

=end

# CONVERS = { '0' => 0, '1' => 1, '2' => 2, 
#             '3' => 3, '4' => 4, '5' => 5, 
#             '6' => 6, '7' => 7, '8' => 8, '9' => 9 }

# def string_to_integer(int_str)

#   numbers = []
#   int_str.each_char { |el| numbers << CONVERS[el] }

#   num = 0
#   idx = -1
#   factor = 1
#   loop do
#     num += numbers[idx] * factor
#     break if numbers.size == idx * (-1)
#     idx -= 1
#     factor *= 10
#   end
#   num
# end

## shorter version

# CONVERS = { '0' => 0, '1' => 1, '2' => 2, 
#             '3' => 3, '4' => 4, '5' => 5, 
#             '6' => 6, '7' => 7, '8' => 8, '9' => 9 }

# def string_to_integer(int_str)

#   numbers = int_str.chars.map { |el| CONVERS[el] }

#   num = 0
#   factor = 1
#   numbers.reverse.each do |el|
#     num += el * factor
#     factor *= 10
#   end
#   num
# end

## more clever solution

DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

def string_to_integer(string)
  digits = string.chars.map { |char| DIGITS[char] }

  value = 0
  digits.each { |digit| value = 10 * value + digit }
  value
end

puts string_to_integer('4321') == 4321
puts string_to_integer('570') == 570
