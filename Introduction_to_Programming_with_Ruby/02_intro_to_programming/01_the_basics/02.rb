# Use the modulo operator, division, or a combination of both
# to take a 4 digit number and find the digit in the: 1) thousands
# place 2) hundreds place 3) tens place 4) ones place

number = 4562

thousands = 4562 / 1000
hundreds = 4562 % 1000 / 100
tens = 4562 % 100 / 10
ones = 4562 % 10

puts thousands
puts hundreds
puts tens
puts ones




