=begin
2/20

problem: write a method that takes two arrays of integers, multiplies the
elements at corresponding indices, and returns an array of the products

input: 2 arrays of integers
output: none
return: array of integers

rules:
-assume both arrays hold the same number of elements
-multiply the array elements at corresponding indices
store resutls in new array and return

data:
need a iterate over 2 arrays at once
-maybe a count to keep track of index

examples:
multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

algorithm:
simplest  way is with a loop:
-initialize empty array and counter set to 0
-access array elements using counter; multiply and add to new array
-increment counter
repeat til finished

def multiply_list(arr1, arr2)
  result = []
  counter = 0

  loop do
    break if counter == arr1.size
    result << arr1[counter] * arr2[counter]
    counter += 1
  end

  result
end

# okay easy - trying again with a method

def multiply_list(arr1, arr2)
  result = []
  arr1.each_with_index { |el, idx| result << el * arr2[idx] }
  result
end

#challenge: create a one-line solution using Array#zip

=end

def multiply_list(arr1, arr2)
  arr1.zip(arr2).map { |pair| pair[0] * pair[1] }
end

p multiply_list([3, 5, 7], [9, 10, 11]) #== [27, 50, 77]

