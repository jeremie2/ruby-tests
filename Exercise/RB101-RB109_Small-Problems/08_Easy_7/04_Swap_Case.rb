# Write a method that takes a string as an argument and returns a new string in 
# which every uppercase letter is replaced by its lowercase version, and every 
# lowercase letter by its uppercase version. All other characters should be 
# unchanged.
# 
# You may not use String#swapcase; write your own version of this method.

#### ANSWER

def swapcase(str)
  arr = str.chars.map do |ch|
    if ch =~ /[a-z]/
      ch.upcase
    elsif ch =~ /[A-Z]/
      ch.downcase       
    else
      ch
    end
  end
  arr.join
end

puts swapcase('CamelCase') == 'cAMELcASE'
puts swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
