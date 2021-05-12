# Create a method that takes 2 arguments, an array and a hash. The array will
# contain 2 or more elements that, when combined with adjoining spaces, will 
# produce a person's name. The hash will contain two keys, :title and :occupation, 
# and the appropriate values. Your method should return a greeting that uses the 
# person's full name, and mentions the person's title and occupation.

#### ANSWER

def greetings(arr, hsh)
  full_name = arr.join(' ')
  "Hello, #{full_name}! Nice to have #{hsh[:title]} #{hsh[:occupation]} around."
end

puts greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => Hello, John Q Doe! Nice to have a Master Plumber around.

#### SOLUTION

def greetings(name, status)
  "Hello, #{name.join(' ')}! Nice to have a #{status[:title]} #{status[:occupation]} around."
end


#### FURTHER EXPLORATION

# This method doesn't actually pass rubocop! What is the best way to shorten the 
# lines in this method so it doesn't exceed the 80 maximum characters to a line?

#### ANSWER

# More variable so that the 'puts' line will be shorter and more readable:

def greetings(arr, hsh)
  full_name = arr.join(' ')
  title = hsh[:title]
  job = hsh[:occupation]
  "Hello, #{full_name}! Nice to have #{title} #{job} around."
end
