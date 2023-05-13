=begin
2/27

problem:
write a method that takes and array and rotates the first element to the end.
Do not use #rotate and do not modify original array.

input: array
output: none
return: new array

rules:
-takes first element of input array and move to last element
-do not modify original array (return new array)
-do not use #rotate or #rotate
-single element array will look same, but needs to be a new object (possible edge case)

examples:
rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]                 # => true

algorithm:
-use index reference to save first array element
-drop first el off array
-

alg2
-can i transform?
-iterate with map
-if el is first elemnet of array, ell now equals last?

#nope it's midnight - come back tomorrow

def rotate_array(arr)
  arr.map do |el|
    if el == arr.first
      arr.drop(1)
      el = arr.last

    else
      el
    end
  end
end

#solved! was too tired. Let it simmer today.
lol unnecessary to save...could just use index reference directly

def rotate_array(arr)
  first = arr[0]
  rest = arr[1..arr.size - 1]
  rest << first
end

def rotate_array(arr)
  arr[1..-1] + [arr[0]] # can use #+ by placing arr[0] into an array
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true

#Challenge: repeat, but with string and then integer input. Can use rotate_array
method above to solve

def rotate_array(arr)
  first = arr[0]
  rest = arr[1..arr.size - 1]
  rest << first
end

def rotate_array(arr)
  arr[1..-1] + [arr[0]] # can use #+ by placing arr[0] into an array
end

def rotate_string(string)
  result = rotate_array(string.chars)
  result.join
end

p rotate_string('lemonade') == 'emonadel'
p rotate_string('i see you') == ' see youi'

#Challenge now integers

def rotate_array(arr)
  arr[1..-1] + [arr[0]]
end

def rotate_integer(int)
  rotate_array(int.digits.reverse).join.to_i
end

p rotate_integer(56789) == 67895


x = 1234
p rotate_integer(x) == 2341   # => true
p x == 1234

retyring 3/19

P:
write a method that rotate the first element of an array to the end. Do not
use rotate and do not modify original array

input: array
return: new array (rotated copy of original)


def rotate_array(array)
  return array.dup if array.size == 1
   array = array.dup
   first = array.first
   last = array[1, array.size - 1]
   last << first
end

ugh. could have done:

def rotate_array(arr)
  arr[1..-1] + [arr[0]]
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]

def rotate_string(str)
  str[1..-1] + str[0]
end

p x = 'catdog'
p rotate_string(x) == 'atdogc'
p x == 'catdog'

def rotate_array(arr)
  arr[1..-1] + [arr[0]]
end

def rotate_string(str)
  rotate_array(str.chars).join
end

p x = 'catdog'
p rotate_string(x) == 'atdogc'
p x == 'catdog'

def rotate_int(int)
  nums = int.digits.reverse
  (nums[1..-1] + [nums[0]]).join.to_i
end

n = 34567
p rotate_int(n) == 45673
p n == 34567

=end
def rotate_array(arr)
  arr[1..-1] + [arr[0]]
end

def rotate_int(int)
  rotate_array(int.digits.reverse).join.to_i
end

n = 34567
p rotate_int(n) == 45673
p n == 34567