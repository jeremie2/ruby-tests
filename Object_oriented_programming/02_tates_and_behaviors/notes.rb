# class GoodDog
#   def initialize(name)
#     @name = name
#   end

#   def name
#     @name
#   end

#   def name=(n)
#     @name = n
#   end

#   def speak
#     "#{@name} says arf!"
#   end
# end

#############################

# class GoodDog
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end

#   def speak
#     "#{@name} says arf!"
#   end
# end

# sparky = GoodDog.new("Sparky")
# fido = GoodDog.new("Fido")

# puts fido.speak

# puts sparky.name
# puts sparky.speak
# sparky.name = "Spartacus"
# puts sparky.name

#############################

class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n, h, w)
    @name = n
    @height = h
    @weight = w
  end

  def speak
    "#{self.name} says arf!"
  end

  def change_info(n, h, w)
    self.name = n
    self.height = h
    self.weight = w 
  end

  def info
    "#{self.name} weighs #{self.weight} and is #{self.height} tall."
  end
end


sparky = GoodDog.new('Sparky', '30cm', '2Kg')
puts sparky.info

puts sparky.speak

sparky.change_info('Spartacus', '30cm', '2Kg')
puts sparky.info







