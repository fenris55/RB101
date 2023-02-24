=begin
2/18

problem: write a method that takes an array argument and mutates the array by
reversing the elements in place - must return same array object

input: array
output: none
return: same array object

rules:
-do not use Array#reverse or Array#reverse!
-reverse array elements
-return original array object
-empty array and 1-element array should return self
-array can hold any? elements
-case sensitivity not mentioned

data:
-there's a method that shifts each array object to the end - (Array#rotate!)

examples:
list = [1,2,3,4]
result = reverse!(list)
result == [4, 3, 2, 1] # true
list == [4, 3, 2, 1] # true
list.object_id == result.object_id # true

list = %w(a b e d c)
reverse!(list) == ["c", "d", "e", "b", "a"] # true
list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
reverse!(list) == ["abc"] # true
list == ["abc"] # true

list = []
reverse!(list) == [] # true
list == [] # true

algorithm:
-easy - call rotate! on input array - not working
-manual:
  -some type of iterative process needs to happen
  - can we save each element and re-add it to the array in opposite order?
  maybe #map!

NOTE: couldn't figure this out. lesson solution below.
solution uses 2 indexes (counter), one at the start and one at the end. It
manually reverses the array elements at the beginning and end. Both indexes
are incremented by 1, moving in one element and then reversing the next set of
elements. the break statement takes the array size and cuts it in half, ensuring
that the exchange stops at the halfway point.
=end

def reverse!(array)
  left_index = 0
  right_index = -1

  while left_index < array.size / 2
    array[left_index], array[right_index] = array[right_index], array[left_index]
    left_index += 1
    right_index -= 1
  end
  array
end

list = [1,2,3,4]
result = reverse!(list)
p result == [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true

list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
p reverse!(list) == ["abc"] # true
p list == ["abc"] # true

list = []
p reverse!(list) == [] # true
p list == [] # true