=begin
2/24

problem: write a method that takes a string and returns a new string with every
consonant doubled.

input: string
output: none
return: new string

rules:
-double every consonant
-do not double vowels, digits, punctuation, or spaces

examples:
double_consonants('String') == "SSttrrinngg"
double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
double_consonants("July 4th") == "JJullyy 4tthh"
double_consonants('') == ""

algorithm:
-definie constant holding consonants
-iterate over string
  -if consonants variable includes current element, double and add to new string
  -else, simply add to new string



CONSONANTS = ['b', 'c', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'm', 'n', 'p', 'q',
              'r', 's', 't', 'v', 'w', 'x', 'y', 'z']

def double_consonants(string)
  result = string.chars.map do |el|
    if CONSONANTS.include?(el.downcase)
      el *= 2
    else
      el
    end
  end
  result.join
end

#lesson solution below uses #each_char
=end

CONSONANTS =  %w(b c d f g h j k l m n p q r s t v w x y z)

def double_consonants(string)
  result = ''

  string.each_char do |el|
    result << el # adding first time
    result << el if CONSONANTS.include?(el.downcase) # doubling if consonant
  end
  result
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""
