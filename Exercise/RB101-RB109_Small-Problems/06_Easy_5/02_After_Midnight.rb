# The time of day can be represented as the number of minutes before or after 
# midnight. If the number of minutes is positive, the time is after midnight. If 
# the number of minutes is negative, the time is before midnight.
#
# Write a method that takes a time using this minute-based format and returns the 
# time of day in 24 hour format (hh:mm). Your method should work with any integer 
# input.
# You may not use ruby's Date and Time classes.
# Examples:
#
# time_of_day(0) == "00:00"
# time_of_day(-3) == "23:57"
# time_of_day(35) == "00:35"
# time_of_day(-1437) == "00:03"
# time_of_day(3000) == "02:00"
# time_of_day(800) == "13:20"
# time_of_day(-4231) == "01:29"
#
# Disregard Daylight Savings and Standard Time and other complications.

#### ANSWER

# 1h = 60m
# 1d = 24h = 1440m
#
# 3000.divmod(1440) = [2, 120] = 2d 120m = 48h 120m
# 120.divmod(60) = [2, 0] = 2h 0m = 02:00

def time_of_day(mins)
  day_min = mins.divmod(1440)
  minutes
end


time_of_day(0) == "00:00"
time_of_day(-3) == "23:57"
time_of_day(35) == "00:35"
time_of_day(-1437) == "00:03"
time_of_day(3000) == "02:00"
time_of_day(800) == "13:20"
time_of_day(-4231) == "01:29"



