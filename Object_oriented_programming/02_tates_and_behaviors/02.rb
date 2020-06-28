# Add an accessor method to your MyCar class to change and view the color
# of your car. Then add an accessor method that allows you to view, but
# not modify, the year of your car.


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
end


splash = MyCar.new('Suzuky Splash', 2008, 'Silver')

puts "My car is a #{splash.year} model."
puts "Its color is #{splash.color}."
puts "But I'm painting it.."
splash.color = 'yellow'
puts "Now it is #{splash.color}."
