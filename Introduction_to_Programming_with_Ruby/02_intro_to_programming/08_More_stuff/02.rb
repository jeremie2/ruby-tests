# What will the following program print to the screen? What will it return?
# 
# def execute(&block)
#   block
# end
# 
# execute { puts "Hello from inside the execute method!" }


def execute(&block)
  block
end

execute { puts "Hello from inside the execute method!" }


# ANSWER:
#
# It doesn't print anithing because it's written:
# block
# instead of:
# block.call
# 
# It returns a Proc object.
