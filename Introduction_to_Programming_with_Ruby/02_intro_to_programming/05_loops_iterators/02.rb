# Write a while loop that takes input from the user, performs an action, and
# only stops when the user types "STOP". Each loop can get info from the user.

word = ""

while word != 'STOP' do
  puts "Write 'STOP' to exit or write another word!"
  word = gets.chomp
  puts "Your word is: #{word}"
end