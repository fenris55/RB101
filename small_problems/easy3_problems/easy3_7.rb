=begin
method that returns an Array that contains every other element of an Array that
is passed in as an argument

examples:
oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
oddities(['abc', 'def']) == ['abc']

pedac
-def array with one param
2 options
 - manually iteration through array, incrementing index with a counter
 --if counter is odd, add element to returned array


# coutner and manua iteration work
--how to achieve using methods?

def oddities(array)
  counter = 0
  new_array = []
  loop do
    break if counter == array.length
    new_array << array[counter] if counter.even?
    counter +=1
  end

  new_array
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]

challenge below: write companion method for even numbers, but solve 2 different ways

#attempt 1 works; trying a 3rd approach below

def evensies(array)
  new_arr = []
  array.each_index do |ind|
    new_arr << array[ind] if ind % 2 == 0
  end
  new_arr
end


def evensies(array)
  array.select.each_with_index do |el, index|
    index.even?
  end
end

p evensies([]) == []
p evensies([1, 2, 3, 4, 1]) #== [1, 3, 1]
p evensies([2, 3, 4, 5, 6]) == [2, 4, 6]
p evensies([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p evensies(['abc', 'def']) == ['abc']
p evensies([123]) == [123]

retrying 1/24

problem:
write a method that takes a string argument and return true if the string is
the same when reversed (a palindrome)

input: string
output: boolean

rules:
-return true if string argument is a palindrome
- case sensitive -- capitals, punctuations etc must be exactly the same
- per examples - string can contains letters, numbers, or punctuation
- consider spaces

Assumptions:
- no example of empty string -- sbould return true?
- assuming a single-character string would also return true

Examples:
palindrome?('madam') == true
palindrome?('Madam') == false          # (case matters)
palindrome?("madam i'm adam") == false # (all characters matter)
palindrome?('356653') == true

Algorithm:
- reverse string
- check if reversed string is equal to original string
-- can do this with #reverse method. NEED string practice -- also try doing
manually

def palindrome?(string)
  string == string.reverse
end

p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true
p palindrome?("a")

tried a manual example below not using a reverse method -- works!

def palindrome?(string)
  reverse = []
  string.chars.each do |letter|
    reverse.unshift(letter)
  end
  string == reverse.join
end

p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true
p palindrome?("a")

challenge: write a method that checks if an array is palindromic

input: array
output: boolean

algorithm:
same logic as above but reversed:
-convert array to string (join)
-reverse string (reverse)
- convert back to array (to_a)
- compare to original array

# this only kind of works -- for single character string. not words, integers, etc
def array_palindrome?(array)
  array.join.reverse.chars == array
end

# this one works
def array_palindrome?(array)
  reversed_array = []
  array.each { |el| reversed_array.unshift(el) }
  reversed_array == array
end

p array_palindrome?([1, 2, 2, 1])
p array_palindrome?(['1', '2', '3', '4'])
p array_palindrome?(['a', 'b', 'b', 'a'])
p array_palindrome?(["bear", "cat", "bear"])

Challenge 2:
write method that checks if string OR array is palindromic -- CANNOT use
if, unless, case

input: string or array
output: boolean

rules:
-input can be string or array
-check is input is palindrome and return boolean
-cannot use: if, unless, case

thoughts:
- still essentialy need to create a reversed copy and compare to original
  -- just need to do so in a way that allows for/returns either input type
- could use helper methods with maybe an || - seems like a workaround.

code:

=end

# expecting this to through an array if an array is input and not sure how to use
# rescue or if I can without an if
def string_palindrome(string)
  reverse = []
  string.chars.each do |el|
    reverse.unshift(el)
  end
  reverse.join == string
rescue
end

def array_palindrome(array)
  reversed_array = []
  array.each { |el| reversed_array.unshift(el) }
  reversed_array == array
rescue
end

def string_or_array_palindrome(s_or_a)
  string_palindrome(s_or_a) || array_palindrome(s_or_a)
end

p string_or_array_palindrome(['cat', 'bear', 'cat'])