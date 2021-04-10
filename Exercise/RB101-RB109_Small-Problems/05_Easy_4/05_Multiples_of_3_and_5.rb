# Write a method that searches for all multiples of 3 or 5 that lie between 1 and 
# some other number, and then computes the sum of those multiples. For instance, if 
# the supplied number is 20, the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 
# + 18 + 20).
#
# You may assume that the number passed in is an integer greater than 1.
#
# Examples
#
# multisum(3) == 3
# multisum(5) == 8
# multisum(10) == 33
# multisum(1000) == 234168

# def multisum(num)
#   tot = 0
#   (1..num).each do |n|
#     if n % 3 == 0 || n % 5 == 0
#       tot += n
#     end
#   end
#   tot
# end


# #### SOLUTION

# def multiple?(number, divisor)
#   number % divisor == 0
# end

# def multisum(max_value)
#   sum = 0
#   1.upto(max_value) do |number|
#     if multiple?(number, 3) || multiple?(number, 5)
#       sum += number
#     end
#   end
#   sum
# end

#### FURTHER EXPLORATION

# Investigate Enumerable.inject (also known as Enumerable.reduce), How might this 
# method be useful in solving this problem? (Note that Enumerable methods are 
# available when working with Arrays.) Try writing such a solution. Which is 
# clearer? Which is more succinct?

def multisum(num)
  array = []
  (1..num).each do |n|
    if n % 3 == 0 || n % 5 == 0
      array << n
    end
  end
  array.inject(:+)
  # array.sum      # easier
end
