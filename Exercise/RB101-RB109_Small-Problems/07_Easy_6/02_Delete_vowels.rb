# Write a method that takes an array of strings, and returns an array of the same 
# string values, except with the vowels (a, e, i, o, u) removed.
# 
# Example:
# 
# remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
# remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
# remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

#### ANSWER

def remove_vowels(arr)
  arr.map { |str| str.gsub(/[aeiou]/i, '') }
end


puts remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
puts remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
puts remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']


#### SOLUTION

def remove_vowels(strings)
  strings.map { |string| string.delete('aeiouAEIOU') }
end
