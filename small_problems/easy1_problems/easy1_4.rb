#Easy 1 - 4
=begin
PEDAC
P: input - array
  output - hash of array element and integer
  explicit rules: create a method named count_occurence
                  must accept one array
                  array is case-sensitive
                  print element beside number of occurrence
  implicit rules: will need to create hash to print pairs
E: input: ex = ['dog', 'cat, dog,', fish]
   output: 'dog' => 2
           'cat' => 1
           'fish' => 1
D: will need to create hash from array elements and count
A: create an array of strings
   pass array to method
   create empty hash
   iterate through array
   if unique, add to hash as symbol
   count each array value
   add count to hash as value
   print hash from within method
C: see below
=end

###had to take a break - method is not recognizing the array name
=begin
pets = ['dog', 'dog', 'dog', 'cat', 'pony', 'fish', 'fish', 'goat', 'goat', 'dog']

def count_occurence(array)
  list_counter = Hash.new
  array.uniq.each do |item|
      list_counter[:item]
      p list_counter
  end
end
  #pet_counter <<
  #puts pet_counter

count_occurence(pets)

=end

=begin
retrying 11/17

P: given an array, count the occurences of each element

input: array
output: array element and corresponding count

explicit rules:
create pairings of array element and count
count is case-sensitive; different case = different element

implicit rules:
will need to return a hash to display element/count pairings
creating a new object, not mutating an original (pass by value)
based on example call, should print from within method

E:
[lime, lime, lemon, orange] => {'lime' => 2, 'lemon' => 1, 'orange' => 1}

D
hash to store and return new data
looping structure to fill hash
some type of counter to count incidences

A:

define new method `count occurences` with one parameter (array)
initialize empty hash (other option: use .to_h?)
use counter to iterate through array using index reference
-if hash does not include array element as a key, add array element to hash with
   value of 1
-if hash does already include array element as a key, increment the value by 1
increment counter to loop through entire array
stop looping when counter reaches the array length
print the new hash from within the method (will output hash with return value nil)

=end

=begin
def count_occurence(array)
  hash = {}
  counter = 0
  loop do
    if hash.key?(array[counter]) == false
    hash[array[counter]] = 1
    else
      hash[array[counter]] += 1
    end
    counter +=1
    break if counter == array.length
  end
  p hash
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck', 'Truck'
]

count_occurence(vehicles)



#it works! without checking solution! New trying again using .to_h

same task, same basic logic, but when methods can we use to achieve this more simply?

use `.to_h` instead of initializing empty hash. to turn an array into a hash,
we would some how need to count up values first (?)
or can simply set hash with key equal to self and then modify the values

I guess we are selecting (`select`), but need to select while keeping track of
occurences. Actually, maybe that is two separate way - one using select, while
other using hash, since .to_h wil automatically select and voerwrite duplicate keys

ok so using a methd to turn the array into a hash. have a hash, easy to add the
count to the hash. But, how to we perform the count?

we can use Array#count and loop through by passing index with counter as count arg
=end

# iteration stops working after first loop - come back and figure out why

=begin

def count_occurence(array)
  hash = array.to_h {|item| [item, item]}
  counter = 0

  loop do
    count = array.count(array[counter])
    next if hash[array[counter]] == Integer
    hash[array[counter]] = count
    break if counter = array.length
    counter += 1
  end
  p hash
end

vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck']

p count_occurence(vehicles)


def count_occurrences(array)
  occurrences = {}

  array.uniq do |element|
    occurrences[element] = array.count(element)
  end

  occurrences.each do |element, count|
    puts "#{element} => #{count}"
  end


vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck']

p count_occurrences(vehicles)

retrying 1/12 (above is diff bc order changed)
=end

def calculate_bonus(amount, boolean)
  boolean ? amount/2 : 0
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000


















