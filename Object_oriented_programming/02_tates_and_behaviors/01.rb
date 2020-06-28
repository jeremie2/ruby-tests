# Create a class called MyCar. When you initialize a new instance or
# object of the class, allow the user to define some instance variables that
# tell us the year, color, and model of the car.
# Create an instance variable that is set to 0 during instantiation of the object
# to track the current speed of the car as well. Create instance methods that allow
# the car to speed up, brake, and shut the car off.


class MyCar

  def initialize(m, y, c)
    @model = m
    @year = y
    @color = c
    @current_speed = 0
  end

  def current_speed
    "Km/h: #{@current_speed}"
  end

  def speed_up(increase)
    @current_speed += increase
  end

  def break(decrease)
    @current_speed -= decrease
  end

  def shut_down
    @current_speed = 0
  end
end


splash = MyCar.new('Suzuky Splash', 2008, 'Silver') 

puts splash.current_speed
splash.speed_up(40)
puts splash.current_speed
splash.break(10)
puts splash.current_speed
splash.shut_down
puts splash.current_speed



# SOLUTION
#
# class MyCar
# 
#   def initialize(year, model, color)
#     @year = year
#     @model = model
#     @color = color
#     @current_speed = 0
#   end
# 
#   def speed_up(number)
#     @current_speed += number
#     puts "You push the gas and accelerate #{number} mph."
#   end
# 
#   def brake(number)
#     @current_speed -= number
#     puts "You push the brake and decelerate #{number} mph."
#   end
# 
#   def current_speed
#     puts "You are now going #{@current_speed} mph."
#   end
# 
#   def shut_down
#     @current_speed = 0
#     puts "Let's park this bad boy!"
#   end
# end
# 
# lumina = MyCar.new(1997, 'chevy lumina', 'white')
# lumina.speed_up(20)
# lumina.current_speed
# lumina.speed_up(20)
# lumina.current_speed
# lumina.brake(20)
# lumina.current_speed
# lumina.brake(20)
# lumina.current_speed
# lumina.shut_down
# lumina.current_speed