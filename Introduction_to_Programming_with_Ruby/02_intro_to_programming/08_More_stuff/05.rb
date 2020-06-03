# Why does the following code...
# 
# def execute(block)
#   block.call
# end
# 
# execute { puts "Hello from inside the execute method!" }
# 
# Give us the following error when we run it?
# 
# block.rb1:in `execute': wrong number of arguments (0 for 1) (ArgumentError)
# from test.rb:5:in `<main>'


# ANSWER:
#
# Beacause when a block is the argument of a method, it mast be
# written together with '&' character: &block