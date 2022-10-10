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
   
          
  