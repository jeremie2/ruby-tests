# Write a method that takes two arguments: the first is the starting number, and 
# the second is the ending number. Print out all numbers between the two numbers, 
# except if a number is divisible by 3, print "Fizz", if a number is divisible by 
# 5, print "Buzz", and finally if a number is divisible by 3 and 5, print 
# "FizzBuzz".
# 
# Example:
# 
# fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 
# 14, FizzBuzz


#### ANSWER

def fizzbuzz(first_n, last_n)
  fiz_buz = []
  first_n.upto(last_n) do |i|
  fiz_buz << case
    when i % 3 == 0 && i % 5 == 0
      'FizzBuzz'
    when i % 3 == 0
      'Fizz'
    when i % 5 == 0
      'Buzz'
    else
      i
    end
  end
  fiz_buz
end

puts fizzbuzz(1, 15)
# -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz


#### SOLUTION

def fizzbuzz(starting_number, ending_number)
  result = []
  starting_number.upto(ending_number) do |number|
    result << fizzbuzz_value(number)
  end
  puts result.join(', ')
end

def fizzbuzz_value(number)
  case
  when number % 3 == 0 && number % 5 == 0
    'FizzBuzz'
  when number % 5 == 0
    'Buzz'
  when number % 3 == 0
    'Fizz'
  else
    number
  end
end


#### from user PIERRE-EMMANUEL ROUSSEL

def fizzbuzz(first, last)
  (first..last).map do |num|
    num % 3 == 0 && num % 5 == 0 ? num = "FizzBuzz" : num
    num % 3 == 0 ? num = "Fizz" : num
    num % 5 == 0 ? num = "Buzz" : num
  end
end
