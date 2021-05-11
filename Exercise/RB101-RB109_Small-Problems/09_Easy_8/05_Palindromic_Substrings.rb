# Write a method that returns a list of all substrings of a string that are 
# palindromic. That is, each substring must consist of the same sequence of 
# characters forwards as it does backwards. The return value should be arranged in 
# the same sequence as the substrings appear in the string. Duplicate palindromes 
# should be included multiple times.
# 
# You may (and should) use the substrings method you wrote in the previous 
# exercise.
# 
# For the purposes of this exercise, you should consider all characters and pay 
# attention to case; that is, "AbcbA" is a palindrome, but neither "Abcba" nor 
# "Abc-bA" are. In addition, assume that single characters are not palindromes.

#### ANSWER

# 'madam'
# 
# 'ma'     str[0, 2]
# 'mad'    str[0, 3]
# 'mada'   str[0, 4]
# 'madam'  str[0, 5]
# 
# 'adam'
# 
# 'ad'     str[1, 2]
# 'ada'    str[1, 3]
# 'adam'   str[1, 4]
# 
# 'dam'
# 
# 'da'     str[2, 2]
# 'dam'    str[2, 3]
# 
# 'am'
# 
# 'am'     str[3, 2]
# 
# initial character from 0 to 'str.size - 2'
# slice.size from 2 to slice.size


# LOOP 1:  0.upto(str.size - 2)
# We start from the first character of a string till str[-2]
# so that the last case is at least 2 character long.
# 
# LOOP 2:  2.upto(sub_str.size)
# This is going to set the size of a slice on each iteration.
# Slices are at least 2 character long till sub-string size.

def palindromes(str)
  palindr = []
  0.upto(str.size - 2) do |idx|
    sub_str = str[idx, str.size]
    2.upto(sub_str.size) do |i|
      slice = sub_str[0, i]
      palindr << slice if slice == slice.reverse
    end
  end
  palindr
end

puts palindromes('abcd') == []
puts palindromes('madam') == ['madam', 'ada']
puts palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
puts palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]


#### SOLUTION

def substrings(string)
  results = []
  (0...string.size).each do |start_index|
    this_substring = string[start_index..-1]
    results.concat(leading_substrings(this_substring))
  end
  results
end

def palindromes(string)
  all_substrings = substrings(string)
  results = []
  all_substrings.each do |substring|
    results << substring if palindrome?(substring)
  end
  results
end

def palindrome?(string)
  string == string.reverse && string.size > 1
end


#### FURTHER EXPLORATION

# Can you modify this method (and/or its predecessors) to ignore non-alphanumeric 
# characters and case? Alphanumeric characters are alphabetic characters(upper and 
# lowercase) and digits.

#### ANSWER

# To make things easier I write a #palindrome? method.

def palindrome?(str)
  str == str.reverse && !str.match?(/[^a-z0-9]/i)
end

def palindromes(str)
  palindr = []
  0.upto(str.size - 2) do |idx|
    sub_str = str[idx, str.size]
    2.upto(sub_str.size) do |i|
      slice = sub_str[0, i]
      palindr << slice if palindrome?(slice)
    end
  end
  palindr
end

# true
puts palindromes('abcd') == []

# true
puts palindromes('madam') == ['madam', 'ada']

# false
puts palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]

# true
puts palindromes('hello-madam-did-madam-goodbye') == [
  'll', 'madam', 'ada', 'did', 'madam', 'ada', 'oo'
]

# true
puts palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
