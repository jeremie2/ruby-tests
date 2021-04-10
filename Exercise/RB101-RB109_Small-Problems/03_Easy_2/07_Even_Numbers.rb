# Print all even numbers from 1 to 99, inclusive, to the console, with
# each number on a separate line.

######## ANSWER

i = 2

while i < 100
  puts i
  i += 2
end

## ALTERNATIVE

(0..100).each {|i| puts i if i.even? }

######## SOLUTION

value = 1
while value <= 99
  puts value if value.even?
  value += 1
end
