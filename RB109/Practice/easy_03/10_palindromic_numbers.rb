=begin

Write a method that returns true if its integer argument is palindromic,
false otherwise. A palindromic number reads the same forwards and backwards.

Examples:

palindromic_number?(34543) == true
palindromic_number?(123210) == false
palindromic_number?(22) == true
palindromic_number?(5) == true

## PEDAC

input:integer
mid section: convert integer to string
output: boolean

algorithm:
- given `num` as integer
- convert `num` to string
- check whether the string is palindrome (with previous #palindrome?)

=end

def palindrome?(str)
  str == str.reverse
end

def palindromic_number?(num)
  palindrome?(num.to_s)
end

puts palindromic_number?(34543) == true
puts palindromic_number?(123210) == false
puts palindromic_number?(22) == true
puts palindromic_number?(5) == true
