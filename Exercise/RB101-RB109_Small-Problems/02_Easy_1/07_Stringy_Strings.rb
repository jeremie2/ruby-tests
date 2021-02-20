# Write a method that takes one argument, a positive integer, and returns
# a string of alternating 1s and 0s, always starting with 1. The length
# of the string should match the given integer.
# Examples:

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

# The tests above should print true.

######## ANSWER

def stringy(num)
  binary = ''
  num.times { |i| i.odd? ? (binary += '0') : (binary += '1') }
  binary
end

######## SOLUTION

def stringy(size)
  numbers = []

  size.times do |index|
    number = index.even? ? 1 : 0
    numbers << number
  end

  numbers.join
end

#### EXTRA

# Modify stringy so it takes an additional optional argument that defaults to 1.
# If the method is called with this argument set to 0, the method should return
# a String of alternating 0s and 1s, but starting with 0 instead of 1.

### MY EXAMPLE

def stringy(num, start_with=1)
  binary = ''
  if start_with == 1
    num.times { |i| i.odd? ? (binary += '0') : (binary += '1') }
  else
    num.times { |i| i.even? ? (binary += '0') : (binary += '1') }
  end
  binary
end

### SOLUTION EXAMPLE

def stringy(size, start_with=1)
  numbers = []

  size.times do |index|
    if start_with == 0
      number = index.odd? ? 1 : 0
    else
      number = index.even? ? 1 : 0
    end
    numbers << number
  end

  numbers.join
end
