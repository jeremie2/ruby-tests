=begin

Build a program that displays when the user will retire and how many years
she has to work till retirement.

Example:

  What is your age? 30
  At what age would you like to retire? 70

  It's 2016. You will retire in 2056.
  You have only 40 years of work to go!

Hint:
Use the Time class from the ruby core library.

::::::::::::::::: PEDAC

input: user age and retirement age, given as string. They need to be
       converted into integers.
mid section: three integers need to be sorted out (current year,
             retirement year, years of work)
output: string representation with current year, retirement year and
        years of work

data structure:
- just use the given data to sort out new variables

algorithm:
- print a string asking for user's age
- assign user's output to variable `age` and convert it to integer
- print a string asking at what age user would like to retire
- assign the user's output to variable `pension_age`and convert it to integer
- assign the current year string value to variable `current_year`
  (use Time class)
- assign to `missing_years` the result of `pension_age` minus `age`
- assign to `pension_year` the sum between `current_year` and `missing_years`
- print a sentence reporting `current_year`, `pension_year` and `missing_years`

=end

def when_will_retire
  puts "What is your age? "
  age = gets.to_i
  puts "At what age would you like to retire? "
  pension_age = gets.to_i

  current_year = Time.now.year
  missing_years = pension_age - age
  pension_year = current_year + missing_years

  puts "It's #{current_year}. You will retire in #{pension_year}."
  puts "You have only #{missing_years} years of work to go!"
end

when_will_retire
