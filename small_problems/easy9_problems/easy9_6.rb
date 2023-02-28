=begin
2/26

problem:
write a method that takes 2 integers, a count and a number. Return an array
with count elements, and each element is a multiple of the number.

input: 2 integers
output: none
return: array

rules:
-count is 0 or greater
-number can be any number: positive, negative or zero
-if count is 0, return empty array
-if number is 0, return array holding count zeros

examples:
sequence(5, 1) == [1, 2, 3, 4, 5]
sequence(4, -7) == [-7, -14, -21, -28]
sequence(3, 0) == [0, 0, 0]
sequence(0, 1000000) == []

data:
array to hold result
-iterative structure

algorithm
-basically need to start at zero and set iteration to go upto count
-on each iteration, multiply number by current iteration

def sequence(count, number)
  result = []
  1.upto(count) { |multiplier| result << multiplier * number }
  result
end

#first lesson solution uses #times:

def sequence(count, first)
  sequence = []
  number = first

  count.times do
    sequence << number
    number += first
  end

  sequence
end

#second lesson solution uses #map and a range:
=end

def sequence(count, first)
  (1..count).map { |value| value * first }
end

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(0, 1000000) == []
