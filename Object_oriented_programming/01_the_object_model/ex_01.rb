
# ::: 01
# How do we create an object in Ruby? Give an example of the creation of an object.

# SOLUTION
# First I create a class:
class Dog
end

# then I create an instance useing the #new mthod:
spanky = Dog.new

# I just print the instance and see what it tell..
puts spanky
#<Dog:0x00005642b644c790>  ← object of the class Dog

# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# ::: 02
# What is a module? What is its purpose? How do we use them with our classes?
# Create a module for the class you created in exercise 1 and include it properly.

# SOLUTION
# A module is a collection of behaviour that can be used by different classes.

module Voice
  def voice(word)
    puts word
  end
end

class Dog
  include Voice  
end

spanky.voice("Bau!")
