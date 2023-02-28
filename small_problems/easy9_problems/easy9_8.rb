=begin
2/26

problem:
write a method that takes a nested array, with each subarray holding a string
and an integer. Return an 1-d array with each string repeated int number of times

input: nested array
output: none
return: array

rules:
-input array is nested, with each subarray holding 1 string and 1 integer
-created and return a new array holding each strign repeated the number of
times indicated by the corresponding integer

examples:
buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]

data: iterative structure

algorithm:
-iterate over nested array, passed subarray into iteration
- use index reference to access subarray values and multiple the 1st element
  by the second element
-iterate using map, so the string multiplcation is the block return value
-flatten the nested array returned by map
  (alterantely, could use each and append each striing to a new array)

Notes: Nope. doesn work. need each item to be its own string. Instead, adding
each element to an array manually. Hmm that doesn't work either -- ignores the
multiplication

Ok. solving by invoking #times, using index reference to access the caller

def buy_fruit(list)
  list.each_with_object([]) do  |item, object|
     item[1].times { object << item[0] }
  end
end

#lesson solution is same, just saves index as variable
#offers a 2nd solution, see below:
# always forget you can assign block parameters to each element when passing
in a subarray. This solution solves the problem I had ealier by places the
string being multiplied into an array and then flattening

def buy_fruit(list)
  list.map { |fruit, quantity| [fruit] * quantity }.flatten
end

=end
#so I could have solved by doing: Good to know!

def buy_fruit(list)
  list.map { |item| [item[0]] * item[1] }.flatten
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
["apples", "apples", "apples", "orange", "bananas","bananas"]
