=begin
4/3

P:
write a method that takes a nested array and creates a new nested array. all
elements at index 0 of inner arrays should be placed into index 0 of new outer
array; all elements at index 1 of inner arrays should be placed into index 1 of
outer array, etc

input: nested array
output: new nested array

rules:
-do not mutate input array
-create and return new array
-every index position of elements within the inners correspond to the index they
should be moved to in the new array

E:
matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

D:
-new array for result
-iteration to loop over the input array and move subarray elements to the
corresponding index in the new nested array

A:
-initialize new_matrix to empty array
-iterate over matrix array (this passes a subarray into the block)
  iterate over matrix subarray with index position
  - place current element into array and push to the new_matrix array at the current iteration's
    index position
-return new_matrix

checked answer -- confusing. come back and review.

def transpose(matrix)
  new_matrix = []
  matrix.each do |subarray|
    subarray.each_with_index do |num, index|
      new_matrix << num
   end
  end
p new_matrix
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

#lesson solution:
=end
def transpose(matrix)
  result = []
  (0...matrix.size).each do |column_index|
    new_row = (0...matrix.size).map { |row_index| p matrix[row_index][column_index] }
    result << new_row
    p result
  end
  result
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix #== [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
