=begin
4/3

P:
write a method that creates a mad lib by reading a text file and populating it
with randomly selected words of the correct type

input: text file
output: string (text file should output as a string with the spaces populated
by the program)

rules:
-program must read a text file and populate with words from each category
-program willneed to be supplied with a word list (array) for each word category
-program should randomly select a word from each list and place into output of
text file

D:
-text file to read
-word lists
  -these could be separate arrays or a hash with category as key and array of
  words as value. This would be cleaner, but would invovle the extra step of
  accessing the key associated with each value before randomly selecting -
  starting with arrays and then refactoring with this aproach

notes:
-review how to pass a text file:
  -pass file name on command line after name of ruby file
  -need to require the file - something like File.read('name_of_file.txt')
-unsure of how to manipulate the text output.

A:
-create text file
-create word arrays
-practice outputing text file
  -can call random directly on the interpolated array name : "#{adjectives.random}"
  -so in theory, should also work to do this with hash reference:
    -"#{word_hash[adjectives].random"
    -never tried this - think it should work?
-ok, test file. wordds to interpolate appear as: %{word_type}
-going to try to iterate over each word in text performing transformation
  -if a word starts with %
    using a case statement to substitute a random selection from the
    approapriate category
-then rejoin and return the new text

Notes: got close here -- only issue was that when the word included punctuation
the interpolation did not work. I know that can be resolve with regex. Alternative
simple solution does not come to find. Feel like this is not the most efficient
approach, but it is a working one. Was able to recal how to plug in a txt file
without looking it up.
=end

def madlibs(text)
adjective = %w(quick lazy sleepy ugly)
noun = %w(fox dog head leg)
verb = %w(jumps lifts bites licks)
adverb = %w(easily lazily noisily excitedly)

mad_lib = text.split.map do |word|
    case word
    when '%{adjective}' then adjective.sample
    when '%{noun}' then noun.sample
    when '%{adverb}' then adverb.sample
    when '%{verb}' then verb.sample
    else
    word
  end
end
puts mad_lib.join(' ')
end

text = File.read('madlibs.txt')
madlibs(text)