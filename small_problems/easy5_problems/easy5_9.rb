=begin
2/9

problem:
write a method that takes a string and removes consecutive repeating characters

input: string
output: none
return: string

rules:
- return a new string
- do not use #squeeze or #squeeze!
- only remove consecutive letters (not all of the same letter)
- empty string returns empty
- single letter returns self
-input string can be one or multiple words

data:
-new variable to hold result
-array to hold string input
-iterative structure to check each letter

examples:
crunch('ddaaiillyy ddoouubbllee') == 'daily double'
crunch('4444abcabccba') == '4abcabcba'
crunch('ggggggggggggggg') == 'g'
crunch('a') == 'a'
crunch('') == ''

code:
- convert input string to array split at the spaces
- initialize empty string to hold result
-iterate over array holding input
  - add to result variable unless the last element added to result is same as
  current element
-return result variable

def crunch(string)
  result = []
  string.split('').each do |el|
    result << el unless result.last == el
  end
  result.join
end

# lesson solution below
# avoid convert to an array and back by wokring with string index. another
option is each_with_object 
=end

def crunch(text)
  index = 0
  crunch_text = ''
  while index <= text.length - 1
    crunch_text << text[index] unless text[index] == text[index + 1]
  end
  crunch_text
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''





