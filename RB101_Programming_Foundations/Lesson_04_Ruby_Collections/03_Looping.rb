
########## LOOPING

# I skipped this capitol as I already know these concepts, but there is
# an interesting example about loop and hash.
# We normally use such methods as #each to loop an hash, let's try 
# just using loop/do:

 number_of_pets = {
  'dogs' => 2,
  'cats' => 4,
  'fish' => 1
}

pets = number_of_pets.keys
counter = 0
# this will be used for the iteration:
# number_of_pets[pets[counter]]  # => number

loop do
  break if counter == number_of_pets.size

  current_pet = pets[counter]
  current_pet_number = number_of_pets[current_pet]

  puts "I have #{current_pet_number} #{current_pet}!"
  counter += 1
end


# I have 2 dogs!
# I have 4 cats!
# I have 1 fish!
