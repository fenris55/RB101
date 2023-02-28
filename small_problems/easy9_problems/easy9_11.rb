=begin
2/27

begin:
write a method that takes and array and returns an array holding only the
elements of the original array located at even indices

input: array
output: none
return: new array (assumption - not specified)

rules:
-return a new array holding elements at even indices of original array
-empty array should return empty array

alg:
iterate over input array, adding current el to new array if index is odd

def oddities(array)
  result = []
  array.each_with_index { |el, idx| result << el if idx.even? }
  result
end

#attempt 2
def oddities(array)
  result = []
  array.size.times { |idx| result << array[idx] if idx.even? }
  result
end

#attempt 3 - YES finally get select to work
=end

def oddities(array)
  array.select { |el| el if array.index(el).even? }
end

p oddities([2, 3, 4, 5, 6]) #== [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []
p oddities([1, 2, 3, 4, 1]) == [1, 3, 1]
