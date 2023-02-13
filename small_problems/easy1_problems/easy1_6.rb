=begin
P

take a string and reverse each word containing five or more letters.

input: string
output: same string

explicit rules:
-should return original string, not a new string object
-reverse each word with 5 or more letters
-do not reverse words with a length of less than 5
-keep spaces intact

implicit rules:
-case senstive -- keep capital and lower case letters unchanged


E
puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS

D
-array to hold collection of words
-string to hold the result
iteration structure to move through word array and assess whether word is long
enough to be reverse

A

-take string input (str) and split into collection of all words in str
-destructively iterate through str collection
  --if element of str collection has a length of 5 or greater
    -- destructively reverse the letters in that array element
  --if element is shorter than 5, return self
  return mutated collection to string object format and return
C

x = "I see a zebra a giraffe and an elephant"

def big_word_reverser(str)
   str_array = str.split
   result = str_array.map! do |word|
    if word.length >= 5
      word.reverse!
    else
      word
    end
  end
  result.join(" ")
end

p big_word_reverser(x)
p x
#p big_word_reverser('Professional')
#p big_word_reverser('Walk around the block')
#p big_word_reverser('Launch School')

NOTE: exercises were rearranged

from first week of Jan:
EASY 1.6

problem:
take a positive integer x and display right triangle whose sides have
x stars and whose hypoteneuse runs lower left to upper right

input: positive integer
output: strings (triangle formed by *)

rules:
-must create right triangle running from lower left to upper right
-right angle of triangle should be formed by same number of stars
-number of stars must match integer input

data:
maybe iteration to decrement a counter, decreasing stars?

examples:
input: 5
output:

    *
   **
  ***
 ****
*****

high level algorithm:
-output spaces from integer length to one less than zero
-output spaces from integer length to 2 less than zero

example:
integer: 5
5-1 = 4
4 spaces 1 star
3 spaces 2 stars
2 spaces 3 stars
1 space 4 stars
0 spaces 5 stars

:D it worked and is same as solution (except .times instead of loop)

def triangle(integer)
  stars = 1
  starting_spaces = integer - 1
  loop do
    break if stars > integer
  puts ('  ' * starting_spaces) + (' *' * stars) # solved this by making the space bigger??
  stars += 1
  starting_spaces -= 1
end
end

#triangle(5)
triangle(9)

Challenge 1: print upsidedown

def triangle(integer)
  stars = integer
  starting_spaces = 0
  loop do
    break if stars < 0
  puts ('  ' * starting_spaces) + (' *' * stars) # solved this by making the space bigger??
  stars -= 1
  starting_spaces += 1
end
end

#triangle(5)
triangle(9)

Challenge 2: enable method to print with right angle in any corner

algorithm:

-add additional optional argument (1234) - clockwise from upper left
  -set default to 3 (lower right, as in first problem)
- set case statement to arg 2
- modify existing code to print correctly in each corner

--NOPE nope nope. Way too complex. create 4 separate methods and invoke using case statement

Works! Seems ridiculous though. So much code for such tiny changes. Not sure
how to do this more efficiently

def triangle(integer, corner=1)
  case corner
  when 1
    triangle_lower_right(integer)
  when 2
    triangle_lower_left(integer)
  when 3
    triangle_upper_left(integer)
  when 4
    triangle_upper_right(integer)
  end
end

def triangle_lower_right(integer)
  stars = 1
  starting_spaces = integer - 1
  integer.times do |n|
    puts ('  ' * starting_spaces) + (' *' * stars)
    stars += 1
    starting_spaces -= 1
  end
end

def triangle_lower_left(integer)
  stars = 1
  starting_spaces = integer - 1
 integer.times do |n|
    puts (' *' * stars) + ('  ' * starting_spaces)
    stars += 1
    starting_spaces -= 1
    end
end

def triangle_upper_left(integer)
  stars = integer
  starting_spaces = 0
  integer.times do |n|
    puts (' *' * stars) + ('  ' * starting_spaces)
    stars -= 1
    starting_spaces += 1
  end
end

def triangle_upper_right(integer)
  stars = integer
  starting_spaces = 0
  integer.times do |n|
    puts ('  ' * starting_spaces) + (' *' * stars)
    stars -= 1
    starting_spaces += 1
  end
end

triangle(3)
triangle(6, 4)
triangle(4, 2)
triangle(5, 3)

retrying 1/15

p:
take an integer x and display a * triangle with sides the length of x

input: integer
output: correctly formatted triangle made of *

rules:
-assume valid integer input
-2 short sides of trangle should be length of integer
-right angle should be in lower right
-print from within method

data:
-re-solving to produce a better solution for challenges
--used helper methods before, but it was sooo long
-consider how to use a second parameter to choose corner with needing helpers
  repeating all the same code with minor differences


def triangle(int)
  stars = 1
  spaces = int - 1
  loop do
    break if stars > int
    puts " #{' ' * spaces}#{'*' * stars}"
    stars += 1
    spaces -= 1
  end
end

triangle(5)

welll, that was MUCH faster to whip up this time. still having a hard time
figuring out how to solve without helper method. Going to go ahead study 2
different student-submitted solutions for it below:

from Christopher Perkins:

love this logic but output isn't perfect -- when 2nd param is 'tl' or 'tr'
(for top left or top right) iteration cuts off and final line (single star)
cuts off.

-in the if clause, finish can be changes from 1 to 0, but then iteration still
cuts off for 'bl' or 'br' and doesn't output final line (all stars)

def triangle(n, corner='br')
  i = 1
  finish = n
  iterate_by = 1

  if corner[0] == 't'
    i = n
    finish = 0
    iterate_by = -1
  end

  until i == finish
    string = '*' * i
    string = corner[1] == 'r' ? string.rjust(n) : string.ljust(n)
    puts string
    i += iterate_by
  end
end

triangle(7, 'bl')

now trying solution from Esther Ho:

=end

def triangle(side, right_angle = "bottom left")

  unless (right_angle.split - %w(right left top bottom).empty?) # was surprsied to see this, and it isn't working
    puts "Invalid argument given."
    return
  end

  triangle_array = []
  side.times do |iteration|
    triangle_array << ('*' * (iteration + 1))
  end

  if right_angle.include?('top')
    triangle_array.reverse!
  end

  if right_angle.include?('right')
    triangle_array.map! { |line| line.rjust(side) }
  end

  puts triangle_array
end

triangle(7, 'top right')

