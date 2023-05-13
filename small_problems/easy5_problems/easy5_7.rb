=begin
2/9

problem:
modify previous exercises to exclude non-letters

notes:
-same code, just need to strip out non-letters before iterating over hash

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



retrying 3/23

P: modify previous problem solution so that non=letter chars are not included in
word count

def word_sizes(string)
  count_hash = Hash.new(0)

  word_array = string.split.map { |word| word.gsub(/[^a-z]/i, '') }

  word_array.each { |word| count_hash[word.size] +=1 }
  count_hash
end

#aftering looking at lesson solution, could have just used one iteration

def word_sizes(string)
  result = Hash.new(0)

  string.split.each do |word|
    clean_word = word.delete('^A-Za-z')
    result[clean_word.size] += 1
  end
  result
end

p word_sizes('Four score and seven.') #== { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}



def substring_test(str1, str2)
  str1_combos = str1.chars.combination(2).to_a
  str2_combo = str2.chars.combination(2).to_a
  return true if str1_combos.any? { |substring| str2_combo.include?(substring) }
  false
end


P:
write a method that takes a  string and returns the length of the longest
palindrome in the string

input: string
return: integer

rules:
-input string can contain words or one word?
-one letter can count as a palindrome (string with length 1 returns self)
-empty string returns 0
-find the longest palindromic substring
  -return size
-input string can contain letters and numbers (and punct?)

E:
longest_palindrome('a') == 1
longest_palindrome('aa') == 2
longest_palindrome('baa') == 2
longest_palindrome('aab') == 1
longest_palindrome('baabcd') == 2
longest_palidrome('baablkj123454321339') == 9 (123454321)

extra example:
longest_palindrome('I like racecars that go fast') == 7 (racecar)

D:
palinfirm array
placeholder string
loop to find palindromic substrings

A
options:
-get all substrings, filter for palindromes, return length of largest
-use placeholder to hold a running palindrome

option2:
-initialize empty palindrome array
initialize placeholder string to str[0]
iterate over input string starting at index 1 to one less than str1 size
  if placeholder string + el == placeholder_str + el reversed
  -add el to placeholder string
  continue iteration
else, push placeholder length to palindrome arr
  -reassign placeholder to current el
  -continue iteration

-sort and return largest integer in aplindrom array

=end








