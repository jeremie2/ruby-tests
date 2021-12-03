=begin

Write a program that asks the user to enter an integer greater than 0,
then asks if the user wants to determine the sum or product of all
numbers between 1 and the entered integer.

Examples:

  >> Please enter an integer greater than 0:
  5
  >> Enter 's' to compute the sum, 'p' to compute the product.
  s
  The sum of the integers between 1 and 5 is 15.

  >> Please enter an integer greater than 0:
  6
  >> Enter 's' to compute the sum, 'p' to compute the product.
  p
  The product of the integers between 1 and 6 is 720.

::::::::::::::::: PEDAC

input:
- string that needs to be converted into integer
- char between 's' and 'p'
mid section:
- result of the sum or the product of all the numbers between 1
  and the given integer
output:
- string that shows the previous result

data structure:
- range: (1..given_number)

algorithm:
- print a string asking to enter a integer
- convert to integer the user's output and assign it to `num`
- print a string asking to enter `s` (sum) or `p` (product) and
  assign it to `choice`
- if `choice` is equal `s`
  - set `operation` equal to `sum`
  - perform a loop that return the sum between 1 and `num` and assign
  it to `result`
- else
  - set `operation` equal to `product`
  - perform a loop that return the product between 1 and `num`
  and assign it to `result`
- print a string that state: "The `operation` of the integers
  between 1 and `num` is `result`."
=end

# def sum_or_prod_1_to_num
#   puts ">> Please enter an integer greater than 0:"
#   num = gets.to_i

#   puts ">> Enter 's' to compute the sum, 'p' to compute the product."
#   choice = gets.chomp

#   if choice.downcase == 's'
#     operation = 'sum'
#     result = (1..num).reduce(:+)
#   else
#     operation = 'product'
#     result = (1..num).reduce(:*)
#   end

#   puts "The #{operation} of the integers between 1 and #{num} is #{result}."
# end

# sum_or_prod_1_to_num

# ::::::::::::::::: REFACTORING AND DATA VALIDATION

=begin

algorithm:
- set `num` equal to `nil`
- set `choice` equal to `nil`
- loop
  - print a string asking to enter a integer
  - assign the user's output and assign it to `num`
  - break if `num` is valid_number
  - print "`num` is not a valid number."
- end loop
- loop
  - print a string asking to enter `s` (sum) or `p` (product) and
    assign it to `choice`
  - break if `choice` is valid_char
  - print "`choice` is not a valid choice."
- end loop
- set `operation` equal `sum` if `choice` is equal `s` else set
  `operation` equal `product`
- set `result` equal to sum_or_prod_1_to_num(`num`, `choice`)
- print a string that state: "The `operation` of the integers
  between 1 and `num` is `result`."

# valid_number
- return true if `num` converted to integer and to string again is equal `num`

# valid_char
- return true if `choice` is equal `s` or `p`

# sum_or_prod_1_to_num(`num`, `choice`)
- if `choice` is equal `s`
  return sum between numbers from 1 up to `num`
- if `choice` is equal `p`
  return product between numbers from 1 up to `num`
=end

def valid_number(str)
  str == str.to_i.to_s
end

def valid_char(char)
  char == 's' || char == 'p'
end

def sum_or_prod_1_to_num(num, choice)
  choice == 's' ? (1..num.to_i).reduce(:+) : (1..num.to_i).reduce(:*)
end

num = nil
choice = nil

loop do
  puts ">> Please enter an integer greater than 0:"
  num = gets.chomp
  break if valid_number(num)
  puts ">> #{num} is not a valid number."
end

loop do
  puts ">> Enter 's' to compute the sum, 'p' to compute the product."
  choice = gets.chomp
  break if valid_char(choice)
  puts ">> #{choice} is not a valid choice."
end

operation = choice == 's' ? "sum" : "product"
result = sum_or_prod_1_to_num(num, choice)

puts "The #{operation} of the integers between 1 and #{num} is #{result}."
