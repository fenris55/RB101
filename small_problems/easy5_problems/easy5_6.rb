=begin
2/9

problem:
write a method that takes a string of multiple words and returns a hash with
word length as key and number of words of that length as value

input: string
output: none
return: hash (kes and values both integers)

rules:
-take string and return hash
-keys represent the different word lengths in string
-values represent number of words with that length
- assume all input is a value string with one or more words separated by spaces
- empty string input should return an empty hash
- punctuation is counted as part of the word length

data:
-array to split of words of input
-empty hash to hold result
iterative structure to add count/values to hash

examples:
word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
word_sizes('') == {}

algorithm:
-initialize empty hash
- split input text into text_array
- iterate over text_array
  if the hash keys include word length
    increment hash value by 1
  else,
    add word length as hash key with value of 1
-return hash

# words! easy. solution is short bc is uses hash = Hash.new(0). This sets a
default value of 0, which allows incrementation for non-existent keys. This
eliminates the need for the assignmnet/incrementing control flow. Trying below.

def word_sizes(text)
  hash = {}
  text.split.each do |word|
    if hash.key?(word.length)
      hash[word.length] += 1
    else
      hash[word.length] = 1
    end
  end
  hash
end

=end
#lesson solution

def word_sizes(text)
  hash = Hash.new(0)
  text.split.each do |word|
    hash[word.length] += 1
  end
  hash
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}