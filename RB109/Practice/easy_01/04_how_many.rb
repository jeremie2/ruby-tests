=begin

Write a method that counts the number of occurrences of each element
in a given array.

  vehicles = [
    'car', 'car', 'truck', 'car', 'SUV', 'truck',
    'motorcycle', 'motorcycle', 'car', 'truck'
  ]

  count_occurrences(vehicles)

The words in the array are case-sensitive: 'suv' != 'SUV'. Once counted,
print each element alongside the number of occurrences.

Expected output:

car => 4
truck => 3
SUV => 1
motorcycle => 2

::::::::::::::::: PEDAC

- input: array of strings element
- mid section: creation of a hash where:
               - keys are made of each element of the array (no repetition)
               - values are integers that count the number of repetitions of
                 each array's string
- output: strings representation of each key/value in the hash

Data structure:
- array
- hash to be created from array where each key has a related value that
  represents the number of each string's repetition in the array

Algorithm:
- given array `vehicles`
- create an empty hash `hsh`
- start a loop that takes each element `elem` of the array `vehicles`
  - if `hsh` has key `elem`, then add 1 to hsh[elem]
  - else create the hash pair element hsh[elem] = 1
  - end if
- end loop
- start loop on each key/value pair of `hsh`
  - for each pair print a string that looks like `KEY => VALUE`
- end loop

=end

def count_occurrences(arr)
  hsh = {}
  
  arr.each do |el|
    if hsh.key?(el)
      hsh[el] += 1
    else
      hsh[el] = 1
    end
  end

  ## ALTERNATIVES

  # hsh = Hash.new(0) # hash's values will be integers
  # arr.each { |el| hsh[el] += 1 }
  # hsh.each { |key, val| puts "#{key} => #{val}" }

  ## arr.tally directly creates the hash-counter we want 
  # arr.tally.each { |elem, count| puts "#{key} => #{val}" }
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)
