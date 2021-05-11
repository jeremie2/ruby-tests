# Write a method that takes a string, and returns a new string in which every 
# character is doubled.

#### ANSWER

def repeater(str)
  str.chars.map { |ch| ch * 2 }.join
end

puts repeater('Hello') == "HHeelllloo"
puts repeater("Good job!") == "GGoooodd  jjoobb!!"
puts repeater('') == ''
