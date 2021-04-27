# Given a string that consists of some words (all lowercased) and an assortment of 
# non-alphabetic characters, write a method that returns that string with all of 
# the non-alphabetic characters replaced by spaces. If one or more non-alphabetic 
# characters occur in a row, you should only have one space in the result (the 
# result should never have consecutive spaces).
#
# Examples:
#
# cleanup("---what's my +*& line?") == ' what s my line '

##### ANSWER

def cleanup(string)
  alphab = ('a'...'z').to_a
  array = string.chars.map do |char|
    if alphab.include?(char)
      char
    else
      ' '
    end
  end
  array.join.squeeze(' ')
end


puts cleanup("---what's my +*& line?") == ' what s my line '


##### SOLUTION 1

ALPHABET = ('a'..'z').to_a

def cleanup(text)
  clean_chars = []

  text.chars.each do |char|
    if ALPHABET.include?(char)
      clean_chars << char
    else
      clean_chars << ' ' unless clean_chars.last == ' '
    end
  end

  clean_chars.join
end


##### SOLUTION 2

def cleanup(text)
  text.gsub(/[^a-z]/i, ' ').squeeze(' ')
end
