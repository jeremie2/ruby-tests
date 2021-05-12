# Create a method that takes two integers as arguments. The first argument is a 
# count, and the second is the first number of a sequence that your method will 
# create. The method should return an Array that contains the same number of 
# elements as the count argument, while the values of each element will be 
# multiples of the starting number.
# 
# Write a method that determines the mean (average) of the three scores passed to 
# it, and returns the letter value associated with that grade.
# 
# Numerical Score Letter  Grade
# 90 <= score <= 100  'A'
# 80 <= score < 90  'B'
# 70 <= score < 80  'C'
# 60 <= score < 70  'D'
# 0 <= score < 60   'F'
# 
# Tested values are all between 0 and 100. There is no need to check for negative 
# values or values greater than 100.


#### ANSWER

def get_grade(val_1, val_2, val_3)
  mean = (val_1 + val_2 + val_3) / 3
  case
  when mean <= 100 && mean >= 90
    'A'
  when mean < 90 && mean >= 80
    'B'
  when mean < 80 && mean >= 70
    'C'
  when mean < 70 && mean >= 60
    'D'
  else
    'F'    
  end
end

# better like this:

def get_grade(val_1, val_2, val_3)
  mean = (val_1 + val_2 + val_3) / 3
  case mean
  when 90..100
    'A'
  when 80..89
    'B'
  when 70..79
    'C'
  when 60..69
    'D'
  else
    'F'    
  end
end

puts get_grade(95, 90, 93) == "A"
puts get_grade(50, 50, 95) == "D"


#### SOLUTION 2

def get_grade(s1, s2, s3)
  result = (s1 + s2 + s3)/3

  case result
  when 90..100 then 'A'
  when 80..89  then 'B'
  when 70..79  then 'C'
  when 60..69  then 'D'
  else              'F'
  end
end
