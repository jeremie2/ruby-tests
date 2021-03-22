############# MORE METHODS

###### Enumerable#any?

# #any? is part of the 'Enumerable' module valid for array and hash.
# From documentation, we can use 2 forms:
# - .any?(pattern)
# - .any? { |elem| #.. condition }
# 
# The block return 'true' if the condition is satisfied
# at least for one element. Quick examples:

%w[ant bear cat].any? { |word| word.length >= 3 }  #=> true
%w[ant bear cat].any? { |word| word.length >= 4 }  #=> true
%w[ant bear cat].any?(/d/)                         #=> false
[nil, true, 99].any?(Integer)                      #=> true
[nil, true, 99].any?                               #=> true
[].any?                                            #=> false

# Let's write some code and see more details:

[1, 2, 3].any? do |num|
  num > 2
end

# => true

# We have to mind two different return value:
# - return value of the block
# - return value of the method
# 
# any? looks at the truthiness of the return block's values in order
# to determine the method's return value.
# If there is at least a 'true' return block's value, then the method
# returns true.

{ a: "ant", b: "bear", c: "cat" }.any? do |key, value|
  value.size > 4
end

# => false


###### Enumerable#all?

# It works in a similar way to #any? but the method returns 'true' only
# every block's iteration returns 'true'.

[1, 2, 3].all? do |num|
  num > 2
end

# => false

{ a: "ant", b: "bear", c: "cat" }.all? do |key, value|
  value.length >= 3
end

# => true


###### Enumerable#each_with_index

### WITH ARRAY
# It works like #each but it takes in consideration the 'index' of an array.
# Block's return value is ignored (it returns the original array).

[1, 2, 3].each_with_index do |num, index|
  puts "The index of #{num} is #{index}."
end

# The index of 1 is 0.
# The index of 2 is 1.
# The index of 3 is 2.
# => [1, 2, 3]

### WITH HASH
# #each_with_index can be used also with hashes. The difference is that the
# refers to an array made of keys/values couple arrays:

 a: "ant", b: "bear", c: "cat" }.each_with_index do |pair, index|
  puts "The index of #{pair} is #{index}."
end

# The index of [:a, "ant"] is 0.
# The index of [:b, "bear"] is 1.
# The index of [:c, "cat"] is 2.
# => { :a => "ant", :b => "bear", :c => "cat" }

# As we can see the loop variable 'pair' refers to a key/value array:

[[a: "ant"], [b: "bear"], [c: "cat"]]

# ..and the returned value is the original hash.


###### Enumerable#each_with_object

# - Method argument: collection object that will be returned by the method.
# - Block arguments:
#   - 1st arg: current element.
#   - 2nd arg: collection object passed as argument to method.
#
# The method returns the collection object with element elaborated inside
# the block:

[1, 2, 3].each_with_object([]) do |num, array|
  array << num if num.odd?
end

# => [1, 3]

# Repeating the explanation for the last example:
# - Method argument: []
# - Block arguments:
#   - 1st arg: 'num'
#   - 2nd arg: 'array'

# For hashes the first block arguments is an array made of pairs key/value:

{ a: "ant", b: "bear", c: "cat" }.each_with_object([]) do |pair, array|
  array << pair.last
end

# pair = [a:, "ant"]... [b:, "bear"]... [c:, "cat"]
#
# Result:
# => ["ant", "bear", "cat"]

# Pairs can also be written as (key, value):

{ a: "ant", b: "bear", c: "cat" }.each_with_object({}) do |(key, value), hash|
  hash[value] = key
end

# => { "ant" => :a, "bear" => :b, "cat" => :c }


###### Enumerable#first

# Return the first element in a collection. If used with an integer parameter,
# it's possible to select how many elements will be returned starting from the
# first position. In that case an array will be return.

[1, 2, 3].first
# => 1

[1, 2, 3].first(2)
# => [1, 2]

{ a: "ant", b: "bear", c: "cat" }.first(2)
# => [[:a, "ant"], [:b, "bear"]]

### !!
# - It shouldn't make sense an 'elements order' with hash. In practice Ruby does 
#   so that it preserves the order of insertion.
# - With hashes a nested array is returned. This may not be expected. To turn it
#   into hash we can easily use array#to_h method.


###### Enumerable#include?

# #include? doesn't take a block, it just require an argument. It returns true if
# the argument exists in the collection and false if it doesn't.
# With hash it checks only for keys and it's actually an alias for Hash#key? and 
# Hash#has_key?:

[1, 2, 3].include?(1)
# => true

{ a: "ant", b: "bear", c: "cat" }.include?("ant")
# => false

{ a: "ant", b: "bear", c: "cat" }.include?(:a)
# => true

# If we want to check for a hash value the best choice is #value? or #has_value?
# With #include we should use more steps: #values#include(elem_value)

hash.value?('cat')

# instead of

hash.values.include?('cat')

###### Enumerable#partition

# Divides up elements in the current collection into two collections, depending
# on the block's return value. The result is always a nested array.

[1, 2, 3].partition do |num|
  num.odd?
end
# => [[1, 3], [2]]

# It can be useful to parallel assign variables to capture the divided arrays: 

odd, even = [1, 2, 3].partition do |num|
  num.odd?
end

# => [[1, 3], [2]]
# odd = [1, 3]
# even = [2]

# Example with a hash:

long, short = { a: "ant", b: "bear", c: "cat" }.partition do |key, value|
  value.size > 3
end
# => [[[:b, "bear"]], [[:a, "ant"], [:c, "cat"]]]
#
# long = [[:b, "bear"]]
# short = [[:a, "ant"], [:c, "cat"]]
#
# To transform to hashes:

long.to_h    # => {:b=>"bear"}
short.to_h   # => {:a=>"ant", :c=>"cat"}
