=begin

Given a string that consists of some words (all lowercased) and
an assortment of non-alphabetic characters, write a method that
returns that string with all of the non-alphabetic characters
replaced by spaces. If one or more non-alphabetic characters
occur in a row, you should only have one space in the result (the
result should never have consecutive spaces).

Examples:

cleanup("---what's my +*& line?") == ' what s my line '

=end

ALFB = ('a'..'z').to_a

def cleanup(str)
  new_str = ''
  str.each_char do |ch|
    if ALFB.include?(ch)
      new_str << ch
    else
      new_str << ' '
    end
  end
  new_str.squeeze(' ')
end

p cleanup("---what's my +*& line?") == ' what s my line '
