=begin
4/3

-here the code is mutate the array as it iterates over it. As a result, if an
array element is delete, all index posiitons shift down one. When element shift
into an index position that has already been evaluation, they skipped during
iteration

options
-could use iterration to delete selected words fromthe input string and then
directly return the input string

-could create a copy of the words array and delete items from the copy while
iterating overhte array

=end

def neutralize(sentence)
  words = sentence.split(' ')

  words.dup.each do |word|
    words.delete(word) if negative?(word)
  end

  words.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.') #== "These cards are part of a board game."
# Expected: These cards are part of a board game.
# Actual: These boring cards are part of a board game.