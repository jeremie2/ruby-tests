# Write a method that counts down to zero using recursion.

def to_zero(number)
  puts number
  if number > 0
    to_zero(number-1) 
  end
end


## SOLUTION
# def count_to_zero(number)
#   if number <= 0
#     puts number
#   else
#     puts number
#     count_to_zero(number-1)
#   end
# end