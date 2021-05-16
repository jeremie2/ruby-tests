# In the previous exercise, we developed a recursive solution to calculating the nth 
# Fibonacci number. In a language that is not optimized for recursion, some (not all) 
# recursive methods can be extremely slow and require massive quantities of memory and/or 
# stack space.
# 
# Ruby does a reasonably good job of handling recursion, but it isn't designed for heavy 
# recursion; as a result, the Fibonacci solution is only useful up to about fibonacci(40). 
# With higher values of nth, the recursive solution is impractical. (Our tail recursive 
# solution did much better, but even that failed at around fibonacci(8200).)
# 
# Fortunately, every recursive method can be rewritten as a non-recursive (procedural) method.
# 
# Rewrite your recursive fibonacci method so that it computes its results without recursion.


#### ANSWER

# 1 => 1
# 2 => 1
# 3 => 1 + 1 = 2
# 4 => 2 + 1 = 3
# 5 => 3 + 2 = 5
# 6 => 5 + 3 = 8
# 7 => 8 + 5 = 13
# 8 => 13 + 8 = 21

# F(n) = F(n - 1) + F(n - 2) where n > 2

def fibonacci(n)
  if n < 3
    1
  else
    counter_1 = 1
    counter_2 = 1
    result = 0
    3.upto(n) do
      result = counter_1 + counter_2
      counter_1, counter_2 = result, counter_1
    end
    result
  end
end

puts fibonacci(20) == 6765
puts fibonacci(100) == 354224848179261915075
# fibonacci(100_001) # => 4202692702.....8285979669707537501   # 👍️


#### SOLUTION

def fibonacci(nth)
  first, last = [1, 1]
  3.upto(nth) do
    first, last = [last, first + last]
  end

  last
end
