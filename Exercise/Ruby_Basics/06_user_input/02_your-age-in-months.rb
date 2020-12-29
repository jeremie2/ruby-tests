# Write a program that asks the user for their age in years,
# and then converts that age to months.
# 
# Examples:
# 
# $ ruby age.rb
# >> What is your age in years?
# 35
# You are 420 months old.


puts ">> What is your age in years?"
months = gets.to_i * 12
puts "You are #{months} months old."


# SOLUTION
# puts '>> What is your age in years?'
# age_in_years = gets
# age_in_months = 12 * age_in_years.to_i
# puts "You are #{age_in_months} months old."

# EXTRA
# What happens if you enter a non-numeric value for the age?
# ANSWER:
# In that case gets.to_i returns 0. Whatever I write the output
# of the program will be: "You are 0 months old."