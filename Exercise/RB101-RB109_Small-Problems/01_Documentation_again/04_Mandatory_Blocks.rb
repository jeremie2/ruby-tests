
############ Mandatory Blocks

# The Array#bsearch method is used to search ordered Arrays more quickly
# than #find and #select can. Assume you have the following code:

a = [1, 4, 8, 11, 15, 19]

# How would you search this Array to find the first element whose value
# exceeds 8?

##### ANSWER

# From documentation:
# https://ruby-doc.org/core-2.7.2/Array.html#method-i-bsearch
# IT WORKS WITH SORTED LISTS!

b = a.bsearch { |x| x > 8 }
puts b

##### FROM SOLUTION

# Suggested page about binary search algorithm:
# https://en.wikipedia.org/wiki/Binary_search_algorithm
