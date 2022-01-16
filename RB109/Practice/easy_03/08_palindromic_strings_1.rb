=begin

Write a method that returns true if the string passed as an argument
is a palindrome, false otherwise. A palindrome reads the same forward
and backward. For this exercise, case matters as does punctuation and
spaces.

Examples:

palindrome?('madam') == true
palindrome?('Madam') == false          # (case matters)
palindrome?("madam i'm adam") == false # (all characters matter)
palindrome?('356653') == true

## PEDAC

input: string
mid section: check whether the string and its revers are equal
output: boolean

data-structure: an empty string could be requested to store in reverse
                order the character of the given string

algorithm:
- given a string `str`
- set `new_str` as empty string
- loop through `str` character
  - prepend each character to `new_str`
- end loop
- compare `str` and `new_str`

=end

# def palindrome?(str)
#   new_str = ''
#   str.each_char { |ch| new_str.prepend(ch) }
#   str == new_str
# end

## shorter

def palindrome?(str)
  str == str.reverse
end

puts palindrome?('madam') == true
puts palindrome?('Madam') == false          # (case matters)
puts palindrome?("madam i'm adam") == false # (all characters matter)
puts palindrome?('356653') == true
