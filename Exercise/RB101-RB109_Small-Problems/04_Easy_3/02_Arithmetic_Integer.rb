# Write a program that prompts the user for two positive integers, and
# then prints the results of the following operations on those two numbers:
# addition, subtraction, product, quotient, remainder, and power. Do not worry
# about validating the input.
# Example
#
# ==> Enter the first number:
# 23
# ==> Enter the second number:
# 17
# ==> 23 + 17 = 40
# ==> 23 - 17 = 6
# ==> 23 * 17 = 391
# ==> 23 / 17 = 1
# ==> 23 % 17 = 6
# ==> 23 ** 17 = 141050039560662968926103


######## ANSWER

# Trying to avoid long puts sequences I thought to use an each iteration.
# Just one problem.. how to convert strings like '+', '-', etc.. into operators?
# I could have used #reduce.. but in the meantime I found #public_send:

operators = %w(+ - * / % **)

puts '==> Enter the first number:'
n1 = gets.to_i

puts '==> Enter the second number:'
n2 = gets.to_i

operators.each { |op| puts "==> #{n1} #{op} #{n2} = #{n1.public_send(op, n2)}" }


######## FROM OTHER USERS

#### EVAL
# n1, n2 and operators are used as strings
# RUBOCOP => security risk!!!

operators = %w(+ - * / % **)

puts '==> Enter the first number:'
n1 = gets.chomp

puts '==> Enter the second number:'
n2 = gets.chomp

operators.each { |op| puts "#{n1} #{op} #{n2} = #{eval(n1 + op + n2)}" }


#### REDUCE

operators = %i(+ - * / % **)    # symbols

puts '==> Enter the first number:'
n1 = gets.to_i

puts '==> Enter the second number:'
n2 = gets.to_i

operators.each { |op| puts "#{n1} #{op} #{n2} = #{[n1, n2].reduce(&op)}" }


######## EXTRA

# What if we wanted to use floats instead of integers? How does this change
# this problem?

puts '==> Enter the first number:'
n1 = gets.to_f

puts '==> Enter the second number:'
n2 = gets.to_f
