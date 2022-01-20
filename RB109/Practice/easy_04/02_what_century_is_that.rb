=begin

Write a method that takes a year as input and returns the century.
The return value should be a string that begins with the century
number, and ends with st, nd, rd, or th as appropriate for that
number.

New centuries begin in years that end with 01. So, the years 1901-2000
comprise the 20th century.

Examples:

century(2000) == '20th'
century(2001) == '21st'
century(1965) == '20th'
century(256) == '3rd'
century(5) == '1st'
century(10103) == '102nd'
century(1052) == '11th'
century(1127) == '12th'
century(11201) == '113th'

## PEDAC

input: integer
mid section: - retrieve the century (string)
             - calculate suffix on century (st, nd,...)
output: string (century + suffix)

algorithm:

# SUFFIX
given a 'century' as string
- return 'st' if 'century' ends with '01'
- return 'nd' if 'century' ends with '02'
- return 'rd' if 'century' ends with '03'
- else return 'th'

test cases:
2000 / 100 = 20
2000 % 100 = 0
1980 / 100 = 19

if year % 100 is different by 0, then (result + 1).to_s
else result.to_s

=end

def century(year)
  century = (year / 100) + 1
  century = century - 1 if year % 10 == 0
  century.to_s + suffix(century.to_s)
end

def suffix(century)
  return 'th' if %w(11 12 13).include?(century[-2..-1])
  case century[-1]
  when '1'
    'st'
  when '2'
    'nd'
  when '3'
    'rd'
  else
    'th'
  end
end

puts century(2000) == '20th'
puts century(2001) == '21st'
puts century(1965) == '20th'
puts century(256) == '3rd'
puts century(5) == '1st'
puts century(10103) == '102nd'
puts century(1052) == '11th'
puts century(1127) == '12th'
puts century(11201) == '113th'
