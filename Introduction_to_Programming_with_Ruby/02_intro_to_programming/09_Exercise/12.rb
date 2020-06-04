# Given the following data structures. Write a program that copies the information
# from the array into the empty hash that applies to the correct person.
# 
# contacts = {
#    "Joe Smith"=>{:email=>"joe@email.com", :address=>"123 Main st.", :phone=>"555-123-4567"},
#    "Sally Johnson"=>{:email=>"sally@email.com", :address=>"404 Not Found Dr.",  :phone=>"123-234-3454"}
#  }


contacts = {
   "Joe Smith"=>{:email=>"joe@email.com", :address=>"123 Main st.", :phone=>"555-123-4567"},
   "Sally Johnson"=>{:email=>"sally@email.com", :address=>"404 Not Found Dr.",  :phone=>"123-234-3454"}
 }

# Joe's email
puts contacts["Joe Smith"][:email]

# Sally's phone number
puts contacts["Sally Johnson"][:phone]