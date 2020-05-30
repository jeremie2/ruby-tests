# What method could you use to find out if a Hash contains a
# specific value in it? Write a program to demonstrate this use.

fruit = { big_box: 'apple', small_box: 'orange' }

puts "Guess which fruit I have:"
which_fruit = gets.chomp

fruit.values.include?(which_fruit) ? puts("Yes!") :  puts("No") 
