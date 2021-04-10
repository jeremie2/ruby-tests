# Write a method that takes a year as input and returns the century. The return
# value should be a string that begins with the century number, and ends with st,
# nd, rd, or th as appropriate for that number.
#
# New centuries begin in years that end with 01. So, the years 1901-2000 comprise
# the 20th century.
#
# Examples:
#
# century(2000) == '20th'
# century(2001) == '21st'
# century(1965) == '20th'
# century(256) == '3rd'
# century(5) == '1st'
# century(10103) == '102nd'
# century(1052) == '11th'
# century(1127) == '12th'
# century(11201) == '113th'


#### ANSWER

# input: integer
#   - a year (1950)
# output: string
#   - the century ('20th')

# pattern:
# 
# 1....100  → 1st
# 101..200  → 2nd
# 201..300  → 3rd
# 301..400  → 4th
# ...
# 1001...1100 → 11th
# 1101...1200 → 12th
# 1201...1300 → 11th

# Some help from solution:
# First, notice a pattern about a century. It is equal to the current year
# divided by 100 plus 1. The exception to this is if the year is some multiple
# of 100. In that case, the century is the current year divided by 100.

# (158 / 100) + 1 = 1
# (374 / 100) + 1 = 4
# (1841 / 100) + 1 = 19

# exception:
# (2000 / 100) + 1 = 21 NOT OK... just 2000 / 100 = 20

def century(year)
  if (year % 100) == 0
    century = year / 100
  else
    century = (year / 100) +1
  end
  
  if [11, 12 , 13].include?(century % 100)
    postfix = 'th'
  else
    postfix = case century % 10
              when 1 then 'st'
              when 2 then 'nd'
              when 3 then 'rd'
              else 'th'
    end
  end
  century.to_s + postfix
end


#### SOLUTION

def century(year)
  century = year / 100 + 1
  century -= 1 if year % 100 == 0
  century.to_s + century_suffix(century)
end

def century_suffix(century)
  return 'th' if [11, 12, 13].include?(century % 100)
  last_digit = century % 10

  case last_digit
  when 1 then 'st'
  when 2 then 'nd'
  when 3 then 'rd'
  else 'th'
  end
end

#### DISCUSSION

# First, notice a pattern about a century. It is equal to the current year divided 
# by 100 plus 1. The exception to this is if the year is some multiple of 100. In 
# that case, the century is the current year divided by 100.

# Next we need to understand which suffix to append for our century, the options 
# being: 'th', 'nd', 'rd', 'st'. We decide which one to use by checking the last 
# digit of the century. Though, before we do that, we do need to do one extra 
# check. If the century's value mod 100 ends in either 11, 12, or 13, then we 
# should return 'th'. Any other time, we can return a suffix determined by our 
# case statement and the value of century % 10.

# Finally, we combine the string representation of the century with the correct 
# suffix, and we have our answer.
