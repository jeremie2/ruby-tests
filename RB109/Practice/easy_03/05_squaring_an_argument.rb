=begin

Using the multiply method from the "Multiplying Two Numbers" problem,
write a method that computes the square of its argument (the square
is the result of multiplying a number by itself).

Example:

  square(5) == 25
  square(-8) == 64

## PEDAC

input: number
output: number (given number by itself)

algorithm:
- return the multiplication of the given numbers by itself
  (use the previous #multiply method)

=end

# def multiply(n1, n2)
#   n1 * n2
# end

# def square(num)
#   multiply(num, num)
# end

# puts square(5) == 25
# puts square(-8) == 64

## FURTHER EXPLORATION
# What if we wanted to generalize this method to a "power to the n"
# type method: cubed, to the 4th power, to the 5th, etc. How would
# we go about doing so while still using the multiply method?

## SOME EXAMPLES

=begin
- set a default result when the exponent is 0 and 1
- set `exp` to track the exponent's value during the loops
- we set a total `tot` equal to `num` so that we can start a loop
  where each time `tot` will be equal `tot` * `num`
- `exp` get incremented by 1
- the loop ends when `exp` is greater than `pow`
=end

# def power_of_num(num, pow)
#   return 1 if pow == 0
#   return num if pow == 1
#   tot = num
#   exp = 2
#   while exp <= pow
#     tot *= num
#     exp += 1
#   end
#   tot
# end

## MORE VISUAL

# def power_of_num(num, pow)
#   return 1 if pow == 0
#   arr = [num] * pow
#   arr.inject(:*)
# end

## WITH MULTIPLY METHOD

def multiply(n1, n2)
  n1 * n2
end

def power_of_num(num, pow)
  return 1 if pow == 0
  return num if pow == 1
  result = num
  exp = 2
  loop do
    result = multiply(result, num)
    break if exp == pow
    exp += 1
  end
  result
end

puts power_of_num(5, 2) == 25
puts power_of_num(2, 3) == 8
puts power_of_num(2, 0) == 1
puts power_of_num(2, 1) == 2
