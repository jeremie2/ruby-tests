# Build a program that displays when the user will retire and how many
# years she has to work till retirement.
# Example:
#
# What is your age? 30
# At what age would you like to retire? 70
#
# It's 2016. You will retire in 2056.
# You have only 40 years of work to go!

######## ANSWER

puts 'What is your age?'
age = gets.to_i

puts 'At what age would you like to retire?'
age_retire = gets.to_i

year = Time.now.year
remaining_time = age_retire - age
retire_year = year + remaining_time

puts "It's #{year}. You will retire in #{retire_year}."
puts "You have only #{remaining_time} years of work to go!"
