
=begin

Write a method that takes one argument, an array containing integers, and
returns the average of all numbers in the array. The array will never be empty
and the numbers will always be positive integers. Your result should also be an
integer.

puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

P
problem: given an array, return the integer average of all numbers

input: array of integers
output: integer

rules:
-assume array is never empty and integers are always positive
-perform integer division

E

D
currently, list of numbers is being held in an array
we'll need to result the result as a new object, so it could help to initialize
variable to save the result of addition before performing the division

A

-save the result of addition with an initial value of 0 (added_numbers = 0)
-go through the input array (numbers). Add each element of the array to
  added_numbers
  ----can hard-code a loop using a counter
  ----can use a built in loop like each to add each number to a added_numbers
  ----or can call a method to add the array elements together
-once addition is complete, divide added_numbers by the length of numbers and
return result

=end
=begin

#this attempt with `each` works. Trying again with a counter instead
def average(numbers)
  added_numbers = 0
  numbers.each do |number|
    added_numbers += number
  end
  result = added_numbers / numbers.length
  result
end

=end

=begin

def average(numbers)
  added_numbers = 0
  counter  = 0

  loop do
    current_num = numbers[counter]
    break if counter == numbers.size
    added_numbers += current_num
    counter += 1
  end

 result = added_numbers / numbers.size
 result
end

# average([10, 5, 2])
puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

=end
#success! solved hard-coding the loop (loop and counter), using a built-in looping
#method (each); now trying once more, using a built-in method to bypass
# iteration and perform addition directly on the array.
=begin
def average(numbers)
  numbers.inject(:+) / numbers.size
end

p average([1, 6])

puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

=end

=begin
challenge: change to float

def average(numbers)
  added_num = numbers.inject(:+)
  added_num.to_f / numbers.size
end

p average([1, 6])

Exercises changed - 8 is now Reverse the Digits in a Number

p: write a method that takes an integer and returns it reversed

input: integer
output: integer (input reversed)

rules:
inputs and output must both be integers
output must be reversed input
for reversal, trailing zeros don't matter (is, 1200 reversed can be 21)
single digit input should return self

algorithm:

-convert integer to string
-call #reverse method
  - alternatively, could turn int to an array, iterate through adding each element
  to new string - without reverse method, could pop off from end of array
-convert back to integer

=end
def reversed_number(int)
  int.to_s.reverse.to_i
end

p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1
