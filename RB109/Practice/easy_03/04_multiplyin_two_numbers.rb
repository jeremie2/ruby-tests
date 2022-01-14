=begin

Create a method that takes two arguments, multiplies them together,
and returns the result.

Example:

  multiply(5, 3) == 15

## PEDAC

input: two numbers
mid section: multiply the given numbers and assign the result to `result` 
output: number (`result`)

algorithm:
- return the multiplication between the given numbers

=end

def multiply(num1, num2)
  num1 * num2
end

puts multiply(5, 3) == 15
