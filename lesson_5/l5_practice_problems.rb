# RB101 - Lesson 5 Practice Problems

=begin
p
given an array of string representations of integers, sort the string in
descending numeric order

input: array of strings
output: array of ordered strings

d: array, looping structure

e

a

-loop through original string, converting each string to an integer
--map returns a new array containing the return values fomr each iteration of
  the block
  -seems like a good way to achieve the desires output
  --do we need a nested loop to then sort the integers?
  can be save the result of map (array of integers) and then call sort on the result?
  ---anoter option would be to use a comparator set to 1 (bigger first) rather
  than -1 (smaller first)
-sort array elements (inow integers) from greatest to smallest
-return as a new array object

arr = ['10', '11', '9', '7', '8']

result = arr.sort do |a, b|
  b.to_i <=> a.to_i
end

p result

# Nice! same as lesson solution.

# Problem 2

order the array of hashes by publication date, from oldest to newest

notes:
-dates are in string format
-given the specific dates involved, converting to integers isn't necessary in
this case - string sorting will return the correct order
-will need to nest our looping; 1 to break into array, 2 to accesses correct
hash key
-need to return a new collection
--out map, inner sort?
start with map to access each hash

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

result = books.sort_by do |book|
  book[:published]
end

p result

#was on the right track with this, but was nesting too much. Only needed 1 level
had to check result (was using sort_by, but I was setting 2 parameters and
trying nnecessarily to force the sort)

what i did right: realized we needed to break into the outer array
realze we didn't need to go further into the hashes
identified that sort_by would achieve the goal
recognized that integer conversion was unneccesary

# Problem 3

For each of these collection objects demonstrate how you would reference the letter 'g'

arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]

notes:
-need 3 nested iterations; 1 to enter the outer array, 2 to enter the sub
array, and 3 to enter the sub-subarray
-need an if statement to control the flow (handling wether current element is
a string or an array)

--***what is meant by 'reference' g?? just like index reference??
YES. ignore above - no looping needed

#arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
#p arr1[2][1][3]

#arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
#p arr2[1][:third][0]

#arr3 = [['abc'], ['def'], {third: ['ghi']}]
#p arr3[2][:third][0][0]

#hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
#p hsh1['b'][1]

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
p hsh2[:third].key(0)

#did these all without checking the answer! first 4 were easy - had to think
#about the last - wasn't sure a method should be used, but seems like there's no
#other way

Problem 4

For each of these collection objects where the value 3 occurs, demonstrate how
you would change this to 4

--ok - using reference like above, but now combined with reassignemnt

#arr1 = [1, [2, 3], 4]
#arr1[1][1] = 4
#p arr1

#arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]

#arr2[2] = 4
#p arr2

#hsh1 = {first: [1, 2, [3]]}
#hsh1[:first][2][0] = 4
#p hsh1

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
hsh2[['a']][:a][2] = 4
p hsh2

#Again - all correct without checking the answer! the final was interesting;
#learning that when a hash key is an array, use the entire array to reference

Problem 5
Given the hash belong, add up the ages of the male family members

going to need to break into the outer hash
access the values (sub hash) of each array element
evaluate the result of "gender" key
 --transform by adding together IF gender == male
 return result of addition

 -do we need to use a variable to hold addition result?

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

#glanced at solution; trying my own attempt using `each_with_value`
#solved, but needed to see which method to use

total_age = 0
munsters.each_value do |value|
  if value["gender"] == "male"
    total_age += value["age"]
  end
end

p total_age

Problem 6
Print info from above hash in sentence like below:
(Name) is a (age)-year-old (male or female).

a:
save and name separate collections of the names and data in array/array of hash
use string interpolation with index/hash reference to fill sentence

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

names = munsters.keys # array - names of family members
data = munsters.values #hashes of info for each family member (2 keys: ages, gender)

ages = []
genders = []
munsters.each do |person, info|
  info.each do |key, value|
    if key == "age"
    ages << value
    elsif key == "gender"
    genders << value
  end
  end
end

counter = 0
loop do
  break if counter == names.size
  puts "#{names[counter]} is a #{ages[counter]}-year-old #{genders[counter]}."
  counter += 1
end

provided solution is SO SIMPLE but this was good looping practice

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each_pair do |name, pair|
  puts "#{name} is a #{pair["age"]} year old #{pair["gender"]}."
end

Problem 7

identify the return values

a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a

p a
p b
p arr

Problem 8

Using the each method, write some code to output all of the vowels from the strings

-use `each`
-set key and value as parameters
--each parameter is an array
  use nested each to iterate over each array element (values)
  split up words into array of individual letters?
  -iterate over each letter
-set array of vowels
--if the current letter includes a vowel
--print the current letter

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each do |_, value|
  value.each do |word|
    word.chars.each do |letter|
      if %w(a e i o u).include?(letter)
        puts letter
      end
    end
  end
end

Problem 9

Given this data structure, return a new array of the same structure but with the
sub arrays being ordered (alphabetically or numerically as appropriate) in
descending order.

-actually, no conversion or flow control needed -- string comparison is
sufficient in this case to sort the array elements

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

result = arr.map do |array|
  array.sort do |a, b|
    b <=> a
  end
end

p result

Problem 10

Given the following data structure and without modifying the original array,
use the map method to return a new array identical in structure to the original
but where the value of each integer is incremented by 1.


