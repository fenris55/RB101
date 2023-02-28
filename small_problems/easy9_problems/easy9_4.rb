=begin
2/26

problem:
write a method that takes a string and returns an array of strings: each el is
a word from the original string, followed by a space and the word length

input: string
output: none
return: array of strings

rules:
-take each word of input string, add space and word length, and add new string to array
-asume valid input
-punctuation counts as part of the word length
- case-sensitive
- empty string returns empty array

examples: see below

data:
array to hold string elements for iteration
iterative structure to assess/count each word
hash to hold word/count pairs -- or not?
maybe not; maybe just a placeholder variable to hold count and concatenate to string?
orrr not; can use hash and just interpolate?

algorithm
-initialize empty hash to store word and count as key and value
-convert input string to array of words (#split)
-iterate over word array
  - if word is already a hash key (#key?), next
  - else, add word as new key and word size converted to string as value
-convert hash to array (will return nested array)
-iterate over returned array and join each element with a space
-returns array should be result

Note: works, but lesson solution is much simpler. see below

def word_lengths(string)
  word_array = string.split

  count_hash = word_array.each_with_object({}) do |word, hash|
                next if hash.key?(word)
                hash[word] = word.size.to_s
               end

  count_hash.to_a.map { |pair| pair.join(" ") }
end

#lesson solution: simply splits string into array of words. Iterates over array
using #map to return a string by  concatenating word with a spaces and then
the size of the word converted to a string -- also refactors to be shorter

def word_lengths(string)
  words = string.split

  words.map do |word|
    word + ' ' + word.size.to_s
  end
end

=end

def word_lengths(string)
  string.split.map { |word| "#{word} #{word.size.to_s}" }
end

p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

p word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

p word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

p word_lengths("") == []
