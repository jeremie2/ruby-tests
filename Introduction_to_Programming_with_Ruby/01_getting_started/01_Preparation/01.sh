# Create a directory named my_folder and then navigate inside that 
# directory. Create two files named one.rb and two.rb in the my_folder
# directory. Write a ruby program that outputs the line this is file one
# when you run the one.rb file. Then write another program that outputs
# this is file two when you run the two.rb file. (Hint: one.rb should
# have this in it puts "this is file one")

mkdir my_folder
cd my_folder
echo 'puts "this is file one"' > one.rb
echo 'puts "this is file two"' > two.rb
ruby one.rb
ruby two.rb
