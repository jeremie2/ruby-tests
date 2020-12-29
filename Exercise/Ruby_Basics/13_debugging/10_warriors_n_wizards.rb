# We started writing an RPG game, but we already run into an error
# message. Find the problem and fix it.
# 
# # Each player starts with the same basic stats.
# 
# player = { strength: 10, dexterity: 10, charisma: 10, stamina: 10 }
# 
# # Then the player picks a character class and gets an upgrade accordingly.
# 
# character_classes = {
#   warrior: { strength:  20 },
#   thief:   { dexterity: 20 },
#   scout:   { stamina:   20 },
#   mage:    { charisma:  20 }
# }
# 
# puts 'Please type your class (warrior, thief, scout, mage):'
# input = gets.chomp.downcase
# 
# player.merge(character_classes[input])
# 
# puts 'Your character stats:'
# puts player


# Each player starts with the same basic stats.

player = { strength: 10, dexterity: 10, charisma: 10, stamina: 10 }

# Then the player picks a character class and gets an upgrade accordingly.

character_classes = {
  warrior: { strength:  20 },
  thief:   { dexterity: 20 },
  scout:   { stamina:   20 },
  mage:    { charisma:  20 }
}

puts 'Please type your class (warrior, thief, scout, mage):'
input = gets.chomp.downcase.to_sym

player.merge!(character_classes[input])

puts 'Your character stats:'
puts player


# ANSWER:
# 
# Error message: no implicit conversion of nil into Hash (TypeError)
# input needs to be converted to symbol:
# input = gets.chomp.downcase.to_sym
# 
# Then we have to use player.merge! instead player.merge to mutate
# the caller.
 