=begin

As seen in the previous exercise, the time of day can be represented as the number of minutes before or after midnight. If the number of minutes is positive, the time is after midnight. If the number of minutes is negative, the time is before midnight.

Write two methods that each take a time of day in 24 hour format, and return the number of minutes before and after midnight, respectively. Both methods should return a value in the range 0..1439.

You may not use ruby's Date and Time methods.

Examples:

after_midnight('00:00') == 0
before_midnight('00:00') == 0
after_midnight('12:34') == 754
before_midnight('12:34') == 686
after_midnight('24:00') == 0
before_midnight('24:00') == 0

## PEDAC

input: string representing time 00:00
output: - integer (total minutes after midnight)
        - negative integer (total minutes before midnight)

after_midnight algorithm:
- given the string 'time'
- if 'time' is equal '24:00' convert it to '00:00' 
- assign to 'hours' time[0..1] converted to integer and multiply by 60
- assign to 'minutes' time[3..4] converted to integer
- return 'hours' plus 'minutes'

=end

MIN_IN_A_DAY = 1440

def after_midnight(time)
  time = '00:00' if time == '24:00'
  hours = time[0..1].to_i * 60
  minutes = time[3..4].to_i
  hours + minutes
end

def before_midnight(time)
  return 0 if time == '24:00'
  MIN_IN_A_DAY - after_midnight(time)
end

puts after_midnight('00:00') == 0
puts before_midnight('00:00') == 0
puts after_midnight('12:34') == 754
puts before_midnight('12:34') == 686
puts after_midnight('24:00') == 0
puts before_midnight('24:00') == 0