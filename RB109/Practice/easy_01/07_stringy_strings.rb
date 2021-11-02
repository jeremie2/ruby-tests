=begin

Write a method that takes one argument, a positive integer, and returns
a string of alternating 1s and 0s, always starting with 1. The length of
the string should match the given integer.

Examples:

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

The tests above should print true.

::::::::::::::::: PEDAC

input: positive integer
output: string
- string made of alternate '1' and '0'
- always starting from 1
- string length must be equal given integer

data structure:
- use an array like this ['1', '0'] so that inside the algorithm
  the first element can be taken to build the output string
  reversing the array after selecting the first element

algorithm:
- given a positive integer `num`
- create array `bin` = ['1', '0']
- create a new empty string `str` 
- until `str` size is equal to `num`
  - append the first element of `bin`
  - revers `bin`
- return `str`
=end

def stringy(num)
  bin = %w(1 0)
  str = ''
  until str.size == num
    str << bin[0]
    bin.reverse!
  end
  str
end

## User Jason, clever solution returning a string slice:
# def stringy(number, start = 1)
#   ('01' * number)[start, number]
# end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

# ::::::::::::::::: Further Exploration

# Modify stringy so it takes an additional optional argument that defaults
# to 1. If the method is called with this argument set to 0, the method
# should return a String of alternating 0s and 1s, but starting with 0 instead
# of 1.

def stringy(num, first_el=1)
  bin = first_el == 0 ? %w(0 1) : %w(1 0)
  str = ''
  until str.size == num
    str << bin[0]
    bin.reverse!
  end
  str
end

puts stringy(6, 1) == '101010'
puts stringy(9, 1) == '101010101'
puts stringy(4, 1) == '1010'
puts stringy(7, 1) == '1010101'

puts stringy(6, 0) == '010101'
puts stringy(9, 0) == '010101010'
puts stringy(4, 0) == '0101'
puts stringy(7, 0) == '0101010'