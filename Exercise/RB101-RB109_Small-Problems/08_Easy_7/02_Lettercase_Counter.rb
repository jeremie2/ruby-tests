# Write a method that takes a string, and then returns a hash that contains 3 
# entries: one represents the number of characters in the string that are lowercase 
# letters, one the number of characters that are uppercase letters, and one the 
# number of characters that are neither.

#### ANSWER

# input: string
# output: hash (n° ch lowercase,  n° ch uppercase,  n° ch others)

# WITH REGEX

def letter_case_count(str)
  hsh = { lowercase: 0, uppercase: 0, neither: 0 }
  hsh[:lowercase] = str.count "a-z"
  hsh[:uppercase] = str.count "A-Z"
  hsh[:neither] = str.count "^a-zA-Z"
  # hsh[:neither] = str.size - hsh[:lowercase] - hsh[:uppercase]
  hsh
end

# CLASSIC EACH - IF/ELSE

# def letter_case_count(str)
#   arr = str.chars
#   lowercase = ('a'..'z').to_a
#   uppercase = ('A'..'Z').to_a
#   hsh = { lowercase: 0, uppercase: 0, neither: 0 }

#   arr.each do |i|
#     if lowercase.include?(i)
#       hsh[:lowercase] += 1
#     elsif uppercase.include?(i)
#       hsh[:uppercase] += 1
#     else
#       hsh[:neither] += 1
#     end
#   end
#   hsh
# end


puts letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
puts letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
puts letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
puts letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

#### SOLUTION

UPPERCASE_CHARS = ('A'..'Z').to_a
LOWERCASE_CHARS = ('a'..'z').to_a

def letter_case_count(string)
  counts = { lowercase: 0, uppercase: 0, neither: 0 }

  string.chars.each do |char|
    if UPPERCASE_CHARS.include?(char)
      counts[:uppercase] += 1
    elsif LOWERCASE_CHARS.include?(char)
      counts[:lowercase] += 1
    else
      counts[:neither] += 1
    end
  end

  counts
end

# Solution 2

def letter_case_count(string)
  counts = {}
  characters = string.chars
  counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
  counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
  counts[:neither] = characters.count { |char| char =~ /[^A-Za-z]/ }
  counts
end
