# Write a method that counts the number of occurrences of each element
# in a given array.

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)

# The words in the array are case-sensitive: 'suv' != 'SUV'. ` Once counted,
# print each element alongside the number of occurrences.
# Expected output:
#
# car         => 4
# truck       => 3
# SUV         => 1
# motorcycle  => 2

######## ANSWER

def count_occurrences(vehicles)
  container = {}        # {'car' => ['car', 'car'...], 'truck' => ['truck'...] ...}
  vehicles.each do |i|
    if container.has_key?(i)
      container[i] << i
    else
      container[i] = [i]
    end
  end
  container.each { |key, val| puts "#{key} => #{val.size}"}
end

######## SOLUTION

def count_occurrences(array)
  occurrences = {}

  array.uniq.each do |element|
    occurrences[element] = array.count(element)
  end

  occurrences.each do |element, count|
    puts "#{element} => #{count}"
  end
end

# #count is doing the job, counting automatically how many
# 'cars', 'truck', etc.. are in the array.

######## EXTRA

# Try to solve the problem when words are case insensitive.
# e.g. "suv" == "SUV".

#### ANSWER

def count_occurrences(array)
  occurrences = {}

  array.map!(&:downcase).uniq.each do |element|
    occurrences[element] = array.count(element)
  end

  occurrences.each do |element, count|
    puts "#{element} => #{count}"
  end
end

# instead of:
#   array.uniq.each
# we can convert to down-case:
#   array.map!(&:downcase).uniq.each
#
# For readability:

def count_occurrences(array)
  occurrences = {}
  array = array.map(&:downcase)

  array.uniq.each { |elem| occurrences[elem] = array.count(elem) }
  occurrences.each { |elem, count| puts "#{elem} => #{count}" }
end

######## OTHER SOLUTIONS

# from Yves Creemers

def count_occurrences(vehicles)
 vehicles.tally.each { |element, count| puts "#{element} => #{count}" }
end

# #tally does the complete job. It returns a hash that counts
# occurrences: %w(a b b c a).tally  # =>  {'a' => 2, 'b' => 2, 'c' => 1}
