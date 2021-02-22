# Build a program that randomly generates and prints Teddy's age. To get
# the age, you should generate a random number between 20 and 200.
# Example Output:
# 
# Teddy is 69 years old!

######## ANSWER

puts "Teddy is #{rand(20..200)} years old!"

######## SOLUTION

age = rand(20..200)
puts "Teddy is #{age} years old!"

######## EXTRA

# Modify this program to ask for a name, and then print the age for that person.
# For an extra challenge, use "Teddy" as the name if no name is entered.

def age_of(name='Teddy')
  "#{name} is #{rand(20..200)} years old!"
end

puts "Give me a name, I tell you the age!"
a_name = gets.chomp
puts age_of(a_name)
