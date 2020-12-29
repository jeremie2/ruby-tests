# Modify the code below so "Hello!" is printed 5 times.
# 
# say_hello = true
# 
# while say_hello
#   puts 'Hello!'
#   say_hello = false
# end

say_hello = true
i = 1

while say_hello
  puts 'Hello!'
  say_hello = false if i == 5
  i += 1
end