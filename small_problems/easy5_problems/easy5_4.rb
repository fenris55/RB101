=begin
2/9

problem:
write a method that takes a string and swaps the first and last letters of each
word

input: string
output: none
return: string

rules:
-swap first and last letter of each word in a string
-maintain input capitalization
-assume all input is a valid string with at least 1 character
-a 1-character string should return self

data:
-array to hold string elements
-iteration structure and block
  -maybe #map could be used to return a new array with indexes [0] and [-1] swapped
-alternatively, could save indexes 0 and -1 as variable an manually switch them

examples:
swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
swap('Abcde') == 'ebcdA'
swap('a') == 'a'

algorithm:
-convert input string into an array (chars)
-iterate over input string (#map)
- within block, swap index 0 and -1 of each array element ###
  - what method can do this? (without manually saving as described above)
  can we do: el[0], el[-1] = el[-1], el[0]
-convert returned array into string and return

took awhile, but test cases pass.

def swap(string)
  word_array = string.split(' ')

  swapped_words = word_array.map do |el|
    a = el[0]
    b = el[-1]
    el[0] = b
    el[-1] = a
    el
  end
  swapped_words.join(' ')
end

took awhile, but test cases pass.

def swap(string)
  word_array = string.split(' ')

  swapped_words = word_array.map do |el|
    a = el[0]
    b = el[-1]
    el[0] = b
    el[-1] = a
    el
  end
  swapped_words.join(' ')
end

=end

def swap(string)
  word_array = string.split(' ')
  swapped_words = word_array.map do |el|
    el[0], el[-1] = el[-1], el[0] # works! couldn't get it the first try
    el
  end
  swapped_words.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'

