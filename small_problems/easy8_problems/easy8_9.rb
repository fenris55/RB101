=begin
2/24

problem:
write a method that takes a string and returns the SAME string with characters
reverse only if string is 5 chars or longer

input: string
output: none
return: same string

rules
-return same string object
-reverse letters in each word of string only if string is 5 chars or longer
-reverse letters only - word order remains the same
-assume string has at least one word (no empty string)
-only include spaces when string contains multiple words

algorithm
-since the word order needs to remain the same:
-check length of string
  - if string < 5, return string
  -if string >= 5, see below
-split string into array of words
-iterate over array
-reverse each element as it's passed into block (this reverses while preserving word order)
-join result back to string

NOTE OOPS: should have check examples more carefully. Need to only reverse WORD
(not string) if 5 or greater

def reverse_words(string)

  result = string.split.map do |word|
    if word.length >= 5
      word.reverse
    else
      word
    end
  end
  result.join(' ')
end

#refactoring
=end

def reverse_words(string)
  string.split.map { |word| word.length >= 5 ? word.reverse : word }.join(' ')
end

puts reverse_words('Professional')           #=> lanoisseforP
puts reverse_words('Walk around the block')  #=> Walk dnuora the kcolb
puts reverse_words('Launch School')          #=> hcnuaL loohcS