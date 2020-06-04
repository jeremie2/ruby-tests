# What will the following program output?

hash1 = {shoes: "nike", "hat" => "adidas", :hoodie => true}
hash2 = {"hat" => "adidas", :shoes => "nike", hoodie: true}

if hash1 == hash2
  puts "These hashes are the same!"
else
  puts "These hashes are not the same!"
end


# ANSWER:
# 
# These hashes are the same!
# Because hashes don't take in consideration the position
# of the elements or the syntax style (old or new style).