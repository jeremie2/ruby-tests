# Write a method that takes two arguments, a string and a positive integer,
# and prints the string as many times as the integer indicates.
# Example:

repeat('Hello', 3)

# Output:
#
# Hello
# Hello
# Hello

######## ANSWER

def repeat(string, number)
  number.times { puts string }
end

# also:

def repeat(string, number)
  puts "#{string}\n" * number
end
