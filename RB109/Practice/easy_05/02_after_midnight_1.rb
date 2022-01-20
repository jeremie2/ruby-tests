=begin

The time of day can be represented as the number of minutes before
or after midnight. If the number of minutes is positive, the time
is after midnight. If the number of minutes is negative, the time
is before midnight.

Write a method that takes a time using this minute-based format and
returns the time of day in 24 hour format (hh:mm). Your method should
work with any integer input.

You may not use ruby's Date and Time classes.

Examples:

time_of_day(0) == "00:00"
time_of_day(-3) == "23:57"
time_of_day(35) == "00:35"
time_of_day(-1437) == "00:03"
time_of_day(3000) == "02:00"
time_of_day(800) == "13:20"
time_of_day(-4231) == "01:29"

Disregard Daylight Savings and Standard Time and other complications.

## Hint

The Integer#divmod method and the % (modulo) operator may prove useful
in your solution. You may also find Kernel#format handy for formatting
your results.

You may want to solve this problem for non-negative arguments that are
between 0 and 1439 first. Once you've done that, try handling arguments
that are greater than 1439. Finally, solve it for negative values. Think
about how you might be able to simplify the final two parts. (Hint: one
day is 1440 minutes)

## PEDAC

input: relative integer
mid section: conversion from minutes to hours and minute
output: string representation of hours and minute "00:00"

Things are easy if we don't exceed 1439
min.divmod(60) give us hours and minutes.
To reduce everything to this case, we need to sort out minutes
when exceeding 1439 and when less than 0.

When minutes exceed 1439:
  minutes % min_in_a_day 
give us the remaining minutes.

When minutes are negative, in order to get the remaining minutes
we have to add min_in_a_day till the result is positive.
That's the remaining part which can be treated like the previous
case.

We can put these things into a method:

algorithm:
- given a integer representing minutes 'min'
- set MIN_PER_DAY equal 1440
- loop
  - exit if min is grater or equal than 0
  - add MIN_PER_DAY to min
- end loop
- return min % MIN_PER_DAY

=end

MIN_PER_DAY = 1440
MIN_PER_HOUR = 60

def find_minutes(min)
  while min < 0
    min += MIN_PER_DAY
  end
  min % MIN_PER_DAY
end

def time_of_day(min)
  min = find_minutes(min)
  hours, minutes = min.divmod(MIN_PER_HOUR)

  format('%02d:%02d', hours, minutes)
end

puts time_of_day(0) == "00:00"
puts time_of_day(-3) == "23:57"
puts time_of_day(35) == "00:35"
puts time_of_day(-1437) == "00:03"
puts time_of_day(3000) == "02:00"
puts time_of_day(800) == "13:20"
puts time_of_day(-4231) == "01:29"
