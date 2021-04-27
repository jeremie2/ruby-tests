# As seen in the previous exercise, the time of day can be represented as the 
# number of minutes before or after midnight. If the number of minutes is 
# positive, the time is after midnight. If the number of minutes is negative, the 
# time is before midnight.
#
# Write two methods that each take a time of day in 24 hour format, and return the 
# number of minutes before and after midnight, respectively. Both methods should 
# return a value in the range 0..1439.
#
# You may not use ruby's Date and Time methods.
#
# Examples:
#
# after_midnight('00:00') == 0
# before_midnight('00:00') == 0
# after_midnight('12:34') == 754
# before_midnight('12:34') == 686
# after_midnight('24:00') == 0
# before_midnight('24:00') == 0
#
# Yes, we know that 24:00 isn't a valid time in 24-hour format. Humor us, though; # 
# it makes the problem more interesting.
#
# Disregard Daylight Savings and Standard Time and other irregularities.

#### ANSWER

MINS_DAY = 1440
MINS_HOUR = 60

def convert_time(clock_time)
  hours = clock_time[0, 2].to_i
  mins = clock_time[3, 2].to_i
  [hours, mins]
end

def after_midnight(clock_time)
  hours, mins = convert_time(clock_time)
  hours = 0 if hours == 24
  (hours * MINS_HOUR) + mins
end

def before_midnight(clock_time)
  hours, mins = convert_time(clock_time)
  hours = 24 if hours == 0
  (MINS_DAY - (hours * MINS_HOUR)) - mins
end


puts after_midnight('00:00') == 0
puts before_midnight('00:00') == 0
puts after_midnight('12:34') == 754
puts before_midnight('12:34') == 686
puts after_midnight('24:00') == 0
puts before_midnight('24:00') == 0


#### SOLUTION

# HOURS_PER_DAY = 24
# MINUTES_PER_HOUR = 60
# MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

# def after_midnight(time_str)
#   hours, minutes = time_str.split(':').map(&:to_i)
#   (hours * MINUTES_PER_HOUR + minutes) % MINUTES_PER_DAY
# end

# def before_midnight(time_str)
#   delta_minutes = MINUTES_PER_DAY - after_midnight(time_str)
#   delta_minutes = 0 if delta_minutes == MINUTES_PER_DAY
#   delta_minutes
# end
