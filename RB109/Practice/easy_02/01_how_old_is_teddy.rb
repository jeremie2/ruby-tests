=begin

Build a program that randomly generates and prints Teddy's age. To get the
age, you should generate a random number between 20 and 200.

Example Output

Teddy is 69 years old!

::::::::::::::::: PEDAC

input: -
output: integer (random between 20 and 200)

data structure:
- just use the given data

algorithm
- return a string with a random value between 20 and 200

=end

# def teddy_age
#   "Teddy is #{rand(20..200)} years old!"
# end

# puts teddy_age

=begin
::::::::::::::::: Further Exploration

Modify this program to ask for a name, and then print the age for that person.
For an extra challenge, use "Teddy" as the name if no name is entered.

=end

def teddy_age
  puts "What is the name names?"
  pet_name = gets.chomp
  pet_name = 'Teddy' if pet_name.empty?
  age = rand(20..200)
  "#{pet_name} is #{age} years old!"
end

puts teddy_age
