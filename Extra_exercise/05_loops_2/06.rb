# Given the array below, use loop to remove and print each name.
# Stop the loop once names doesn't contain any more elements.
# 
# names = ['Sally', 'Joe', 'Lisa', 'Henry']
# 
# Keep in mind to only use loop, not while, until, etc.


names = ['Sally', 'Joe', 'Lisa', 'Henry']

loop do
  break if names.size == 0
  puts names.shift
end


# REVERSE
# print the names starting from the last
# 
# names = ['Sally', 'Joe', 'Lisa', 'Henry']
# 
# loop do
#   break if names.size == 0
#   puts names.pop
# end


