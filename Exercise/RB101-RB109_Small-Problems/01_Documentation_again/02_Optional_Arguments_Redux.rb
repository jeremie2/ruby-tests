
############ Optional Arguments Redux

# Assume you have the following code:

require 'date'

puts Date.civil
puts Date.civil(2016)
puts Date.civil(2016, 5)
puts Date.civil(2016, 5, 13)

# What will each of the 4 puts statements print?

##### ANSWER

# I presume it's going to print dates using different styles
# It looks the format should be 'year - month - day':
#
# puts Date.civil               # => 2021 - 02 - 18
# puts Date.civil(2016)         # => 2016
# puts Date.civil(2016, 5)      # => 2016 - 5
# puts Date.civil(2016, 5, 13)  # => 2016 - 5 - 13

# let's see into pry:
puts Date.civil               # => -4712-01-01  don't get this one :(
puts Date.civil(2016)         # => 2016-01-01
puts Date.civil(2016, 5)      # => 2016-05-01
puts Date.civil(2016, 5, 13)  # => 2016-05-13

# A good part of what I thought was is right, but when month/day is
# missing, it starts always from the 1st month/day.

# Some more infos from documentation:
# https://ruby-doc.org/stdlib-2.7.0/libdoc/date/rdoc/Date.html#method-c-civil
# There's even a 4th argument to decide which calendar to use (Julian,
# Gregorian...). Depending of the calendar years you can fix a "zero" year
# in the past. Basically that parameter decides the 'start day'.
# '-4712-01-01' of the first output is just a default for astronomical reasons.

##### FROM SOLUTION

# This is the general definition Date::civil class method:
# civil([year=-4712[, month=1[, mday=1[, start=Date::ITALY]]]]) → date
# [] brackets are used only in the documentation.
# In this case [] are nested, so omitting 'month' means also 'day' will
# be omitted.  

Date.civil                             # everything defaults
Date.civil(2016)                       # month, mday, start use defaults
Date.civil(2016, 5)                    # mday, start use defaults
Date.civil(2016, 5, 13)                # start uses default
Date.civil(1751, 5, 13, Date::ENGLAND) # nothing defaults
