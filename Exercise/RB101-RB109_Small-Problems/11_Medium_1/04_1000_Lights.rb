# You have a bank of switches before you, numbered from 1 to n. Each switch is 
# connected to exactly one light that is initially off. You walk down the row of 
# switches and toggle every one of them. You go back to the beginning, and on this 
# second pass, you toggle switches 2, 4, 6, and so on. On the third pass, you go 
# back again to the beginning and toggle switches 3, 6, 9, and so on. You repeat 
# this process and keep going until you have been through n repetitions.
# 
# Write a method that takes one argument, the total number of switches, and 
# returns an Array that identifies which lights are on after n repetitions.
# 
# Example with n = 5 lights:
# 
#     round 1: every light is turned on
#     round 2: lights 2 and 4 are now off; 1, 3, 5 are on
#     round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
#     round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
#     round 5: lights 2, 3, and 5 are now off; 1 and 4 are on
# 
# The result is that 2 lights are left on, lights 1 and 4. The return value is  
# [1,4].
# 
# With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is 
# [1, 4, 9].

# https://launchschool.com/posts/4b81cb6b

#### ANSWER

#     1 2 3 4 5
#  1  0 0 0 0 0
#  2  0   0   0
#  3  0       0
#  4  0     0 0
#  5  0     0  
#  
#  1%1 2%1 3%1 4%1 5%1   if == 0 => toggle
#   x   x   x   x   x
#  
#  1%2 2%2 3%2 4%2 5%2
#       x       x    
#  
#  1%3 2%3 3%3 4%3 5%3
#           x
#  
#  1%4 2%4 3%4 4%4 5%4
#               x
#  
#  1%5 2%5 3%5 4%5 5%5
#                   x

def switch_light(val)
  val == 'on' ? 'off' : 'on'
end

def lights_on(num_ligths)
  # create hash with n "switches" as keys a 'off' as status
  hsh = Hash.new
  1.upto(num_ligths) { |i| hsh[i] = 'off' }
  
  # switching on/off the lights whether key % i == 0
  1.upto(num_ligths) do |i|
    hsh.each do |key, val|
      hsh[key] = switch_light(val) if key % i == 0
    end
  end
  # returning the array of lights on based on key values
  hsh.keys.select { |key| hsh[key] == 'on' }
end

p lights_on(5)    # [1, 4]
p lights_on(10)   # [1, 4, 9]
p lights_on(16)   # [1, 4, 9, 16]
p lights_on(25)   # [1, 4, 9, 16, 25]

#### SOLUTION

# initialize the lights hash
def initialize_lights(number_of_lights)
  lights = Hash.new
  1.upto(number_of_lights) { |number| lights[number] = "off" }
  lights
end

# return list of light numbers that are on
def on_lights(lights)
  lights.select { |_position, state| state == "on" }.keys
end

# toggle every nth light in lights hash
def toggle_every_nth_light(lights, nth)
  lights.each do |position, state|
    if position % nth == 0
      lights[position] = (state == "off") ? "on" : "off"
    end
  end
end

# Run entire program for number of lights
def toggle_lights(number_of_lights)
  lights = initialize_lights(number_of_lights)
  1.upto(lights.size) do |iteration_number|
    toggle_every_nth_light(lights, iteration_number)
  end

  on_lights(lights)
end

p toggle_lights(1000)


#### FURTHER EXPLORATION

# Do you notice the pattern in our answer? Every light that is on is a perfect 
# square. Why is that?

# What are some alternatives for solving this exercise? What if we used an Array 
# to represent our 1000 lights instead of a Hash, how would that change our code?

def switch_light(val)
  val == 'on' ? 'off' : 'on'
end

def lights_on(num_ligths)
  arr = Array.new
  0.upto(num_ligths - 1) { |i| arr[i] = 'off' }
  
  1.upto(num_ligths) do |i|
    arr.each_with_index do |el, idx|
      arr[idx] = switch_light(el) if (idx + 1) % i == 0
    end
  end
  idx_lights = []
  arr.each_with_index { |el, idx| idx_lights << (idx + 1) if el == 'on' }
  idx_lights
end

# We could have a method that replicates the output from the description of this 
# problem (i.e. "lights 2, 3, and 5 are now off; 1 and 4 are on.") How would we go 
# about writing that code?
