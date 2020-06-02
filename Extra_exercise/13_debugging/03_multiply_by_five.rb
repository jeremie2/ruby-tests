# When the user inputs 10, we expect the program to print The result
# is 50!, but that's not the output we see. Why not?
# 
# def multiply_by_five(n)
#   n * 5
# end
# 
# puts "Hello! Which number would you like to multiply by 5?"
# number = gets.chomp
# 
# puts "The result is #{multiply_by_five(number)}!"


def multiply_by_five(n)
  n * 5
end

puts "Hello! Which number would you like to multiply by 5?"
number = gets.chomp.to_i

puts "The result is #{multiply_by_five(number)}!"


# ANSWER:
# 
# The variable number is assigned to gets.chomp which return a string.
# To fix the problem we need to convert number to integer: 
# number = gets.chomp.to_i