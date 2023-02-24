=begin
2/18

problem:
-write a method that takes an array argument and returns a new array with the
elements reversed (same as previous but non-mutating)

input: array
output: none
return: new array

rules:
-do not mutate original array
-new returned array should have original elements reversed
-do not use Array#reverse! or Array#reverse
- empty array or 1-element array should return self

data:
-new array object to hold result
-iterative structure to fill new array

examples;
reverse([1,2,3,4]) == [4,3,2,1]          # => true
reverse(%w(a b e d c)) == %w(c d e b a)  # => true
reverse(['abc']) == ['abc']              # => true
reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
list.object_id != new_list.object_id  # => true
list == [1, 3, 2]                     # => true
new_list == [2, 3, 1]                 # => true

algorithm:
-initialize new array(manually or could use #each_with_object?
-initialize counter at -1
-begin loop
-add element at array[counter] to new array
-decrement counter
-break if counter.abs > arr.length

NOTE: easy! now trying to refactor -- can this happen with an iterative method
rather than a loop? #each_with_object worked. Trying once more with #map.

LOL solution uses #reverse_each - not familiar. Trying below.

::reverse_each - similar to #each, but process elements in reverse order

Challenge: try using inject

def reverse(array)
  new_array = []
  counter = -1

  loop do
    break if counter.abs > array.size
    new_array << array[counter]
    counter -=1
  end
  new_array
end

def reverse(array)
  array.each_with_object([]) do |el, obj|
    obj.unshift(el)
  end
end

def reverse(array)
  new_array = []
  array.map {|el| new_array.unshift(el) }
  new_array
end

#lesson solution:

def reverse(array)
  result_array = []
  array.reverse_each { |el| result_array << el }
  result_array
end

=end
#challenge: use #inject

def reverse(array)
  array.inject([], :unshift) # had to check user-submitted solutions for this

end

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

p list = [1, 3, 2]                      # => [1, 3, 2]
p new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true