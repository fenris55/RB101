=begin
2/9

problem:
modify previous exercises to exclude non-letters

notes:
-same code, just need to strip out non-letters before iterating over hash

=end

def word_sizes(text)
  hash = Hash.new(0)
  text.split.each do |word|
    clean_word = word.delete('^A-Za-z') # needed to check solution for format on this
    hash[clean_word.length] += 1
  end
  hash
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}