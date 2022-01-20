=begin

A continuation of the previous exercise.

The British Empire adopted the Gregorian Calendar in 1752, which was
a leap year. Prior to 1752, the Julian Calendar was used. Under the
Julian Calendar, leap years occur in any year that is evenly divisible
by 4.

Using this information, update the method from the previous exercise to
determine leap years both before and after 1752.

leap_year?(2016) == true
leap_year?(2015) == false
leap_year?(2100) == false
leap_year?(2400) == true
leap_year?(240000) == true
leap_year?(240001) == false
leap_year?(2000) == true
leap_year?(1900) == false
leap_year?(1752) == true
leap_year?(1700) == true
leap_year?(1) == false
leap_year?(100) == true
leap_year?(400) == true

## PEDAC

We have to divide the method in 2 parts:
- years from 1752: same code as in previous exercise
- years before 1752: use the only condition year % 4 == 0

=end

def leap_year?(year)
  if year < 1752
    year % 4 == 0
  else
    (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)
  end
end

puts leap_year?(2016) == true
puts leap_year?(2015) == false
puts leap_year?(2100) == false
puts leap_year?(2400) == true
puts leap_year?(240000) == true
puts leap_year?(240001) == false
puts leap_year?(2000) == true
puts leap_year?(1900) == false
puts leap_year?(1752) == true
puts leap_year?(1700) == true
puts leap_year?(1) == false
puts leap_year?(100) == true
puts leap_year?(400) == true
