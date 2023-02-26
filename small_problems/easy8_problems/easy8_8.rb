=begin
2/24

problem: write a method that takes a string and returns a new string with the
words in reverse order

input: string
output: none
return: string

rules:
-return new string
-words should be in reverse order
-empty string should return empty string
-emtpy string with any number of spaces should return an EMPTY string

examples:
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''

algorithm:
-

#attempt 1
def reverse_sentence(string)
  result = []
  string = string.split

  (string.length - 1).downto(0) do |counter|
    result << string[counter]
  end
  result.join(' ')
end

#attempt 2
def reverse_sentence(string)
  result = []
  string.split.reverse_each { |word| result << word }
  result.join(' ')
end

#lesson solution below:
=end

def reverse_sentence(string)
  string.split.reverse.join(' ')
end

puts reverse_sentence('Hello World')# == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''
