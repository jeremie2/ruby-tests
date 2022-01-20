=begin

In the previous two exercises, you developed methods that convert simple
numeric strings to signed Integers. In this exercise and the next, you're
going to reverse those methods.

Write a method that takes a positive integer or zero, and converts it to
a string representation.

You may not use any of the standard conversion methods available in Ruby,
such as Integer#to_s, String(), Kernel#format, etc. Your method should do
this the old-fashioned way and construct the string by analyzing and
manipulating the number.

Examples

integer_to_string(4321) == '4321'
integer_to_string(0) == '0'
integer_to_string(5000) == '5000'

## PEDAC

input: integer
mid section: - build a hash for convertion digit to char
             - loop with % 10, % 100... to select each digit
output: string representation of the integer

data struct: - hash for conversion
             - string that collect chars converted from digits

321 % 10 = 1     # digit to be converted and
321 / 10 = 432   # repeat

algorithm:
- given a integer 'int'
- build a hash 'convers' for conversion digit => char
- set empty string 'str'
- loop
  - add to 'str' convers[int % 10]
  - set 'int' as 'int' / 10
  - exit loop if 'int' equal zero
- end loop
- return the reverse version of 'str'

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

puts integer_to_string(4321) == '4321'
puts integer_to_string(0) == '0'
puts integer_to_string(5000) == '5000'
