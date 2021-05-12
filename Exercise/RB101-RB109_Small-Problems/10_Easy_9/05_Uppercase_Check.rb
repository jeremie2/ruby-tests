# Write a method that takes a string argument, and returns true if all of the 
# alphabetic characters inside the string are uppercase, false otherwise. 
# Characters that are not alphabetic should be ignored.


#### ANSWER

def uppercase?(str)
  str =~ /[a-z]/ ? false : true
end

puts uppercase?('t') == false
puts uppercase?('T') == true
puts uppercase?('Four Score') == false
puts uppercase?('FOUR SCORE') == true
puts uppercase?('4SCORE!') == true
puts uppercase?('') == true


#### SOLUTION

def uppercase?(string)
  string == string.upcase
end


#### from user AMAN BAL

def uppercase?(string)
  !(string =~ /[a-z]/)
end


#### FURTHER EXPLORATION
# 
# Food for thought: in our examples, we show that uppercase? should return true if 
# the argument is an empty string. Would it make sense to return false instead? Why 
# or why not?

#### ANSWER

# The condition is that downcase characters make #uppercase? return 'false'.
# Any other condition it's fine, then an empty string returning 'true' is fine.
