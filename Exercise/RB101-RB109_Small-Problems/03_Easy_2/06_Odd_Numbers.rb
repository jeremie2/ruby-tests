# Print all odd numbers from 1 to 99, inclusive, to the console,
# with each number on a separate line.

######## ANSWER

(1..99).each { |i| puts i if i.odd? }

######## SOLUTION

value = 1
while value <= 99
  puts value
  value += 2
end

######## EXTRA

# Repeat this exercise with a technique different from the one you just used,
# and different from the solution shown above. You may want to explore the use
# Integer#upto or Array#select methods, or maybe use Integer#odd?

# #select return an array of elements that follow the condition
puts (1..99).select { |i| i % 2 != 0 }

1.upto(99) { |i| puts i if i % 2 != 0 }
