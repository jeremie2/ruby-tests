# Given the array of several numbers below, use an until loop to print each number.
# 
# numbers = [7, 9, 13, 25, 18]
# 
# Expected output:
# 
# 7
# 9
# 13
# 25
# 18


numbers = [7, 9, 13, 25, 18]

# numbers.shift deletes the first element of the array!
# I just wanted to try a shorter version for the 'until loop'
# compare the solution.
until numbers.size == 0
  puts numbers.shift
end


## SOLUTION
# count = 0
# 
# until count == numbers.size
#   puts numbers[count]
#   count += 1
# end