# You want to create a nice interface that allows you to accurately
# describe the action you want your program to perform. Create a
# method called spray_paint that can be called on an object and will
# modify the color of the car.


class MyCar
  attr_accessor :color
  attr_reader :year

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

  def spray_paint(new_color)
    self.color = new_color
    puts "Your car is now #{self.color}!"
  end
end


splash = MyCar.new('Suzuky Splash', 2008, 'Silver')
splash.spray_paint('black')
