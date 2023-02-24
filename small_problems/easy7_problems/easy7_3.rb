=begin
2/19

problem:
write a method that takes a single string argument and returns a new string
with the first letter of each word capitalized and all others chars lowercase

input: string
output: none
return: new string

rules:
-return new string
-capitalize first letter of each word
-all other letters should be lowercase
-if the first char in a word is not a letter, the word should NOT be capitalized
- assume valid input (string of words)

data:
-array of chars to iteratie over / convert to string return
-iterative structure check cap

examples:
word_cap('four score and seven') == 'Four Score And Seven'
word_cap('the javaScript language') == 'The Javascript Language'
word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

algrithm:
-(downcase string and) convert to array
-iterate over array (performing transformation - #map?)
- think i can just directly downcase and capitalize each element, and quotes will be skipped?
-ooh..no need for #downcase, #capitalize will do that automatically

def word_cap(string)
  result = string.split(' ').map {|word| word.capitalize }
  result.join(" ")
end

#lesson solution is identical but refactors as:

def word_cap(string)
  string.split.map(&:capitalize).join(' ')
end

#Challenge: make TWO solutions that don't use #capitalize
- first one uses index reference and #upcase
-could use a hash of correspdoning upper and lower pairs
-could also use sub/gsub?

def word_cap(string)
  result = string.downcase.split.map do |letter|
    letter[0].upcase + letter[1..-1]
  end
  result.join(' ')
end

=end


p word_cap('four score and seven') #== 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
