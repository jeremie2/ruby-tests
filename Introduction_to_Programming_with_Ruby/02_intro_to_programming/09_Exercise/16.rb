# Challenge: In exercise 11, we manually set the contacts hash values one by one.
# Now, programmatically loop or iterate over the contacts hash from exercise 11,
# and populate the associated data from the contact_data array. Hint: you will
# probably need to iterate over ([:email, :address, :phone]), and some helpful
# methods might be the Array shift and first methods.
# 
# Note that this exercise is only concerned with dealing with 1 entry in the
# contacts hash, like this:
# 
# contact_data = ["joe@email.com", "123 Main st.", "555-123-4567"]
# contacts = {"Joe Smith" => {}}


# FIRST PART
#
# contact_data = ["joe@email.com", "123 Main st.", "555-123-4567"]
# 
# contacts = {"Joe Smith" => {}}
# # This is how the hash will be built:
# # contacts = {"Joe Smith" => {hash[item] => contact_data.shift, ... }}
# 
# items = [:email, :address, :phone]
# 
# contacts.each do |name, hash|
#   items.each { |item| hash[item] = contact_data.shift }
# end


# SECOND PART
#
# As a bonus, see if you can figure out how to make it work with multiple entries
# in the contacts hash.
# 
# Expected output:
#  {
#    "Joe Smith"=>{:email=>"joe@email.com", :address=>"123 Main st.", :phone=>"555-123-4567"},
#    "Sally Johnson"=>{:email=>"sally@email.com", :address=>"404 Not Found Dr.",  :phone=>"123-234-3454"}
#  }


# items = [:email, :address, :phone]
# 
# contact_data = [
#   ["joe@email.com", "123 Main st.", "555-123-4567"],
#   ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]
# ]
# 
# contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}
# 
# contacts.each do |name, hash|
#   array = contact_data.shift 
#   items.each { |item| hash[item] = array.shift }
# end
# 
# Thoughts:
# I have noticed that both contacts and contact_data require 2 iterations.
# So, before items.each (3 iterations), I have set the variable array = contact_data.shift.
# This way I get at the first iteration:
# "Joe Smith" => {} ["joe@email.com"  and  "123 Main st.", "555-123-4567"]
# items.each will fill the empty array.


#  SOLUTION

contact_data = [
  ["joe@email.com", "123 Main st.", "555-123-4567"],
  ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]
]
contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}
fields = [:email, :address, :phone]

contacts.each_with_index do |(name, hash), idx|
  fields.each { |field| hash[field] = contact_data[idx].shift }
end

# Thoughts:
# Folllowing the previous "thoughts", contacts and contact_data have got
# the same iteration step.
# In this example #each_with_index has been used, which is good because
# during the iteration the idx of contacts will be exactly the same
# of the idx of contact_data.... which can be easily iterated.

p contacts