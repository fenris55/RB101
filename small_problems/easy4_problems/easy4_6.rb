=begin

problem:
write a method: take array of numbers and return new array of same length, but
with running total of input array

input: array of numbers (integers?)
output: no
return: array of numbers

rules:
assuming input is positive integers
empty input array should return empty array
for return array: each index should be the result of the sum of the previous elements

data: arrays

thoughts:
-need to take an return array
-array needs to be same length as original but transformed
--use #map?

examples:

running_total([2, 5, 13]) == [2, 7, 20]
running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
running_total([3]) == [3]
running_total([]) == []

def running_total(array)
  sum = 0
  array.map {|total| sum += total}
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []

# solve again using #each_with_object
def running_total(array)
  sum = 0
  array.each_with_object([]) do |num, arr|
    sum += num
    arr << sum
  end
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []

# solve again using #inject

#this solution taken from user submission - could not solve with inject
def running_total(array)
  array.inject([]) do |result, element|
    result << result.last.to_i + element #without #to_i, cannot convert nil??
  end
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []



retyring 1/30

problem:
write method that takes array and return array of running totals

input: array
output: none
return: array

rules:
-def method
-1 array argument
-return array returns 1 number same and each following number the result of
adding the previous elements
-empty array should return empty array
-single digit array should return self

data
-something iterative

examples:

code:
- take input array
- add first digit to new empty result array
-take second digit, add to elements of resutl array, and add as new arrray element

thoughts:
need to return a new array with new/transformed elements. Can achieve this by:
-initializing new empty array
-using #map
-using each_with_object

# cannot make this work
def running_total(arr)
  arr.map do |el|
    (arr[0]..el).inject do |total, element|
      total += element
      p total
    end
  end
end


# had to check solution
-placeholder varibale 'sum' is initialized to zero
- map is invoked on input array
- in each iteration, current array element is passed into block
- sum is reassigned to the return value of adding current array element to sum
- since reassignment is the last evaluated expression, the return is passed
-back to map as the block return value
map creates a new array with each newly added return value

Challenge: solve with #inject or #each_with_object

-WELL the good news is that I identified the 3 correct methods to get the job done
-but I'm tired and my brain's not working

def running_total(arr)
  sum = 0
  arr.map { |value| sum += value }
end

p running_total([2, 5, 13]) #== [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []

retrying 2/1

problem:
write a method that takes an array and returns an array of running totals

input:array
output: none
return: new array

rules:
-method def, 1 arg
-return new array with running totals
- first number of both arrays will be the same
-dont output anything
-empty or 1-digit arrays should return self

examples:
running_total([2, 5, 13]) == [2, 7, 20]
running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
running_total([3]) == [3]
running_total([]) == []

data:
iterative structure
"counter"/placeholder to hold previous sum

code:
-set placeholder variable to hold sum of previous digit
-iterate over input array
-on each iteration, reassign placeholder variable to result of adding current element
-this reassignment will be last evaluated expression/block return
-use an iterative method that takes return and places in new array (#map)
return new array

Notes: remembered without checking answer

Challenge: solve using #inject

def running_total(array)
  sum = 0
  array.map { |el| sum += el }
end

Challenge 1 notes:
-inject saves the total as the first parameter
-so, same process as above, but no external variable needed
-add from within block and return the sum on each iteration

hmm not working. need to work -- coming back later
can't figure it out. Trying with #each with object below and then checking
student answers

def running_total(array)
  new_array = []
  array.inject do |total, el|
  new_array << total
  total + el
    end
  new_array
end

notes:
-each_with_object takes new array as argument
-within block, need to perform the addition and populate new array

#UGH. took forever. looks like I needed to do the same thing as the first
solution -- initilaize a placeholder to hold the result of addition on each
iteration

def running_total(array)
  sum = 0
  array.each_with_object([]) do |num, arr|
  arr << sum += num
  end
end

#trying #inject once more
#got it, but had to partially look at solutions
confused about how inject is taking an empty array argument here
def revisit

def running_total(array)
  array.inject([]) do |total, num|
   if total.empty?
     total << num
   else
     total << num + total.last
   end
  end
end

p running_total([2, 5, 13]) #== [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []


=end
















