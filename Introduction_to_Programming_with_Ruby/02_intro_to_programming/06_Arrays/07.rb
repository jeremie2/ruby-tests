# Use the each_with_index method to iterate through an array of your
# creation that prints each index and value of the array.

arr = ['scooby', 'snoopy', 'fufy', 'goofy']

arr.each_with_index {|elem, indx| puts "#{indx}. #{elem}"}