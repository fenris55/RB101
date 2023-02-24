=begin
2/18

problem: write a method that takes 2 arrays and returns them joined as one array
with no duplicates

input: 2 arrays
output: none
return: single array

rules:
-combine two arrays into one with duplicates deleted
- rules do not specify how the values should be joined
  only one test case - joins second to the end of first
-assume new array can be returned

data:
- could simply use a method (#merge) to join the two and then another (#uniq) to delete copies

example:
merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

Algorithm1: concatenate arr2 to arr1 and save as new arr; flatten and delete copies

Algorithm2:
-initialize empty array
- iterate over arr1 and add to new array if current el not included
- iteratte over arr2 and add to new arr if current el not included

def merge(arr1, arr2)
  new_arr = arr1 << arr2
  new_arr.flatten.uniq
end

def merge(arr1, arr2)
  result_arr = []
  arr1.each { |el| result_arr << el unless result_arr.include?(el) }
  arr2.each { |el| result_arr << el unless result_arr.include?(el) }
  result_arr
end

both above work. Lesson solution uses the Array#| method = new!
-combines 2 array in order omitting duplicates
=end

def merge(arr1, arr2)
  arr1 | arr2
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
