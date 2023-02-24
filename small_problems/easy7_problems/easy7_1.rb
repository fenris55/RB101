=begin
2/18

problem:
write a method that combines two arrays by alternating the elements, starting
with the 1st element of the first array

input: 2 arrays
output: none
return: 1 array

rules:
-the arrays must be combine by alternating the elements
-first element of first array should be first in returned array
-assume both arrays have same number of elements (and neither is empty)
-arrays can have strings, ints, etc

example:
interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

algorithm1:
-can initialize new empty array
-initalize counter
-use index reference to add elements
-increment counter

def interleave(arr1, arr2)
  result = []
  counter = 0
  loop do
    break if counter == arr1.size
    result << arr1[counter]
    result << arr2[counter]
    counter += 1
  end

  result
end

#algorithm2:
could iterate over arrays one at a time, incrementing counter by 2

Lesson solution uses #each_with_index to simulateously access both arrays

def interleave(arr1, arr2)
  result = []
  arr1.each_with_index do |el, index|
    result << el << arr2[index]
  end
  result
end

#challenge: use #zip and find other similar method - #transpose works

def interleave(arr1, arr2)
  arr1.zip(arr2).flatten
end

=end

def interleave(arr1, arr2)
  [arr1, arr2].transpose.flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
