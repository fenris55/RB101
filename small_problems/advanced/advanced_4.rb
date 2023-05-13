=begin
4/5

P:
modify previous solution to work with any size matrix (not just 3)

input: nested array
return: nested array

rules:
-method must transpose a matrix from rows to columns
-input array can be as small as 1 (single element is both row and column)
-basically the indices flip -- array[x][y] becomes array[y][x] for every element

E:
transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
#input is a nested array with only 1 element - this is the single row, which
has 4 columns. Return value places each of these into its own array, so the
return array 4 elements
arr[0][0], arr[0][1], arr[0][2], arr[0][3] -> arr[0][0], arr[1][0], arr[2][0], arr[3][0]

transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
#this example is the reverse of the first

transpose([[1]]) == [[1]] -> returns self (arr[0][0] -> arr[0][0])

transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) == [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
arr[0][0], [0][1], [0][2], [0][3],[0][4]

D:
-result array
-nested iterative structure to access and reverse the indices of both the subarray and the individual element

A:
-initialize empty result array
-iterate from 0 to 1 less than the size of the input array
  -begin inner iteration from 0 to 1 less than size of first array element
    -use index reference to swap the first and second index
    -save this as a new variable
    -add to result array
-return resutl array

=end
def transpose(matrix)
  result = []
  (0...matrix.first.size).each do |outer_index|
   new_column = (0...matrix.size).map { |inner_index| matrix[inner_index][outer_index] }
    result << new_column
   end
 p result
end

p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]