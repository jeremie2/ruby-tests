# The Fibonacci series is a sequence of numbers starting with 1 and 1 where each number is 
# the sum of the two previous numbers: the 3rd Fibonacci number is 
# 1 + 1 = 2, the 4th is 1 + 2 = 3, the 5th is 2 + 3 = 5, and so on. In mathematical terms:
# 
# F(1) = 1
# F(2) = 1
# F(n) = F(n - 1) + F(n - 2) where n > 2
# 
# Sequences like this translate naturally as "recursive" methods. A recursive method is one 
# in which the method calls itself. For example:
# 
# def sum(n)
#   return 1 if n == 1
#   n + sum(n - 1)
# end
# 
# sum is a recursive method that computes the sum of all integers between 1 and n.
# 
# Recursive methods have three primary qualities:
# 
# - They call themselves at least once.
# - They have a condition that stops the recursion (n == 1 above).
# - They use the result returned by themselves.
# 
# In the code above, sum calls itself once; it uses a condition of n == 1 to stop recursing; 
# and, n + sum(n - 1) uses the return value of the recursive call to compute a new return 
# value.
# 
# Write a recursive method that computes the nth Fibonacci number, where nth is an argument 
# to the method.
# 
# https://launchschool.com/posts/587959fd


#### ANSWER

def fibonacci(n)
  n < 3 ? 1 : fibonacci(n - 1) + fibonacci(n - 2)
end

puts fibonacci(1) == 1
puts fibonacci(2) == 1
puts fibonacci(3) == 2
puts fibonacci(4) == 3
puts fibonacci(5) == 5
puts fibonacci(12) == 144
puts fibonacci(20) == 6765


#### from DISCUSSION

# https://launchschool.com/posts/9f4c03bc#comment-53639
# https://launchschool.com/posts/8a6f4220
# https://launchschool.com/posts/587959fd#comment-54748
# https://medium.com/launch-school/recursive-fibonnaci-method-explained-d82215c5498e#.qxl7hr56e

# A Diversion
# 
# If you've worked with recursion before, you may be familiar with something called "tail 
# recursion." Without going into detail, tail recursion is a way to write recursive methods 
# so the language processor can optimize it better; this often leads to faster solutions, 
# and the ability to recurse more "deeply." The solutions are often harder to understand, 
# though.
# 
# A tail recursive solution for this exercise is:
# 
# def fibonacci_tail(nth, acc1, acc2)
#   if nth == 1
#     acc1
#   elsif nth == 2
#     acc2
#   else
#     fibonacci_tail(nth - 1, acc2, acc2 + acc1)
#   end
# end
# 
# def fibonacci(nth)
#   fibonacci_tail(nth, 1, 1)
# end
# 
# This solution is much faster than our original solution and can handle much larger nth 
# values. On the author's system, the first solution took so long to compute the 50th 
# Fibonacci number that the author gave up. The tail-recursive method returned results for 
# an nth value of 8000 almost instantly. It exceeded the available stack space when nth was 
# a bit larger than 8000.


#### from user IULIU POP

# This solution uses a form of memorization. The result of calculation is saved to an array 
# and reused, so it doesn't have to be computed twice.

series = [nil, 1, 1]

def fibonacci(nth, series)
  return series[nth] if series[nth]
  series[nth] = fibonacci(nth - 1, series) + fibonacci(nth - 2, series)
end

p fibonacci(12, series) == 144
