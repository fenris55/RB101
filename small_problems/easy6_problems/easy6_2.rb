=begin
2/17

problem: write method that takes an array of strings and returns array with
same string values, but with vowels deleted

input: array of strings
output: none
return: array of strings (vowels deleted)

rules:
-method should take single array of strings as argument
-method should return identical array but with vowel removed
-a string element consisting only of vowels should return an empty string with
  single space

data:
-iterative structure to return new array with selected elements (#map?)

examples:
remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

algorithm:
-iterate over input array
-iterate over each array element
-set array of vowels and delete element if included

this was a challenge. since test cases are case sensitive, set VOWELS constant
to reference an array holding upper and lower case vowels as elements. iterated
over input array using #map, which selects and returns whatever is returned by
the block (this made it possible to include the empty string). invoked
String#delete on the string element passed into the block, and passed VOWELS
constant as argument to #delete - had to call #to_s since VOWELS is an array. On
each iteration, the string - with vowels deleted - is passed back to map as the
block return value, added to a new array, and the array is returned
=end
VOWELS = %w(A E I O U a e i o u)

def remove_vowels(array)
  array.map { |el| el.delete(VOWELS.to_s) }
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']