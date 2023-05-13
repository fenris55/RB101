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

#second lesson solution

def cleanup(text)
  text.gsub(/[^a-z]/, ' ').squeeze(' ') # tried gsub initially but could get the arg correct
end

p cleanup("---what's my +*& line?")# == ' what s my line '


retrying 3/4

problem: write a method that takes a string, removes all non-alphabetic
characters, and replaces them with a space

input: string
return: same string with non alphabetic characters replaced with single spaces

rules:
-all letters in string will be lowercase
- remove all non-letter characters
-if string contain consecutive non-letter chars, replaces with a singe space

example:
cleanup("---what's my +*& line?") == ' what s my line '


def cleanup(string)
  string.gsub!(/[^a-z]/, " ")
  p string.chars.each_cons(2) { |sub_arr| sub_arr }
end

p cleanup("---what's my +*& line?") #== ' what s my line '


retrying 3/25

P:
write a method that takes  astring of words and replaces all non-letter chars
with spaces. For consecutive non-letters, only substitue a single space.

input: string
return: sam string will non=letters replaced with spaces

rules:
-input string can contain spaces seaprated words with chars, numbers, and letters
-remove all non-letters
-consecutive non-letters should be replaced iwth a single space
-retun saem string object
-return strign cannot contain consecutive spaces
-may resul in leading or trailing spaces

E:
cleanup("---what's my +*& line?") == ' what s my line '

D:
-structure to iterate over string and index (each_char, with_index)

A:
-iterate over input string
unless curent element is included in range a-z,
  -replaced char with a space unless indx - 1 (previous char) is a space
  - i think this raises issues with mutating a string while iterating over it - will the indices shift?

# had to glance at solution -- was not asking for same string to be returned
def cleanup(string)
  clean_string = ''
  string.each_char.with_index do |el, idx|
    if ('a'..'z').include?(el)
      clean_string << el
    else
      clean_string[-1] == " " ? next : clean_string << ' '
    end
  end
  clean_string
end

p cleanup("---what's my +*& line?") == ' what s my line '

#shorter solution
=end

def cleanup(string)
  string.gsub(/[^a-z]/, ' ').squeeze
end

p cleanup("---what's my +*& line?") #== ' what s my line '



