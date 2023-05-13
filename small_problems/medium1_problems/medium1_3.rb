=begin
3/1

problem:
write a method that takes an integer argument, performs the maximum amount of
rotation, and returns the final rotation

input: integer (number to be rotated)
output: none
return: integer (final rotation of input integer)

rules:
-rotate input integer to the left
-repeat until the number has rotated so that the last digit is now first
-return integer produced by final rotation
- a single integer argument will return self
-if the final rotation has a leading 0, it will be droppped from the return value
-input will not contain multiple zeros
- can use rotate_rightmost_digits method from previous exercise

examples:
max_rotation(735291) == 321579
  1st rotation: 352917
  2nd rotation: 329175 (1st digit reamins fixed)
  3d rotation: 321759 (2 first digits remain fixed)
  break - now the first 3 digits stay fixed. next is 7, which has already been rotated

max_rotation(3) == 3
max_rotation(35) == 53
max_rotation(105) == 15 # the leading zero gets dropped
max_rotation(8_703_529_146) == 7_321_609_845

data:
-array to hold digits in integer
-iterative structure to repeatedly perform rotation
-helper methods to perform rotation
-evaluative structure to identify when the break condition has been met
  (when no new rotations remain)

algorithm:
-need to iterate overe the input integer
-on each iteration, invoke the rotate_rightmost_digits method
  -passing integer as number and ?? as n
  -n is the same as the iteration number
  -first iteration moves index 0
  -second iteration moves index 1
-from 0 upto half of the size of the digits array

def rotate_array(arr)
  arr[1..-1] + [arr[0]]
end

def rotate_rightmost_digits(number, n)
  all_digits = number.to_s.chars
  all_digits[-n..-1] = rotate_array(all_digits[-n..-1]) # this is how they made it work
  all_digits.join.to_i
end

def max_rotation(integer)
  0.upto(integer.to_s.size / 2) { |count| rotate_rightmost_digits(integer, count) }
end

p max_rotation(735291) #== 321579
max_rotation(3) == 3
max_rotation(35) == 53
max_rotation(105) == 15 # the leading zero gets dropped
max_rotation(8_703_529_146) == 7_321_609_845


retrying 3/20

P:
write a method that takes an integer and returns the maximum rotation

input: integer (to be rotated)
return: integer (maximum rotation of the input integer)

rules:
-begin by rotating the leftmost digit to the end of the number
-keep leftmost digit fixed and then rotate 2nd leftmost digit to the end
-then keep the first 2 digits fixed and rotate the 3rd digit to the end
-repeat until no more digits are left to rotate after fixing the rotated digits
-don't worry about handling multiple 0s
-recommend to use help method frmo previous exercise
-if maximum rotation has a leading 0, the  0 will be dropped frmo the return value
-in the input integer is a single digit, return self
-when input integer has an odd number of digits, the middle number doesn't move
-when input integer has an even number digits,
  -the first half are the numbers that have been pushed forward
  -the second half are the number that have been popped onto the end

E:
max_rotation(735291) == 321579
max_rotation(3) == 3
max_rotation(35) == 53
max_rotation(105) == 15 # the leading zero gets dropped
max_rotation(8_703_529_146) == 7_321_609_845

D:
-helper method
-array to hold the digits in the input number

A:
-convert input number to an array
-pass array to

#took forever but solved it. Same as lesson solution

=end

def rotate_array(array)
  array[1..-1] + [array[0]]
end

def rotate_rightmost_digits(number, n)
  all_digits = number.to_s.chars
  all_digits[-n..-1] = rotate_array(all_digits[-n..-1])
  all_digits.join.to_i
end

def max_rotation(int)
  int_size = int.to_s.size
  int_size.downto(1) do |num|
    int = rotate_rightmost_digits(int, num)
  end
  int
end

#p max_rotation(735291) == 321579
#p max_rotation(3) == 3
#p max_rotation(35) == 53
p max_rotation(100005) == #15 # the leading zero gets dropped
#p max_rotation(8_703_529_146) == 7_321_609_845

=begin
#challenge: solve the above again without using the helper methods
i think we still cannot use #rotate

P:
write a method that takes a number and returns the maximum rotation of that number

input: integer
return: rotated integer

rules:
-rotate first number to the end of input integer
-leave ind 0 alone
-rotate element at index 1 to the end
-leave index 0 and 1 alone
-so, we can use the index to idenitfy which number to remove and add to the end
of the array, iterating from index 0 up to the length of array/integer - 2
(-1 for the 0-based index and then minues another 1 since the final number won't be moved)

D:
-array holding digits in the input integer
-iterative strucute to iterate over index position, remove number, and add to end of array

A:
-convert number to string and then to array of chars
-iterate from 0 up to 2 less than the array
-on each iteratation, removed element of chars array at current index position
-add to end of array
-when iteraton is complete, rejoin array to string
-convert string back to integer

def max_rotation(int)
  int = int.digits.reverse
  (0..int.size - 2).each do |idx|
     first = int[idx]
    int.delete(first)
    int << first
  end
  int.join.to_i
end


def max_rotation(int)
 p int = int.to_s.chars
  (0..int.size - 2).each do |idx|
 p    first = int[idx]
p    int.delete_at(idx)
 p   int << first
  end
  int.join.to_i
end

#p max_rotation(735291) == 321579
#p max_rotation(3) == 3
#p max_rotation(35) == 53
p max_rotation(105) #== 15 # the leading zero gets dropped
#p max_rotation(8_703_529_146) == 7_321_609_845

=end