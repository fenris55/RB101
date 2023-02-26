=begin
2/24

problem: write a method that takes an array of integers and returns the average

input: array (of integers)
output: none
return: integer

rules:
-find average of numbers in array
-perform integer division
-don't use #sum
-assume array is never empty and ints are always positive

examples:
puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

algorithm:
-iterate over array to find sum
  -1 can use inject
  -can set variable to 0 and add each element to find total
-divide above result by size of array

def average(array)
  sum = array.inject {|total, num| total += num }
  sum / array.length
end

#lesson solution mentions using a symbol instead of a block:

def average(array)
  result = array.reduce(:+)
  result / array.count
end

#Challnege: change return from whole number to float
=end

def average(array)
  sum = array.inject {|total, num| total += num }
  sum.to_f / array.length.to_f
end
puts average([1, 6]) #== 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) #== 25
puts average([9, 47, 23, 95, 16, 52]) #== 40
