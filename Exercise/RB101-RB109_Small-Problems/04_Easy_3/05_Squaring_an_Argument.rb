# Using the multiply method from the "Multiplying Two Numbers" problem,
# write a method that computes the square of its argument (the square
# is the result of multiplying a number by itself).
# Example:

square(5) == 25
square(-8) == 64


######## ANSWER

def multiply(n1, n2)
  n1 * n2
end

def square(num)
  multiply(num, num)
end


######## EXTRA

# What if we wanted to generalize this method to a "power to the n" type
# method: cubed, to the 4th power, to the 5th, etc. How would we go about
# doing so while still using the multiply method?

#### ANSWER

def multiply(n1, n2)
  n1 * n2
end

def power_to_n(num, n)
  result = case n
  when 1
    num
  else
    multiply(num, multiply(num, n-1))
  end
  result
end


#### OTHER USERS

def multiply(n1, n2)
  n1 * n2
end

def power_of_n(n, power)
  result = 0
  if power == 1
    return n
  else 
    result = multiply(n, power_of_n(n, power -1))
  end
  result
end

#############

def power_of_n(n, power)
  result = 1
  power.times {result = multiply(n, result)}
  result
end

#############

def multiply(num1, num2)
  num1 * num2
end

def power(num, n)
  if n > 0
    multiply(num, power(num, n - 1))
  elsif n < 0
    n *= -1
    1 / (power(num, n).to_f)
  else # so if n == 0
    1
  end
end

#############

def multiply(a, b)
  a * b
end

def power(a, n)
  n == 0 ? 1 : multiply(a, power(a, n - 1))
end
