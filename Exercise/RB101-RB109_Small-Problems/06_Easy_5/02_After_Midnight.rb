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

# Started to sort out things and examples like:
# 1h = 60m
# 1d = 24h = 1440m
#
# 3000.divmod(1440) = [2, 120] = 2d 120m = 48h 120m
# 120.divmod(60) = [2, 0] = 2h 0m = 02:00
# 
# and tried to build 'time_of_day' method, but I was going through
# an endless line of 'if' statement for every case:
# minutes < 60, ...< 1440... etc..
# and still to take in consideration the format '00:00'.
# I could probably find a solution but I had the
# feelings things were too cumbersome.
# I had a look at the solution and I'm going to report
# those steps. Surely a more interesting approach.

# The first step and main point of the solution is to 'normalize'
# the minutes variable passed into #time_of_day(minutes) method.
# It doesn't matter how many days variable 'minutes' contains or
# if it's a negative number. With normalization we reset variable
# 'minutes' so that it represent just hours an minutes.

# First some useful constants (there are 1440m per day)
MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR


# 1440m → 00:00, so we take in consideration
# 1439m → 23:59 as boundary

def normalize_minutes_to_0_through_1439(minutes)
  while minutes < 0
    minutes += MINUTES_PER_DAY
  end

  minutes % MINUTES_PER_DAY
end

# At this stage it's easy to implement #time_of_day. Inside it
# we'll set 'delta_minutes' as normalized time. Then with #divmod
# we easily get hours and minutes

def time_of_day(delta_minutes)
  delta_minutes = normalize_minutes_to_0_through_1439(delta_minutes)
  hours, minutes = delta_minutes.divmod(MINUTES_PER_HOUR)
  format('%02d:%02d', hours, minutes)
end

# the #format builds the returned string taking in consideration
# the 00:00 format.


######## FURTHER EXPLORATION

#### PROBLEM 1

# The % operator's interaction with negative values is confusing and difficult to
# remember, as described in the Introduction to Programming with Ruby Book. 
# Because of that, we recommend not using % with negative numbers, but that you 
# should first convert the negative values to positive numbers so you can write 
# more explicit code. This problem is one such place where it's probably easier to 
# take this approach.
#
# However, that doesn't mean you can't use % at all. In fact, it's possible to 
# write a single calculation with % that performs the entire normalization 
# operation in one line of code. Give it a try, but don't spend too much time on
# it.

# ANSWER
#
# The method can be rewritten in a single line like this:

def normalize_minutes_to_0_through_1439(minutes)
  minutes % MINUTES_PER_DAY
end

# actually this can be included inside the main method:

def time_of_day(minutes)
  delta_minutes = minutes % MINUTES_PER_DAY
  hours, minutes = delta_minutes.divmod(MINUTES_PER_HOUR)
  format('%02d:%02d', hours, minutes)
end
