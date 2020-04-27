# Write a program that uses a hash to store a list of movie titles
# with the year they came out. Then use the puts command to make your
# program print out the year of each movie to the screen. The output
# for your program should look something like this:
# 1975
# 2004
# 2013
# 2001
# 1981

movies = {
  Scooby_Doo: 1975,
  Kill_the_cloud: 2004,
  Never_say_dinner_again: 2013,
  Do_you_like_basktball?: 2001,
  Again: 1981
}

puts movies[:Scooby_Doo]
puts movies[:Kill_the_cloud]
puts movies[:Never_say_dinner_again]
puts movies[:Do_you_like_basktball?]
puts movies[:Again]
