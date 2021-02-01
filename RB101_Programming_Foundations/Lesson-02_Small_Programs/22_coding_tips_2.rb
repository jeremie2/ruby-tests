
::::::::::::::::::::::: CODING TIPS 2 


:::::: USING NEW LINES TO ORGANIZE CODE

- Bad example:

  name = ''
  puts "Enter your name: "
  loop do
    name = gets.chomp
    break unless name.empty?
    puts "That's an invalid name. Try again:"
  end
  puts "Welcome #{name}!"
  puts "What would you like to do?"


- Better example:

  name = ''

  puts "Enter your name: "
  loop do
    name = gets.chomp
    break unless name.empty?
    puts "That's an invalid name. Try again:"
  end

  puts "Welcome #{name}!"
  puts "What would you like to do?"

Code with new lines like this, help to highlight the different
parts of the program:

1. variable initialization
2. user input and validation
3. using the variable


:::::: SHOULD A METHOD RETURN OR DISPLAY?

If possible avoid methods that return values and side effects!
(side effects = displaying something or mutating an object )


:::::: NAME METHODS APPROPRIATELY, LET METHODS DO ONE THING

If a methods will output a value, then this methods with display_ or print_
Following this convention will save you from constantly looking at the 
implementation to recall how to use a method.

A method called print_total will obviously output a total and return anything.

  If you find yourself constantly looking at a method's implementation
  every time you use it, it's a sign that the method needs to be improved!

A method should do one thing, and be named appropriately.

Without looking at the implementation, a method called:
  - total: should return a value 
  - print_total: should return nil
  - total!: should mutate values.


:::::: DON'T MUTATE THE CALLER DURING ITERATION

An example:

  words = %w(scooby doo on channel two)
  words.each {|str| words.delete(str)}
  puts words.inspect        # => ["doo", "channel"]

Deleting element of n array while iterating will break the order of the elements
in the array. Deleting the first element means that what was the second is now
the first, the third is now the second and so on.
Obviously we get a weird result as ["doo", "channel"].


:::::: VARIABLE SHADOWING

When we got the same name for two variables, one in an inner scope, the other
in outer scope we might have problems.
Inside the inner scope it will not be possible to access the variable in
outer scope. That's variable shadowing.

  name = 'johnson'

  ['kim', 'joe', 'sam'].each do |name|
    puts "#{name} #{name}"
  end

  # => kim kim
  # => joe joe
  # => sam sam

Choosing an appropriate block variables, things will be OK:

  name = 'johnson'

  ['kim', 'joe', 'sam'].each do |fname|
    puts "#{fname} #{name}"
  end

  # => kim johnson
  # => joe johnson
  # => sam johnson

Rubocop will help also in this case!


:::::: DON'T USE ASSIGNMENT IN A CONDITIONAL

Bad example:

  if some_variable = get_a_value_from_somewhere
    puts some_variable
  end

Good example:

  some_variable = get_a_value_from_somewhere
  if some_variable
    puts some_variable
  end


:::::: USE UNDERSCORE FOR UNUSED PARAMETERS

Suppose you are iterating an array and you have to print something, but
it's not important the element you are passing to the block variable:

  names = ['kim', 'joe', 'sam']
  names.each { |_| puts "got a name!" }

For each name of the array we just want to print 'got a name!', it's not
important the single name.
In cases like this it's a good practice to use an underscore _ as block
variable.

It's the same for unused parameter when there are multiple parameters:

  names.each_with_index do|_, idx|
    puts "#{idx+1}. got a name!"
  end


:::::: GAIN EXPERIENCE THROUGH STRUGGLING

Beginners:
  - want to know the "best" or "right" way to do something, and want to learn
    the "best practice";
  - too much time being wasted on debugging and not doing things correctly the 
    first time.

Becoming a good developer means experiencing and solving a lot of weird issues.

Don't memorize "best practices", but spend enough time programming to the point 
where you understand the context for those practices.
If you do that, you'll be able to lean on your past experience to draw on, rather 
than try to retrieve a bullet list from an old reading months or years ago.
