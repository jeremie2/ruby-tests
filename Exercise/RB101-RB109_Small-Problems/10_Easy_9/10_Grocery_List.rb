# Write a method which takes a grocery list (array) of fruits with quantities and converts it into an array of the correct number of each fruit.


#### ANSWER

def buy_fruit(fruit_quantity)
  fruits = []
  fruit_quantity.each do |elem|
    elem[1].times { fruits << elem[0] }
  end
  fruits
end

puts buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]


#### SOLUTION 2

def buy_fruit(list)
  list.map { |fruit, quantity| [fruit] * quantity }.flatten
end

# where [fruit] * quantity is, example:

['lemon'] * 3  # ["lemon", "lemon", "lemon"]
