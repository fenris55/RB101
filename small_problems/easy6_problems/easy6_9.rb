=begin
2/18

problem: write a method that takes an array of integers and a search value, and
returns a boolean indicating whetehr search value is included in the array

input: array (of integers) and integer (2 args)
output: none
return: boolean

rules:
-do not use Array#include?
-check wether 1st arg includes 2nd arg and return true/false
-either input can include nil
-array can be empty or hold nil

examples:
include?([1,2,3,4,5], 3) == true
include?([1,2,3,4,5], 6) == false
include?([], 3) == false
include?([nil], nil) == true
include?([], nil) == false

algorithm1
- could just use #any?

algorithm2
- could iterate over array, checking whetehr each element is equal to the search integer

def include?(arr, int)
  arr.any?(int)
end

def include?(arr, int)
  arr.each { |el| return true if el == int } #explicit return - exits method
  false #explicitly returning false if no true is returned above
end

def include?(arr, int)
  booleans = arr.select { |el| el == int }
  !booleans.empty?
end

=end
#lesson solution uses #find_index and int as arg - fill return nil if not present, and then !! forces a boolean

def include?(arr, int)
  !!arr.find_index(int)
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false