[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hash|
  new_hash = {}
  hash.each do |key, value|
   # value += 1
    new_hash[key] = value + 1
  end
  new_hash
end

#close but needed to check answer -didn't realize I needed to create a new hash

Problem 11

Given the following data structure use a combination of methods, including
either the select or reject method, to return a new array identical in structure
to the original but containing only the integers that are multiples of 3.

select will return the correct selections based on truthuiness/falsiness of block
-so, if num % 3 == 0 within the block, and num that returns true will be selected
--the issues is getting it returned within the correct array structure
--also need to use multiple methods - maybe each within the block?
------idk, each doesn't care about the block's return value --

need a nested iteration -- one level to break into the outer array, another to
access, evaluate, and select the subarray elements that meet the selection criteria

# this work; below, trying out the 2 lesson solutions
arr = [[2], [3, 5, 7, 12], [9], [11, 13, 15]]

result= arr.select do |subarray|
  subarray.delete_if do |num|
    num % 3 != 0
  end
end

arr = [[2], [3, 5, 7, 12], [9], [11, 13, 15]]

result = arr.map do |subarray|
  subarray.select do |num|
    num % 3 == 0
  end
end

arr = [[2], [3, 5, 7, 12], [9], [11, 13, 15]]

p arr.map do |subarray|
  subarray.reject do |num|
    num % 3 != 0
  end
end

# the above works in irb, but running the file returns an enumerable rather than
the expected array

Problem 12

Given the following data structure, and without using the Array#to_h method,
write some code that will return a hash where the key is the first item in each
sub array and the value is the second item.

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

result =  arr.each_with_object({}) do |subarray, hash|
  hash[subarray[0]] = subarray[1]
end

p result

Problem 13

Given the following data structure, return a new array containing the same
sub-arrays as the original but ordered logically by only taking into
consideration the odd numbers they contain.

A
iterate over outer array, comparing each subarray according to order of odd
numbers
--use sort_by with an if condition?

p

arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]

result = arr.sort_by do |subarray|
  subarray.select do |num|
    num.odd?
  end
end

p result

Problem 14

Given this data structure write some code to return an array containing the
colors of the fruits, and the sizes of the vegetables. The sizes should be
uppercase and the colors should be capitalized.

input: hash
output: array

rules: take certain has values and return in an array
use hash reference to add:
--fruit colors (and capitalize)
--vegetable size (and upcase)
- maintain data structure - if hash value is an array, should appear as subarray

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

result = hsh.map do |_, value|
  if value[:type] == 'fruit'
     value[:colors].map do |color|
     color.capitalize
   end
  elsif value[:type] == 'vegetable'
    value[:size].upcase
  end
end

p result

# had the right idea here but needed to check solution to maintain subarrays -
# tried using select since this is a selection, but solution uses a nested map


=begin
We initialize a local variable `array` to the return value of invoking `map` on the array referenced by `hsh`. `map` iterates over each key-value pair in the `hsh`. On lines 58-66, we pass in a do..end block to `map`. This outer-level `map` invocation will transform each key-value pair into the return value of the block on each iteration and return an array containing these element. 
  

  On each iteration, we assign the current value to the local variable `inner_hash`. If the value associated with `inner_hash[:type]` is equal to the String `fruit`, then we'll invoke `map` on `inner_hash[:colors]` and pass in a block. Otherwise, the key-value pair will be transformed into `nil`. 
=end

Problem 15

Given this data structure write some code to return an array which contains
only the hashes where all the integers are even.

need to iterate through the given array
-first, outed iteration to break into array
-then, inner iteration to iterate through each hash
-third, 3rd layer iteration to access the arrays (keys) and evaluation the integers

-once 3-level nested iteration strucutre is set, we can access and evaluate
the integers contained in the array in the hash in the array.
loop through each array (at level 2), evaluating each integer (level 3)
-select the entire subarray (level 2) if all elements at level 3 are even

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

result = arr.select do |hash|
  hash.all? do |_, value| #this is why it didn't work - I used select instead of all?
    value.all? do |num|
      num.even?
    end
  end
end

p result

Problem 16

create a method that takes no parameters and generates a UUID

-needs to randomly generate a string of 32 hexadecimal characters
-needs to then randomly break those 32 characters up into 5 sections separated
by dashes (ie x-x-x-x-x)

-first, generate the ranges for num and letters that can be selected
-randomly choose 32 elements from possible ranges
-assign random elements of the selected number to split betwwen dashes

=end

def uuid_generator
  characters = []
  (1..9).each { |digit| characters << digit.to_s}
  ("a".."f").each { |digit| characters << digit}

  uuid = ""
  sections [8, 4, 4, 4, 12]
  sections.each_with_index do |section, index|
    sections.times { uuid += characters.sample }
    uuid += '-' unless index >= sections.size - 1
  end
  uuid
end


#not sure this worked? cannot get the code to output or return the uuid in irb
# or terminal. Understand the code well enough, but absolutely needed to check
# the solution on this. Return and practice pedacing not that it's clearer (in looking
# at the code, there were several requirements that I did not understand, like
# 8-4-4-4-12).


=begin

#tried taking array of ages and nils from above and completing the problem
using a loop -- once again, created an infinite loop and cannot figure out why.
Discuss in a study session.

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

result = munsters.map do |person, info|
 #info.map do |key, value|
   if info["gender"] == "male"
     info["age"]
   end
end

total_age = 0
counter = 0
loop do
  break if counter == result.size
  if result[counter] == nil
    next
  else
    total_age += result[counter]
  end
  counter += 1
end

=end



