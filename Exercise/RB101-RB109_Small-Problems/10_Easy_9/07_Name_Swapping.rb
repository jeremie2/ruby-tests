# Write a method that takes a first name, a space, and a last name passed as a 
# single String argument, and returns a string that contains the last name, a 
# comma, a space, and the first name.


#### ANSWER

def swap_name(str)
  arr = str.split
  "#{arr[1]}, #{arr[0]}"
end

puts swap_name('Joe Roberts') == 'Roberts, Joe'

#### SOLUTION

def swap_name(name)
  name.split(' ').reverse.join(', ')
end

# it could be also:

def swap_name(name)
  name.split.reverse.join(', ')
end
