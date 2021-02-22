# Write a program that asks the user to enter an integer greater than 0, then
# asks if the user wants to determine the sum or product of all numbers between
# 1 and the entered integer.
# Examples:
#
# >> Please enter an integer greater than 0:
# 5
# >> Enter 's' to compute the sum, 'p' to compute the product.
# s
# The sum of the integers between 1 and 5 is 15.


# >> Please enter an integer greater than 0:
# 6
# >> Enter 's' to compute the sum, 'p' to compute the product.
# p
# The product of the integers between 1 and 6 is 720.

######## ANSWER

## WITH NO CHECKS

puts '>> Please enter an integer greater than 0:'
integer = gets.to_i

puts ">> Enter 's' to compute the sum, 'p' to compute the product."
operation = gets.chomp

operation = operation == 's' ? 'sum' : 'product'

if operation == 'sum'
  result = (1..integer).sum
else
  result = (1..integer).reduce(:*)
end

puts ">> The #{operation} of the integers between 1 and #{integer} is #{result}."


## WITH CHECKS AND PROMPT FUNCTIONS 

def prompt(string)
  puts ">> #{string}"
end

def valid_number?(num)
  num.to_i.to_s == num && num.to_i > 0
end

def valid_operation?(string)
  string == 's' || string == 'p'
end

integer = ''
loop do
  prompt('Please enter an integer greater than 0:')
  integer = gets.chomp
  if valid_number?(integer)
    integer = integer.to_i
    break
  end
  prompt('Not a valid number.')
end

operation = ''
loop do
  prompt("Enter 's' to compute the sum, 'p' to compute the product.")
  operation = gets.chomp.downcase
  if valid_operation?(operation)
    operation = operation == 's' ? 'sum' : 'product'
    break
  end
  prompt('Not a valid operation.')
end

if operation == 'sum'
  result = (1..integer).sum if operation == 'sum'
else
  result = (1..integer).reduce(:*)
end

prompt("The #{operation} of the integers between 1 and #{integer} is #{result}.")


######## SOLUTION

def compute_sum(number)
  total = 0
  1.upto(number) { |value| total += value }
  total
end

def compute_product(number)
  total = 1
  1.upto(number) { |value| total *= value }
  total
end

puts ">> Please enter an integer greater than 0"
number = gets.chomp.to_i

puts ">> Enter 's' to compute the sum, 'p' to compute the product."
operation = gets.chomp

if operation == 's'
  sum = compute_sum(number)
  puts "The sum of the integers between 1 and #{number} is #{sum}."
elsif operation == 'p'
  product = compute_product(number)
  puts "The product of the integers between 1 and #{number} is #{product}."
else
  puts "Oops. Unknown operation."
end
