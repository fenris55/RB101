=begin
2/21

problem:
write a method that takes 2 array arguments an return and array holding the
result of multiplying all possible number pairs, with results sortest smallest
to largest

input: 2 arrays
output: none
return: array

rules:
-find all possible pairs of numbers in 2 arrays
-find product of each pair
-place products into new array
-sort by size and return

data:
-array for holding return value
-iteration/method for finding all pairs
-another iteration for performing multiplicaiton

example:
multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

algorithm:
-step one: find all pairs (nested array)
  -can do this manually or with a method (Array#product)
step two: find products:
  pass in sub array and perform multiplication
  - can use index reference or #first and #last to access subarray elements
  - perform iteration using #each_with_object and returns will be placed in array
step 3: sort result

def multiply_all_pairs(arr1, arr2)
  pairs_array = arr1.product(arr2)
  result = pairs_array.each_with_object([]) do |pair, arr|
    arr << pair.first * pair.last
  end
  p result.sort
end

#can refactor as:

def multiply_all_pairs(arr1, arr2)
  arr1.product(arr2).map { |num1, num2| num1 * num2 }.sort # forgot you can pass in array elements this way
end

#other lesson solution:
=end

def multiply_all_pairs(arr1, arr2)
  products = []
  arr1.each do |item_1|
    arr2.each do |item_2|
      products << item_1 * item_2
    end
  end
  products.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
