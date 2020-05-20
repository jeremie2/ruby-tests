# You run the following code...
# 
# names = ['bob', 'joe', 'susan', 'margaret']
# names['margaret'] = 'jody'
# 
# ...and get the following error message:
# 
# TypeError: no implicit conversion of String into Integer
#   from (irb):2:in `[]='
#   from (irb):2
#   from /Users/username/.rvm/rubies/ruby-2.5.3/bin/irb:12:in `<main>'
# 
# What is the problem and how can it be fixed?


# When we write an element of an array in this form: names[...]
# we mean "the element at index [...]".
# If I want to change the element 'margaret' I have
# to write its index, which is 3.
names = ['bob', 'joe', 'susan', 'margaret']
names[3] = 'jody'