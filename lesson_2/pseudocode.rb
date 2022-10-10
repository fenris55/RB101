#Lesson 2.7 - practice writing pseudocode
=begin 
1 - method that returns sum of two integers

informal: 
-def method with two parameters
-add parameters within method body
-return result of addition

formal: - not much diff
START
- write method definition with 2 parameters
-add paramters
PRINT result
END

##additional consideration:
-what if only one argument is given
-what is a non-numeric value is entered

says not to code but trying anyway - testing the logic

CODE:
def adding_method(num1, num2)
  num1 + num2
end

p adding_method(5, 8)
p adding_method(2, 2)

#2 - method that takes an array of strings, returns all strings concatenated as a string

informal:
-define method with parameter (array of strings)
-save first element of array
- add all additional elements to initial save element
-return new string of concatenated array elements

formal:
START
define method
SET empty variable
iterate through array
add each string element to empty variable
PRINT new variable/string
END

#issues: 
how to do this so all elements are added, 
rather than reassigning the empty variable to each array element
shovel concatenator?

string_array = ["apple", "banana", "orange"]

def string_concatenator(array)
  new_string = ""
  array.each do |word|
    new_string << word
  end
  new_string
end

p string_concatenator(string_array)

#it works!

#3 - write method that takes array of integers
and returns new array with every other element of orginal array starting with 1st

informal: 
define method w/ one parameter (integer array)
define new empty array OR use map to return array
iterate though original array
add even-numbered index items ([0], [2], [4], etc) to new array
----or use map to select
----maybe loop and next?
return new array

formal: 
START
define method with parameter
iterate through array
IF array index number is 0 or even, add to new array
ELSE, go to next element
PRINT new array
END

code: 

#below does not work - leaving to try again later

integer_array = [9, 8, 7, 6, 5, 4, 3]

def every_other(array)
  new_array = []
  array.select do |number|
    if array.each_index {|index| index.odd?}
       next
    else
       new_array << number
    end
  end
  p array
end

every_other(integer_array)

#can't make this code achieve the goal
#come back and try again

#4 - write a method that determines the index of the 3rd ocurrence of a given 
character in a string; return nil if occurence < 3

informal: 

given a string an a character: 

define a method with two parameters - string and single character
-count the number of times the character appears in the string
-identify index number of the 3rd occurence
- return index number or nil if character appears less that 3 times

formal: 

START
define method that accepts string and single character
-count number of character occurences in string
SET number as variable?
IF chaacter appear 3 times
-identify index number of variable/3rd occurance
ELSE
-return nil
END

attempting cocde below:

#return later and try to finish - doesn't work yet

def character_counter(string, letter)
  count = string.count(letter)
  if count == 3
    return string.index("s"#something else here?)
    
  else
    return nil
  end
end

puts character_counter("I see sea shells", "s")

#5 method that takes 2 arrays of numbers and returns result of merging arrays
elements of 1st array should become elements of even indexes, while 2nd array is odd indexes

informal
write a method that accepts two arrays as parameters
create new empty array
assign elements of 1st array to even indices of new array
assign elements of 2nd array to odd indices of new array
return new array

formal: 
START
define method with 2 parameters
SET new empty array
SET array1 elements to even indexes of new array by iterating through 
SET array2 elements to off indexes of new array by iterating through
PRINT new array
END

TAKE2 *** YES
another idea
START
define method with 2 parameters
SET new empty array
loop through array1 and array2 
remove index zero and send return value (remove element) to new array
PRINT new array

=end

def array_combiner(array1, array2)
  final_array = []
  loop do 
    final_array << array1.shift
    final_array << array2.shift
    break if array1.empty? || array2.empty?
   end
   final_array
end
  
odds = [1, 3, 5, 7]
evens = [2, 4, 6, 8]

p array_combiner(odds, evens)  

#IT WORKS!!! AND IT WAS EASY! :D
