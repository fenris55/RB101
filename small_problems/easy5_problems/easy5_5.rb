=begin
2//9

problem:
write a method that takes a string, removes all non-letters, and replaces with
a single space

input: string (letter and characters)
output: none
return: string (letters and spaces only)

rules:
-remove all non-letter characters from string inputx

ugh pedac got deleted
#ok this works, but not sure how to select down to get the correct number of spaces

#NOTES lesson example is similar to mine, but doesn't rely on return of map.
Instead, saves result of iteration as a new array. This lends more control -- can
check if the last element added to array is a ' ' and then skip adding a new space

- first taking the code below and modifying it to use then approach. then trying
the 2 proivded solutions

# first attempt, cannot get emtpy strings right
def cleanup(string)
  word_array = string.split(' ')
  new_array = word_array.map do |word|
    word.chars.map do |el|
      if ('a'..'z').include?(el)
        el
      else
        el = ' '
      end
    end
  end
  new_array#.join
end

#second attempt after glancing at solution - works
ALPHABET = ('a'..'z').to_a

def cleanup(string)
  word_array = string.split('')
  result_array = []
  word_array.each do |el|
    if ALPHABET.include?(el)
      result_array << el
    else
      result_array << ' ' unless result_array.last == ' '
    end
  end
  result_array.join
end

#first lesson solution

ALPHABET = ('a'..'z').to_a

def cleanup(text)
  clean_chars = []
  text.chars.each do |char|
    if ALPHABET.include?(char)
      clean_chars << char
    else
      clean_chars << ' ' unless clean_chars.last == ' '
    end
  end
  clean_chars.join
end

=end
#second lesson solution

def cleanup(text)
  text.gsub(/[^a-z]/, ' ').squeeze(' ') # tried gsub initially but could get the arg correct
end

p cleanup("---what's my +*& line?")# == ' what s my line '
