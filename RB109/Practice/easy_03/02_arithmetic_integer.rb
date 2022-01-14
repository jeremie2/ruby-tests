=begin

Write a program that prompts the user for two positive integers, and
then prints the results of the following operations on those two numbers:
addition, subtraction, product, quotient, remainder, and power. Do not
worry about validating the input.

Example

==> Enter the first number:
23
==> Enter the second number:
17
==> 23 + 17 = 40
==> 23 - 17 = 6
==> 23 * 17 = 391
==> 23 / 17 = 1
==> 23 % 17 = 6
==> 23 ** 17 = 141050039560662968926103

input: two strings that has to be converted into integers
output: six strings reporting the following operations between the
        two numbers: + - * / % **

data-struct: just use numeric variables

algorithm:
- set `operations` as %w(+ - * / % **)
- print a string asking for a positive integer
- convert user's output into integer and assign it to `num1`
- print a string asking for the second positive integer
- convert user's output into integer and assign it to `num2`
- loop
  - iterate `operations` so that each element will used to print
    each operation like `==> #{num1} + #{num2}  = #{num1 + num2}`
    ## create a method for this
- end loop

=end

# operations = %w(+ - * / % **)

# def calc(op, n1, n2)
#   case op
#   when '+'
#     n1 + n2
#   when '-'
#     n1 - n2
#   when '*'
#     n1 * n2
#   when '/'
#     n1 / n2
#   when '%'
#     n1 % n2
#   when '**'
#     n1**n2
#   end
# end

# puts '==> Enter the first number:'
# num1 = gets.to_i
# puts '==> Enter the second number:'
# num2 = gets.to_i

# operations.each do |op|
#   puts "==> #{num1} #{op} #{num2} = #{calc(op, num1, num2)}"
# end

## SHORT VERSION WITH #inject

# operations = %w(+ - * / % **)

# puts '==> Enter the first number:'
# num1 = gets.to_i
# puts '==> Enter the second number:'
# num2 = gets.to_i

# operations.each do |op|
#   puts "==> #{num1} #{op} #{num2} = #{[num1, num2].inject(op)}"
# end

## MIXED WITH FLOAT AND FORMATTED RESULT

def calc(op, n1, n2)
  if n2 == 0 && (op == '/' || op == '%')
    "Can't divide by zero!"
  else
    [n1, n2].inject(op)
  end
end

def format_result(res)
  res - res.to_i == 0 ? res.to_i : res.round(2)
end

operations = %w(+ - * / % **)

puts '==> Enter the first number:'
num1 = gets.to_f
puts '==> Enter the second number:'
num2 = gets.to_f

operations.each do |op|
  result = calc(op, num1, num2)
  result = format_result(result) if result.class != String
  puts "==> #{num1} #{op} #{num2} = #{result}"
end
