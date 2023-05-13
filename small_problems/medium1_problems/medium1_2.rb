=begin
2/28

problem:
write a method that takes two integers arguments. The method should rotate the
first integer starting on the right, and rotate the number of integers
indicated by the second integer argument.

input: 2 integers (arg1 = integer to rotate arg2 = number of integers to rotate )
output: none
return: integer (arg1 rotated according to arg2)

rules:
-when the second argument is 1, return original first integer
  -when second argument is 2, rotate only the two rightmost integers, etc
-can use rotate_array method previously written
-assume second argument is always positive

thoughts:
-essentialy, adding a negative to the second argument indicates the index
  that should be removed and placed at the end of the first integer:
ex: rotate_rightmost_digits(735291, 3) == 735912
-integer at index -3 is being removed and then appended

examples:
rotate_rightmost_digits(735291, 1) == 735291
rotate_rightmost_digits(735291, 2) == 735219
rotate_rightmost_digits(735291, 3) == 735912
rotate_rightmost_digits(735291, 4) == 732915
rotate_rightmost_digits(735291, 5) == 752913
rotate_rightmost_digits(735291, 6) == 352917

data:
-array to hold the digits composing the first integer argument
-helper method

agorithm:
Step 1
-split first integer argument into an array digits (#digits)
Step 2
- remove and save the digit to be rotated (indicated by argument 2)
  -delete array element at index -(number indicated by argument 2)
  -save return the return value of this method call as moving_number
Step 3
-concatenate moving_number to the end of mutated array of digits
Step 4
-convert array to string
Step 5
-convert string to integer

def rotate_rightmost_digits(main_number, mover)
  digits_array = main_number.digits.reverse
  moving_number = digits_array.delete(digits_array[-mover])
  digits_array << moving_number
  digits_array.join.to_i
end

#solved; BUT problem recommends using the rotate_number method from medium 1.1
not sure how to make that work in this context. Tomorrow.

#Notes: solved below using the helper method. Ended up being very similar to
first solution, but basically with an extra step. Feeling like there was a
better way to handle this -- otherwise, not sure why using the helper is
recommended.

def rotate_array(arr)
  arr[1..-1] + [arr[0]]
end

def rotate_rightmost_digits(main_number, mover)
  main_number_array = main_number.digits.reverse
  last = main_number_array.delete(main_number_array[-mover])
  main_number_array.unshift(last)
  rotate_array(main_number_array).join.to_i
end

#Lesson solution below:

def rotate_array(arr)
  arr[1..-1] + [arr[0]]
end

def rotate_rightmost_digits(number, n)
  all_digits = number.to_s.chars
  all_digits[-n..-1] = rotate_array(all_digits[-n..-1]) # this is how they made it work
  all_digits.join.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917



retrying 3/20

P:
write a method that takes two integers and rotates the number of digits specified
by the second number in the first number, starting from the right

input: 2 integers (int to rotate and the number of digits to rotate)
return: rotated integer

rules:
-rotate digits from -arg2 to -1 of arg1
-if arg2 is 1, the number will not be rotated (return self)
-arg2 will always be positive
-can used helper method from previous exercise

E:
rotate_rightmost_digits(735291, 1) == 735291
rotate_rightmost_digits(735291, 2) == 735219
rotate_rightmost_digits(735291, 3) == 735912
rotate_rightmost_digits(735291, 4) == 732915
rotate_rightmost_digits(735291, 5) == 752913
rotate_rightmost_digits(735291, 6) == 352917

D:
-string to hold string version of arg1
-variable to hold removed digit
-can use helper method

A:
-convert arg1 to a string
-delete element at negative index specified by arg2
  -store deleted element in a local variable
-push the stored element to the end of the string
-convert string back to integer and return

def rotate_rightmost_digits(int1, int2)
  int1 = int1.to_s
  removed_digit = int1[-int2]
  (int1.delete(int1[-int2]) << removed_digit).to_i
end

#lesson solution
=end
def rotate_array(array)
  array[1..-1] + [array[0]]
end

def rotate_rightmost_digits(int1, n)
  all_digits = int1.to_s.chars
  all_digits[-n..-1] = rotate_array(all_digits[-n..-1])
  all_digits.join.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917













