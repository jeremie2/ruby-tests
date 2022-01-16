=begin

Write another method that returns true if the string passed as an argument
is a palindrome, false otherwise. This time, however, your method should be
case-insensitive, and it should ignore all non-alphanumeric characters. If
you wish, you may simplify things by calling the palindrome? method you wrote
in the previous exercise.

Examples:

real_palindrome?('madam') == true
real_palindrome?('Madam') == true           # (case does not matter)
real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
real_palindrome?('356653') == true
real_palindrome?('356a653') == true
real_palindrome?('123ab321') == false

## PEDAC

input: string
mid section: - from given string sort out a "clean" version with no extra
               character a part of alphanumeric
             - make every character down case
output: boolean

algorithm:
- given a string `str`
- set `alphanum` as array with every character a-z0..9
- loop into each character and delete all character not included into `alphanum`
- use #palindrome? method to compare `new_str` to its reverse

=end

def palindrome?(str)
  str == str.reverse
end

def real_palindrome?(str)
  alphanum = ('A'..'z').to_a + ('0'..'9').to_a
  str.each_char { |ch| str.delete!(ch) if !alphanum.include?(ch) }.downcase!
  palindrome?(str.downcase)
end

puts real_palindrome?('madam') == true
puts real_palindrome?('Madam') == true           # (case does not matter)
puts real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
puts real_palindrome?('356653') == true
puts real_palindrome?('356a653') == true
puts real_palindrome?('123ab321') == false
