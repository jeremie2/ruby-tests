# What will the following programs return? What is the value of arr after each?
# 
# 1. arr = ["b", "a"]
#    arr = arr.product(Array(1..3))
#    arr.first.delete(arr.first.last)
# 
# 2. arr = ["b", "a"]
#    arr = arr.product([Array(1..3)])
#    arr.first.delete(arr.first.last)


# 1.
["b", "a"].product([1, 2, 3])
[ ['b', 1], ['b', 2], ['b', 3], ['a', 1], ['a', 2], ['a', 3] ]
arr.first → ['b', 1]  ..and   arr.first.last → 1
['b', 1].delete(1)

returns: 1
arr: [ ['b'], ['b', 2], ['b', 3], ['a', 1], ['a', 2], ['a', 3] ]


# 2.
['b', 'a'].product([ [1, 2, 3] ])
[ ['b', [1, 2, 3]], ['a', [1, 2, 3]] ]
arr.first → ['b', [1, 2, 3]]  ..and   arr.first.last → [1, 2, 3]
['b', [1, 2, 3]].delete([1, 2, 3])

returns: [1, 2, 3]
arr = [ ['b'], ['a', [1, 2, 3]] ]