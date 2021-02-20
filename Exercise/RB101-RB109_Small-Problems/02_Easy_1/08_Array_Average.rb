# Write a method that takes one argument, an array containing integers, and
# returns the average of all numbers in the array. The array will never be
# empty and the numbers will always be positive integers. Your result should
# also be an integer.
# Examples:

puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

# The tests above should print true.

######## ANSWER

def average(arr)
  sum = 0
  arr.each { |i| sum += i }
  sum / arr.size
end

# or faster:

def average(arr)
  arr.sum / arr.size
end

######## SOLUTION

def average(numbers)
  sum = numbers.reduce { |sum, number| sum + number }
  sum / numbers.count
end

#### EXTRA

# Currently, the return value of average is an Integer. When dividing numbers,
# sometimes the quotient isn't a whole number, therefore, it might make more
# sense to return a Float. Can you change the return value of average from an
# Integer to a Float?

def average(arr)
  arr.sum / arr.size.to_f
end
