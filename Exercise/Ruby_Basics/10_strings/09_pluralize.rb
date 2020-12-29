# Given the following code, use Array#each to print the plural
# of each word in words.
# 
# words = 'car human elephant airplane'
# 
# Expected output:
# 
# cars
# humans
# elephants
# airplanes


words = 'car human elephant airplane'
words.split.each do |elem|      # by default equivalent of words.split(' ')
  puts elem + 's'
end