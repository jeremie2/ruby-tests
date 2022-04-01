
# OOP (Object Oriented Programming)
#
# ENCAPSULATION: hiding pieces of functionality and making it unavailable to
#                the rest of the code base.
#
# POLYMORPHISM: not really clear... but it looks like different "things" can
#               can access the same functionality through a specific interface      
#
# INHERITANCE: class inherits the behaviors of another class, referred to as
#              the SUPERCLASS. This gives the power to define basic classes
#              with large re-usability and smaller sub-classes for detailed
#              behaviors.
#
# NOT OBJECT in Ruby: methods, blocks, and variables.
#
# CLASSES: what creates OBJECTS.     

class GoodDog
end

sparky = GoodDog.new

# We have defined a class and create an INSTANCE (object) of these class
# called 'sparky'.
#
# > sparky.class
# => GoodDog

# MODULE: collection of behaviors usable in other classes via the 'include'
#         method (mixins).

module Speak
  def speak(sound)
    puts sound
  end
end

class GoodDog
  include Speak
end

class HumanBeing
  include Speak
end

sparky = GoodDog.new
sparky.speak("Arf!")        # => Arf!
bob = HumanBeing.new
bob.speak("Hello!")         # => Hello!

# How does module work? Let's try the #ancestors method:

puts GoodDog.ancestors
# GoodDog
# Speak
# Object
# Kernel
# BasicObject

puts HumanBeing.ancestors
# HumanBeing
# Speak
# Object
# Kernel
# BasicObject

# Ruby has a distinct lookup path that it follows each time a method is called.
# #ancestors shows that the module is placed between the custom classes and
# the classes that come with Ruby.
# As #speak is called, Ruby will first look into GoodDog and then into Speak...


# STATES and BEHAVIORS


class GoodDog
  def initialize(name)
    @name = name
  end

  def speak
    "Arf!"
  end
end

sparky = GoodDog.new("Sparky")
puts sparky.speak







