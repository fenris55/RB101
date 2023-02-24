=begin
2/21

problem: write a method that takes a string and returns the second-to-last word

input: string
output none
return: string

rules:
-return second to last word in string arg
-assume valid input
-assume string contains at least 2 words

examples:
penultimate('last word') == 'last'
penultimate('Launch School is great!') == 'is'

algorithm:
-split string into array
-return second-to-last array element

def penultimate(string)
  arr = string.split
  arr[-2]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'

#Challenge: write a method that contains the middle word in a string. Consider
all possible edge cases

input: string
output: none
return: string

edge cases:
-strings with an even number of words (no middle) -- return the 2 middle words
-strings with only 1 word -- return self
-empty strings -- return self

algorithm:
-convert string to array of words
-divide length of string in half
-return array[half] and array[half+1]
--i think this will produce correct return for edge cases? test; if not, use control flow

=end

def return_middle_word(string)
  word_array = string.split
  half = word_array.length / 2

  if word_array.empty?
    ""
  elsif word_array.length.odd?
    word_array[half]
  else
    word_array[half] + " " + word_array[half + 1]
  end

end

p return_middle_word("I see you")
p return_middle_word("I see you too")
p return_middle_word("")
