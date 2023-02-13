require 'pry'

=begin

Easy 1.1

Problem:
-write a method that takes two arguments (sting and positive integer) and
outputs the string the number of times speicifed by the integer

Input: String, integer
Output: strings

Rules:
-write method
- 2 arguments
- output string number of times specificied by integer

Data: ?

Examples:
input:
repeat('Hello', 3)

output:
Hello
Hello
Hello

Algorithm:
-define method with two parameters
-take integer and iterate over it
  - for each iteration, output the string

Code:

1st version:
def repeat(string, integer)
  integer.times { |_| puts string }
end

Trying alternative approach:

def repeat(string, integer)
  counter = 0
  loop do
    break if counter == integer
    puts string
    counter += 1
  end
end

repeat("Hello", 3)

end notes:

achieved 2 different ways - using `#times` with a block
and `#loop` with a counter

# EASY 1.2

PROBLEM:
write a method with one integer argument (pos, neg, or 0) and return true is odd

Input: integer
Output: return boolean, no output

Rules:
-Input integer can be positive, negative, or 0
-Return value is only considering integer's absolute value
-No output
-Return a boolean
  - return `true` if odd
Can't use `#odd?` or `#even?` methods

Examples:
puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true

Data:
Conditional statement to check whether int is odd

Algorithm:
-define method with one parameter
-check whether integer is odd
  -options:
    - int % 2 != 0
    - if int % 2 == 0... return false
    - hmmm can't think of any other ways to achieve this aside from modulo
-return boolean from method

1st attempt:
def is_odd?(integer)
  integer % 2 != 0
end

2nd attempt: (longer than necesary but just trying to produce multiple solutions:

def is_odd?(integer)
  if integer % 2 == 0
    false
  else true
  end
end

3rd attempt: just noting solution uses 1, not 0:

def is_odd?(integer)
  integer % 2 == 1
end

4th attempt: CHALLENGE: rewrite using `#remainder` method

def is_odd?(integer)
  integer.remainder(2) != 0
end

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true

# EASY 1.3

Problem:
Write a method that takes one argument, an integer, and returns a string of 1s and
0s the same length as the integer (starting with 1)

Input:
-integer
Output"
-string (of 1s and 0s)

Rules:
-define method with one parameter (`integer`)
-return string of alternating 1s and 0s
-no output
-returned string must be same length as input integer
-returned string must begin with 1

Data:

Examples:
puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

Algorithm:
-define method with one paramter (integer)
-set range from 1...integer
-iterate over range
  -pass integer into block
  -if range number is odd
    - return 1
  -if range number is even
    - return 0
  handling return values:
  - can add to new array and join
  - can concatenate to empty string
-when iteration is complete, return string


notes on errors:
-I set the range starting at 1 but accidentally set an exclusive range.
  -fix 1 was to make range inclusive
  - fix 2 was to set range from 0 exclusive and switch the if condition to
  even since the first integer passed in was 0

  -checked solution-- range is unecessary - can simply use the integer

def stringy(integer)
  result = ''
  (1..integer).each do |num|
    if num.odd?
      result << '1'
    else
      result << '0'
    end
  end
  result
end

# 2nd attempt - trying again using `#map` instead
- it works!

def stringy(integer)
  arr = (1..integer).map do |num|
    num.odd? ? '1' : '0'
  end

  arr.join
end

3rd attempt - from solution

def stringy(integer)
  result = []
  integer.times do |num|
    numbers = num.even? ? 1 : 0 # because times begins counting at 0 so 1st is even
    result << numbers
  end
  result.join #can return int from block bc join converts to string anyway
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

4th attempt - Challenge
-modify above method to accept an optional 2nd argument. If 0 is passed, reverse
string to begin with 0. Default to 1

Alg:
-set second default parameter (`start=1`)
-wrap existing code in if/else

def stringy(integer, start=1)
  result = []
  integer.times do |num|
    if start == 0
      numbers = num.even? ? 0 : 1
    else
      numbers = num.even? ? 1 : 0
    end
    result << numbers
  end
  result.join #can return int from block bc join converts to string anyway
end

puts stringy(6, 0) == '010101' #'101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

# EASY 1.4

Problem:
write a method that takes 2 arguments (positive integer, boolean) and calculates
bonus: 0 is false, 1/2 of salary if true

input: integer, boolean
output: no output, return integer

rules:
assume integer is positive
simply return integer is boolean is false
calculate 50% of integer, add result to input integer, and return if true

data: conditional structure to check boolean

examples:

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000

algorithm:
-define method with 2 parameters
-set up conditional statement
  - if arg 2 is false, return integer
  -if arg 2 is true
    - divide integer by 2 and add return to integer
    - return

Notes/Errors

Misread the examples AND prompt
- returned new total instead of just the bonus amount (PEDAC reflects this error)
- returned salary instead of 0 with false (both fixed below)

attempt 1:

def calculate_bonus(salary, bonus)
  if bonus == false
    0
  else
    salary / 2
  end
end

attempt 2: (refactoring)

def calculate_bonus(salary, bonus)
  return (0) if bonus == false # this line only works with a return -- why?
  (salary / 2) if bonus == true
end

attempt 3: ternary

def calculate_bonus(salary, bonus)
  bonus ? salary / 2 : 0
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000

EASY 1.5

Problem:
Write a method that takes a line of text and prints it in a box

Input: string
Output: string formatted into box

Rules:
- assume line of text is 'short' - 1 line
- empty string should return an empty box

Data:
-could use a helper method to create box and string interpolation to add string
  - interpolating helps format and amkes and empty string easier to handle

- format directly within method or use help? try 1st and maybe refactor to 2nd

Examples: see lesson

Algorithm:

note:`truncate` method added to complete challenge, but did not complete final
part - wrapping very long linesfor multi-line text in the box

def print_in_box(string)
  string = truncate(string)
  if string == ''
    empty_box(string)
  else
    box(string)
  end
end

def empty_box(input)
  puts "+--+"
  puts "|  |"
  puts "|  |"
  puts "|  |"
  puts "+--+"
end

def box(string)
  puts '+' + ('-' * (string.size + 2)) + '+'
  puts '|' + (' ' * (string.size + 2)) + '|'
  puts '|' + " #{string} " + '|'
  puts '|' + (' ' * (string.size + 2)) + '|'
  puts '+' + ('-' * (string.size + 2)) + '+'
end

def truncate(string) # added to complete 1st part of challenge
  if string.size > 78
    #string = string
    string = string[0, 77]
  else
    string#.join
  end
  string#.join
end

print_in_box('I see a lemondrop and a lollipop and a chocolate buttercup and some candy canes')

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

=end

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
