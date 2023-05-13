=begin
3/28

P:
write a method that reads a text file, identifies the longest sentence, and
prints the number of words in that sentence.

input: text file?
return: integer

rules:
-program must read a text file
  -.txt
  -how to pass a text file to a program? IDK
-program must identify longest sentence (helper method)
  sentence rules:
    - a sentence is marked by ending characters (. ! ?)
    - sentence length is determined by number of words (not chars)
    -any space-separated characters count as a word
      - stand-alone punctuation like (--) counts as a word
-after finding longest sentence, count number of words
-return count of words in longest sentence

E: see lesson

D:
-text file
-helper method to find longest sentence (maybe not - iteration is already finding length)
-array to hold sentnece-ending punctuation
-iterative structure to count sentence length based on punctuation and number of words
-result variable to hold longest sentences OR length of longest sentence

#unsure about dealing with a text file
#for now, coding as though input is a string

A:

SPLTTING ARRAY
-split input into array at '.'
  -this returns an array with the unplit string followed by splits at '.'
-reassign array to array at index[0] split at '!' plus array[1..-1]
-finally, reassign array to index[0] split at '?' plus array [1..-1]
-flatten split array to get result
FINDING LONGEST SENTENCE:
-iterate over split array and find longest string
  =(sort, max_by) ***
  -could initiaiz a placeholder to zero, and on each iteration reassign
    length of current string to placeholder if greater than placeholder
-return length of longest returned string

#K! hepler is a bit messy but it works with a very long string. Checking answer
to see how to handle a text file and

Errors:
-initially tried to find size of largest sentence by chaining size to the max_by
  block -- didn't work because it was counting chars instead of words
-i resolved by chaining #split to the block
-in this test case it worked only because that had both the longest words and the
most chars
-per lesson solution, I should have used #split within the block to ensure that
  the block was sorting by number of words rather than number of characters

ALSO, failed to read the instructions thoroughly -- needed to print both the
size and the sentences itself


What I learned:
  -broke it down into increasing small parts
  -identified the two main takes (breaking up sentences and finding longest)
  -further broke down how to split sentneces with 3 different end conditions
  checking solution to osee a cleaner way to achieve this, but mine works
  ## solution uses regex to achieve split
  -learned to read txt file
  -learned a txt file seems to read as one large string with leading and trailing
  whitespaces that need to be removed (#strip)

def split_text(text)
  text = text.split('.')
  text = text[0].split('!') + text[1..-1]
  text = text[0].split('?') + text[1..-1]
end

def longest_sentence(text)
  text = split_text(text)
  longest_sentence = text.max_by { |sentence| sentence.size }.split.size
end

p longest_sentence(text1)

#lesson solution below:
-no method is used since a text file is read in:
=end

text = File.read('medium1_2_text.txt')
#sentences = text.split(/\.|\?|!/) # from solution
sentences = text.split(/(?<=[.!?])/) # from student for maintaining punctuation at split
largest_sentence = sentences.max_by { |sentence| sentence.split.size }
largest_sentence = largest_sentence.strip # this removes leading and trailing whitespace - from txt file?
number_of_words = largest_sentence.split.size

#challenge: maintain the final punctuation (lesson says period)
# could add . to keep period, but not sure about ? and !
#could reiterate over entire text/string, find the substring that matches
#longest sentence, and find the char at the next index position

#could iterte over the string and break up sentences manually:
#add each char to placeholder string
# if [. ? !].include?el
#add placeholder to array and reset to empty string

puts "#{largest_sentence}"
puts "Containing #{number_of_words} words"