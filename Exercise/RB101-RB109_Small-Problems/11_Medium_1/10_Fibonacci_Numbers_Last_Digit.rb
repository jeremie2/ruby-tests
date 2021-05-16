# In the previous exercise, we developed a procedural method for computing the value of the 
# nth Fibonacci numbers. This method was really fast, computing the 20899 digit 100,001st 
# Fibonacci sequence almost instantly.
# 
# In this exercise, you are going to compute a method that returns the last digit of the nth 
# Fibonacci number.


#### ANSWER

def fibonacci_last(nth)
  first, last = [1, 1]
  3.upto(nth) do
    first, last = [last, first + last]
  end

  last.to_s[-1].to_i
end


puts fibonacci_last(15) == 0   # -> 0  (the 15th Fibonacci number is 610)
puts fibonacci_last(20) == 5   # -> 5 (the 20th Fibonacci number is 6765)
puts fibonacci_last(100) == 5  # -> 5 (the 100th Fibonacci number is 354224848179261915075)
puts fibonacci_last(100_001) == 1    # -> 1 (this is a 20899 digit number)
puts fibonacci_last(1_000_007) == 3  # -> 3 (this is a 208989 digit number)
# puts fibonacci_last(123456789) == 4  # -> 4   TOO LONG


#### SOLUTION

# Part 1

def fibonacci_last(nth)
  fibonacci(nth).to_s[-1].to_i
end

# Part 2

def fibonacci_last(nth)
  last_2 = [1, 1]
  3.upto(nth) do
    last_2 = [last_2.last, (last_2.first + last_2.last) % 10]
  end

  last_2.last
end

# STILL TOO LONG WITH '123456789'


#### Further Exploration

# After a while, even this method starts to take too long to compute results. Can you provide 
# a solution to this problem that will work no matter how big the number? You should be able 
# to return results almost instantly. For example, the 123,456,789,987,745th Fibonacci number 
# ends in 5.

#### from user ANTONIO SERNA

# There's a trick. After 60 iterations the first digit sequence repaet itself:
# https://www.jain108.com/fibonacci-60-code/

FIB_PATTERN = '011235831459437077415617853819099875279651673033695493257291'

def fibonacci_last(number)
  nth_position = number % 60

  FIB_PATTERN[nth_position]
end

fibonacci_last(123_456_789_987_745) # -> 5
