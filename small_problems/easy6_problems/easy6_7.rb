=begin
2/18

problem:
write a method that takes an array, splits in in half, and returns the result
as a 2-element nested array

input: array
output: none
return: nested array (2 elements)

rules:
-method should takes array, split in half, and return as a nested array with 2 elements
-if array has odd number of elements, the extra el should be placed in the first array
-empty array should return nested empty arrays
-1-element array should return 1-element and empty arrays

examples:
halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
halvsies([5]) == [[5], []]
halvsies([]) == [[], []]

data:
control flow for if array has odd or even length
new array to hold result

algorithm:
if array length is even
add array[0, array.length/2] to new array and then array[-1, array.lenth/2]
- if odd, same but add 1

NOTES; made up some additional test cases. Everyting passes, but don't love
this solution. I think it's confusing.

def halvsies(arr)
  result = []
  if arr.size.even?
    result << arr[0, arr.length/2]
    result << arr[arr.length/2, arr.length]
  elsif arr.size.odd?
    result << arr[0, (arr.length/2 + 1)]
    result << arr[(arr.length/2 + 1), arr.length]
  end
end
=end
#lesson solution

def halvsies(array)
  middle = (array.size / 2.0).ceil # makes 1st array larger if size is odd
  first_half = array.slice(0, middle)
  second_half = array.slice(middle, array.size - middle)
  [first_half, second_half]
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]
# my test cases
p halvsies([1, 2, 3, 4, 5, 6, 7, 8]) == [[1, 2, 3, 4], [5, 6, 7, 8]]
p halvsies([1, 2, 3, 4, 5, 6, 7, 8, 9]) == [[1, 2, 3, 4, 5], [6, 7, 8, 9]]
p halvsies([1, 2, 3]) == [[1, 2], [3]]