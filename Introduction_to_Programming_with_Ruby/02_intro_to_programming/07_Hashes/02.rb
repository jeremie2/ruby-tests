# Look at Ruby's merge method:
# https://ruby-doc.org/core-2.1.0/Hash.html#method-i-merge
# Notice that it has two versions.
# What is the difference between merge and merge!?
# Write a program that uses both and illustrate the differences.


# ANSWER:
# 
# example: hash_1.merge(hash_2)
# #merge returns a new hash made of keyes and values of hash_1 and hash_2.
# Duplicated keys will be overwritten with the value of hash_2.
# 
# #merge! adds hash_2 elements to hash_1. Duplicates keys will be overwritten
# by hash_2 elements.

fruit_1 = { apples: 2, oranges: 5, bananas: 4 }
fruit_2 = { oranges: 7, melons: 3 }

fruit_merge = fruit_1.merge(fruit_2)

p fruit_1
# {:apples=>2, :oranges=>5, :bananas=>4}
p fruit_2
# {:oranges=>7, :melons=>3}
p fruit_merge
# {:apples=>2, :oranges=>7, :bananas=>4, :melons=>3}


fruit_1.merge!(fruit_2)

p fruit_1
# {:apples=>2, :oranges=>7, :bananas=>4, :melons=>3}
p fruit_2
# {:oranges=>7, :melons=>3}

