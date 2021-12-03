=begin

Create a simple tip calculator. The program should prompt for a bill amount
and a tip rate. The program must compute the tip and then display both the
tip and the total amount of the bill.

Example:

  What is the bill? 200
  What is the tip percentage? 15

  The tip is $30.0
  The total is $230.0

::::::::::::::::: PEDAC

input: two integers (bill amount and tip rate)
output: two integers (tip and bill amount)

data structure:
- just use the given data

algorithm
- print a string asking for the bill amount
- assign user's output to variable `bill`
- print a string asking for tip rate
- assign the user's output to variable `tip_rate`
- assign the product between `bill` and `tip_rate` divided by 100 to `tip`
- assign the sum between `bill` and `tip` to `total`
- print the value of `tip`
- print the value of `tot`

=end

def tip
  puts "What is the bill? "
  bill = gets.to_f
  puts "What is the tip percentage? "
  tip_rate = gets.to_f

  tip = ((bill * tip_rate) / 100).round(2)
  tot = bill + tip

  puts "The tip is $#{tip}"
  puts "The total is $#{tot}"
end

tip

=begin
::::::::::::::::: Further Exploration

Our solution prints the results as $30.0 and $230.0 instead of the more usual
$30.00 and $230.00. Modify your solution so it always prints the results with
2 decimal places.

=end

def tip
  puts "What is the bill? "
  bill = gets.to_f
  puts "What is the tip percentage? "
  tip_rate = gets.to_f

  tip = ((bill * tip_rate) / 100)
  tot = bill + tip

  puts "The tip is $#{format('%.2f', tip)}"
  puts "The total is $#{format('%.2f', tot)}"
end

tip
