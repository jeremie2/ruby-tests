# You are given a method named spin_me that takes a string as an argument and 
# returns a string that contains the same words, but with each word's characters 
# reversed. Given the method's implementation, will the returned string be the same 
# object as the one passed in as an argument or a different object?

def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

####### ANSWER

# The returned string is a different object. Once the string
# is passed to 'str' method parameter, inside it an array is created
# to apply the needed transformations. Then from the result on the
# array a new string is created.
# We can see here the #object_id method that shows that the two
# strings are different objects:

string = "hello world"
puts string.object_id           # 60
puts spin_me(string)            # "olleh dlrow"
puts spin_me(string).object_id  # 80
puts string                     # "hello world"
puts string.object_id           # 60


####### from SOLUTION

# [..] if we rework this method to use an array argument instead of a string and we 
# reversed each word in it by calling the same methods, then the array that was 
# passed in as an argument and the array that was returned from the method would be 
# the same object. Again, we can test this.

def spin_me(arr)
  arr.each do |word|
    word.reverse!
  end
end

arr = ['hello', 'world']
puts arr.object_id # 47264354160220
puts spin_me(arr).object_id # 47264354160220
