P

take a string and reverse each word containing five or more letters.

input: string
output: same string

explicit rules:
-should return original string, not a new string object
-reverse each word with 5 or more letters
-do not reverse words with a length of less than 5
-keep spaces intact

implicit rules:
-case senstive -- keep capital and lower case letters unchanged


E
puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS

D
-array to hold collection of words
-string to hold the result
iteration structure to move through word array and assess whether word is long
enough to be reverse

A

-take string input (str) and split into collection of all words in str
-destructively iterate through str collection
  --if element of str collection has a length of 5 or greater
    -- destructively reverse the letters in that array element
  --if element is shorter than 5, return self
  return mutated collection to string object format and return
C
=end

x = "I see a zebra a giraffe and an elephant"

def big_word_reverser(str)
   str_array = str.split
   result = str_array.map! do |word|
    if word.length >= 5
      word.reverse!
    else
      word
    end
  end
  result.join(" ")
end

p big_word_reverser(x)
p x
#p big_word_reverser('Professional')
#p big_word_reverser('Walk around the block')
#p big_word_reverser('Launch School')