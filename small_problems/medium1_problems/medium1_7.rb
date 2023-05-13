=begin
3/23

P:
write  method that takes a string and convert each word form of a number to
number form (string) and interpolates into input string

input: stirng
return: SAME string

rules:
-substitute each number word in a string for the digit
-return a mutated version of the original input string (same string)
-only need to handle number words from zero to nine

E:
word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

D:
-hash to hold number-word pairs
-array copy of input string
-iterative strucutre to loop over array copy with index and check if each word is a number word
-index reference to make substitutions

A:
initialize a hash of word-number pairs
-create a copy of the input string as an array of words
-iterate over array of hash keys
  -if input string contains a hash key
  substitue the hash value

#this is an "easy fix". will throw an error is number word is included in another
word, like 'one' in 'alone'

# can be fixed by using this regex: /\b#{number_word}\b/  as the 1st arg to gsub
=end

def word_to_digit(string)
  numbers = {'zero' => 0, 'one' => 1, 'two' => 2, 'three' => 3, 'four' => 4, 'five' => 5,
            'six' => 6,  'seven' => 7, 'eight' => 8, 'nine' => 9 }

  numbers.keys.each do |number_word|
    if numbers.include?(number_word)
      string.gsub!(number_word, numbers[number_word].to_s)
    end
   end
   string
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'