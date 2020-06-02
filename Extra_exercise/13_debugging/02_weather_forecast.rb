# Our predict_weather method should output a message indicating whether a
# sunny or cloudy day lies ahead. However, the output is the same every time
# the method is invoked. Why? Fix the code so that it behaves as expected.
# 
# def predict_weather
#   sunshine = ['true', 'false'].sample
# 
#   if sunshine
#     puts "Today's weather will be sunny!"
#   else
#     puts "Today's weather will be cloudy!"
#   end
# end


def predict_weather
  sunshine = ['true', 'false'].sample

  if sunshine == 'true'
    puts "Today's weather will be sunny!"
  else
    puts "Today's weather will be cloudy!"
  end
end


predict_weather


# ANSWER:
# 
# At the beginning of the if/else statement:
# if sunshine
# returns always true. This is why the always sunny sentence is printed.
# To fixit we just need:
# if sunshine == 'true'
# so that we can compare the result of the #sample method.



# SOLUTION:
# 
# In the given code sample, the value referenced by sunshine will always
# be a String object. All objects in Ruby except for nil and the Boolean
# false evaluate as true. Therefore, the condition provided to our if
# statement on line 4 will always be truthy, and thus the code on line 5
# will always be executed.
# 
# 
# def predict_weather
#   sunshine = [true, false].sample
# 
#   if sunshine
#     puts "Today's weather will be sunny!"
#   else
#     puts "Today's weather will be cloudy!"
#   end
# end
# 
# Discussion
# 
# In order for the method to behave as expected, we should assign sunshine
# to the Boolean true or false instead of the string 'true' or 'false'.