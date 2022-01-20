=begin

In the modern era under the Gregorian Calendar, leap years occur in
every year that is evenly divisible by 4, unless the year is also
divisible by 100. If the year is evenly divisible by 100, then it is
not a leap year unless the year is evenly divisible by 400.

Assume this rule is good for any year greater than year 0. Write a
method that takes any year greater than 0 as input, and returns true
if the year is a leap year, or false if it is not a leap year.

leap_year?(2016) == true
leap_year?(2015) == false
leap_year?(2100) == false
leap_year?(2400) == true
leap_year?(240000) == true
leap_year?(240001) == false
leap_year?(2000) == true
leap_year?(1900) == false
leap_year?(1752) == true
leap_year?(1700) == false
leap_year?(1) == false
leap_year?(100) == false
leap_year?(400) == true

## PEDAC

problem:
- if year/4 but not year/100    => leap year
- if year year/100 and year/400 => leap year

input: integer
mid section: if/else statements to check leap year's rules
output: boolean

algorithm:
- given a integer 'year'
- return true if: 'year' is divisible by 4 and not by 100
- return true if: 'year' is divisible by 100 and 400
                  if it's divisible by 400 it will be also by 100 
                  we can take in consideration just divisible by 400
=end

def leap_year?(year)
  (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)
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
puts leap_year?(1700) == false
puts leap_year?(1) == false
puts leap_year?(100) == false
puts leap_year?(400) == true
