# Write a program that asks the user whether they want the program to print
# "something", then print it if the user enters y. Otherwise, print nothing.
# 
# Examples:
# 
# $ ruby something.rb
# >> Do you want me to print something? (y/n)
# y
# something
# 
# $ ruby something.rb
# >> Do you want me to print something? (y/n)
# n
# 
# $ ruby something.rb
# >> Do you want me to print something? (y/n)
# help
# 
# What happens if you type Y (in uppercase) instead of y in response to the prompt?
# This is a bad user experience: when obtaining input from a user, you should almost
# always allow both uppercase and lowercase entries. Can you modify this program so
# that it prints "something" if the user enters Y or y?


puts '>> Do you want me to print something? (y/n)'
answer = gets.chomp.downcase
puts 'something' if answer == 'y'