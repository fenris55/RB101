=begin
3/27

P:
write a method that takes a string and returns true if the string contains only
one letter from the provided letter pairs (blocks)

input: string
return: boolean

rules:
X-use provided letter blocks (letter pairs)
  (pair in subarray) or (pair in a hash)
X-each word can only contain one letter from a given letter block
X-need to iterate over all blocks when checking a string
X-return false if string contain both letters from any block
X-method should be case insensitive
-since block is uppercase, input should be upcased when checked against block
-entire alphabet is included in the block, so no need to worry about unincluded
chars when string against block

E:
example block:
B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M

program example:
block_word?('BATCH') == true
block_word?('BUTCH') == false
block_word?('jest') == true

D:
-iterative structure to loop over input string and check each letter against block
-array of nested array
  -each subarray will hold one letter pair

[B, O].all? { |bl| string.include?(bl) } ? false : true

A:
-initialize letter_block array with uppercase letter pairs as subarray
-iterate over letter_block array, checking if the input string contain both
letters from any pair
  -use an iterative method ###that returns a boolean (#any)
    -that tranforms the block array to an array of booleans
  -pass subarray into the block
  -initialize a nested iteration on subarray (#all?)
    -pass a subarray element into block
    -check if input string contains element
    if both block letters are included in the upcased string, the inner iteration will return true

    -if all inner iterations return false, both letters are not included in the
    string and the method should return true
    -if any inner iteration returns true, both letters are included and method
    should return false

###-check return value of outer iteration
if array of booleans return from iteration contains a true:
  return false
  -else, (all booleans in array are false)
  return true

Ugh, major issues here. too late. Com back tomorrow and write up the errors
(currently, i'm checking the strign against every subarray. since the string
does not contain all letter of the alphabet, blocks containing letters not
inculded in the string are also being evaluated. Also not sure why the blocks
that DO have both pairs present in the string are not returning true with all?)

def block_word?(string)
  letter_block = [['B' , 'O'], ['X', 'K'], ['D', 'Q'], ['C', 'P'], ['N', 'A'],
                 ['G', 'T'], ['R', 'E'],  ['F', 'S'], ['J', 'W'], ['H', 'U'],
                 ['V', 'I'], ['L', 'Y'], ['Z', 'M']]

  booleans = letter_block.map do |subarray|
    subarray.all? { |letter| string.upcase.include?(letter) }
  end
booleans
end

p block_word?('BATCH') #== true
p block_word?('BUTCH') #== false
#block_word?('jest') == true


retrying 4/1

P:
write a method that takes a string and hold a key with letter pairings. Method
should return true if input string contains only one letter from each pair,
false if both letters from a pair

input: string
return: boolean

rules:
-method needs to hold pairs of letters
-input string cannot contain both letters from a pair
-method should be case insensitive
-block is upcase, so input string should be upcased for comparison
-method should return a boolean
-assume valid input?
-assume single-word input?
-no spaces?

E:
B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M

block_word?('BATCH') == true
block_word?('BUTCH') == false
block_word?('jest') == true

D:
-could use an array with each subarrays holding the pair
-could use a hash
-iterative structure to loop over block, pass in each subarray, and check that
each array element appears

#retrying 4/2

P:
Write a method a method that takes a string and returns a boolean; the method
should return  true only if the input string contains 1 or fewer letters from
the the given block of letter pairs

input: string
return: boolean

rules:
-method will contain a block of 2-letter pairs
-the input string cannot contain both letters from a pair
-string can have 1 letter or no letters from a pair
-case insensitive- if letter blocks are upcased, string should be upcased for comparison

questions:
-assume vald input?
-can there be empty string input, and what should that return?
-assume there will be no spaces in input string?
-can one letter be used multiple times?
  -ie, would 'DAD' return true?

E:
B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M

block_word?('BATCH') == true

-pass in first block -> [B, O]
-need to check that the count of block subarray characters appearing in input string is
  not 2 (count < 2) ; can be 1 or 0
-how can this count be checked?
  -iterate over the letter_blocks nested array
  -pass a subarray in the block
  -iterate over subarray
    ?-want to know if all subarray elements are NOT included in the input string
      -if all elements are NOT included, block will return true
      -if all elements are included, block will return false AND execution will stop
    -capture return value of inner iteration (true or false) and return


block_word?('BUTCH') == false
block_word?('jest') == true

D:
-block of letter pairs: could use a nest array or hash
-iterative structure to compare words in input string to letter blocks

A:
-initialize letter_blocks as nested array
-initialize empty booleans aray
  -each subarray is a letter pair
-begin iteration over letter_blocks nested array (#each)
  -on each iteration, a subarray passes into the block
  -initialize an inner iteration to check if subarray elements both
    appear in input string (#all?)
    -pass each element of subarray into inner block
      -check if both elements are included
      -this will only return true if both elements are included
      -push return value of inner iteration to booleans_arr
-check booleans_arr
  -if all elements are false, return true
  -else, return false

#oops-- forgot to downcase but still returning trying because relying on false
LETTER_BLOCKS = [['B', 'O'], ['X', 'K'], ['D', 'Q'],  ['C', 'P'], ['N', 'A'],
['G', 'T'], ['R', 'E'], ['F', 'S'], ['J', 'W'], ['H', 'U'],
['V', 'I'], ['L', 'Y'], ['Z', 'M']]

def block_word?(word)
  booleans_arr = []
  LETTER_BLOCKS.each do |subarr|
   booleans_arr <<  subarr.all? do |letter|
      word.upcase.include?(letter)
    end
  end
   booleans_arr.all? { |bool| bool == false }
end

## my method allows for a block to be used multiple times. Fixing this below.
in the iteration, checking if the letter is included AND the count is <2. Since
#all? short circuits and not all letters get evaluated, I'm changing the inner
iteration to use map. Instead of one boolean, this will return an array of 2
booleans. The mean the booleans_arr need to be flattened before checking
Instead of #all?, NOPE. haven made a huge mess of this.

LETTER_BLOCKS = [['B', 'O'], ['X', 'K'], ['D', 'Q'],  ['C', 'P'], ['N', 'A'],
['G', 'T'], ['R', 'E'], ['F', 'S'], ['J', 'W'], ['H', 'U'],
['V', 'I'], ['L', 'Y'], ['Z', 'M']]

def block_word?(word)
  booleans_arr = []
  word = word.upcase
  LETTER_BLOCKS.each do |subarr|
   booleans_arr <<  subarr.map do |letter|
      if word.include?(letter)
        word.count(letter) < 2 ? true : false
      else
        word.include?(letter) ? false: true
      end
   end
   booleans_arr.flatten#.all? { |bool| bool == false }
  end
end
#lesson solution:
=end

BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM)

def block_word?(string)
  up_string = string.upcase
  BLOCKS.none? { |block| up_string.count(block) >= 2 }
end

p block_word?('BATCH') #== true
p block_word?('BUTCH') #== false
p block_word?('jest') #== true
