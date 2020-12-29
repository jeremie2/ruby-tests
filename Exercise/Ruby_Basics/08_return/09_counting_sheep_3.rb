# What will the following code print? Why? Don't run it
# until you've attempted to answer.
# 
# def count_sheep
#   5.times do |sheep|
#     puts sheep
#     if sheep >= 2
#       return
#     end
#   end
# end
# 
# p count_sheep


# ANSWER:
# The program prints:
0
1
2
nil
# from 0..2 we see the values printed by #times with
# the if condition >= 2
# nil is printed because there is no value after return. 
