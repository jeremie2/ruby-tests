# Write a method that returns true if the string passed as an argument is a
# palindrome, false otherwise. A palindrome reads the same forward and backward.
# For this exercise, case matters as does punctuation and spaces.
# Examples:

palindrome?('madam') == true
palindrome?('Madam') == false          # (case matters)
palindrome?("madam i'm adam") == false # (all characters matter)
palindrome?('356653') == true

######## ANSWER

def palindrome?(word)
  word == word.reverse
end

#### BASIC EXAMPLE FROM ANOTHER USER

def palindrome?(str)
  front_index = 0
  end_index = str.length - 1
  while front_index < end_index
    return false if str[front_index] != str[end_index]
    front_index += 1
    end_index -= 1
  end
  true
end

######## EXTRA

# Write a method that determines whether an array is palindromic; that is, the
# element values appear in the same sequence both forwards and backwards in the
# array.

#### ANSWER

def palindrome?(array)
  array == array.reverse
end

puts palindrome?([1, 2, 1])               # => true
puts palindrome?(['cip', 'ciop', 'cip'])  # => true
puts palindrome?(['cft', 'ciop', 'cip'])  # => false


# Now write a method that determines whether an array or a string is
# palindromic; that is, write a method that can take either an array or a string
# argument, and determines whether that argument is a palindrome. You may not use
# an if, unless, or case statement or modifier.

#### ANSWER

def palindrome?(arr_or_string)
  arr_or_string == arr_or_string.reverse
end

puts palindrome?([1, 2, 1])                # => true
puts palindrome?(['cip', 'ciop', 'cip'])   # => true
puts palindrome?(['cft', 'ciop', 'cip'])   # => false
puts palindrome?('madam')                  # => true
puts palindrome?('Madam')                  # => false
puts palindrome?("madami'madam")           # => false
puts palindrome?('356653')                 # => true
