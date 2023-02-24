=begin
2/20

problem:
write a method that takes an array of integers, multiplies elements, divides
by number of elements, and PRINTs result rounded to 3 decimals

input: array (of integers)
output: math solution
return - not specified - string or nil

rules:
-perform math described
-assume input array is non-empty
-must print from within method

data:
iterative strucute for multiplying
string to hold output

examples:
show_multiplicative_average([3, 5])                # => The result is 7.500
show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667

algorithm:
-iterate over input array multiplying elements
  (#inject, initialize local variable to 1 and * by that)
-divide result by size of array
-round result to 3 decimal points (so we should convert the above to floats)
-print string with result interpolated
=end

def show_multiplicative_average(array)
  product = array.inject { |total, num| total *= num }
  mean = product.to_f / array.size.to_f
  p "The result is #{format('%.3f', mean)}"
end

show_multiplicative_average([3, 5])                # => The result is 7.500
show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667
