# A double number is a number with an even number of digits whose left-side digits 
# are exactly the same as its right-side digits. For example, 44, 3333, 103103, 
# 7676 are all double numbers. 444, 334433, and 107 are not.
# 
# Write a method that returns 2 times the number provided as an argument, unless 
# the argument is a double number; double numbers should be returned as-is.


#### ANSWER

def twice(num)
  num_str = num.to_s
  mid = num_str.size / 2
  num_left = num_str[0..mid - 1]
  num_right = num_str[mid..-1]

  return num if num_str.size > 1 && num_left == num_right
  num * 2
end

puts twice(37) == 74
puts twice(44) == 44
puts twice(334433) == 668866
puts twice(444) == 888
puts twice(107) == 214
puts twice(103103) == 103103
puts twice(3333) == 3333
puts twice(7676) == 7676
puts twice(123_456_789_123_456_789) == 123_456_789_123_456_789
puts twice(5) == 10


#### from user EISENCHTETER ALEXANDRE

def twice(number)
  return number * 2 if number.digits.size.odd?
  digits = number.digits.reverse
  middle = number.digits.size / 2
  digits[0, middle] == digits[middle, middle] ? number : number * 2
end

#### from user PIERRE-EMMANUEL ROUSSEL

def twice(num)
  first, second = num.divmod(10**(num.to_s.size / 2))
  first == second ? num : num * 2
end
