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


retyring 3/23

P:
wrtie a method that takes a string and returns a hash with word length (integer) as
keys and count occurance of words of the corresponding legnth as values

input: string
return: hash

rules:
-input string will contain at least two word
-reutrn hash will contain integers as both keys and values
  -key represent word length
  -values represent count of words of given legnth in string
-count of letter include punctuation (total length of the space-separated words)
-empty string return an empty hash
-return hash key should be sorted from smallest to largest

E:
word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
word_sizes('') == {}

D:
-array of word from input string
-hash to hold counts
-loop to populate count hash

A:
-initialize empty hash
-return hash if input string is empty
-convert input string to an array of words (word_arr)
-iterate over word_arr
  -if the hash does not include size of the current element as a key
    -push to hash the word size as key and 1 as value
  -else (word count is a key)
    -increment by 1
-sort hash so that keys are in numeric order

def word_sizes(string)
  count_hash = {}
  return count_hash if string.empty?

  string.split.each do |word|
    if count_hash.has_key?(word.size)
      count_hash[word.size] += 1
    else
      count_hash[word.size] = 1
    end
  end

  count_hash.sort.to_h

end

#lesson solution: initializing hash with values of 0
=end
def word_sizes(string)
  count_hash = Hash.new(0)
  string.split.each { |word| count_hash[word.size] +=1 }
  count_hash
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}








