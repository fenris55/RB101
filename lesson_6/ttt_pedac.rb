=begin
write a method `joinor`
define method with...splat param?


joinor([1, 2])                   # => "1 or 2"
joinor([1, 2, 3])                # => "1, 2, or 3"
joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"

PEDAC
p:
currently, game outputs a string displaying available space
the challenge is to update the method returning these values with a little
more funcitonality:

current method will replace the invocation: {empty_squares(brd).join(', ')

subprocess
-if input contains 2 or more numbers, add commas and 'or'
--allows optional argument chalnging punctuation to a semicolon and joiner to and
--when input is only 2 numbers, include joiner but not punctuation
--when input is only one number or an empty array, no optional /default args
inputneed to accept an array and one or two


sketching that out:

case XXX
when XXX.length >= 3
  #add opt1 and opt 1
when XXX.length == 2
# add opt 2 (no opt 1)
# when XXX.length <= 1
# XXX (no opt 1 or opt1)



take array

add opt1 puntuation witha default comma
use opt2 joining word woth with a default or
add opt2 to to array index -2
add opt1 to each even-numbered index??
turn array into a string

more notes:
=begin

input: array of integers and two optional arguments: joining punctuation (opt1) and joining word (opt2)
output: string of integers representing the empty spaces left on the board

rules:
3 possible output forms:
    -a string of one integer
    -a string of two integers with joining word (opt2) at index -2
    -a string of 3 or more integers separated by opt 1 and opt two at index -2
this means we need one parameter and another two parameters with default arguments

Ideas: maybe handle the "edge cases" first
-array will never be empty (the game loop would end)
-if array has one integer #actually, computer take last move so this is unneccessary
--return as a string (no optional arguments)
-if array has two integers
-- return as string with opt 2 (joiner)
---------------------------------------
- if array has 3 or more integers
-- return as string with both opt1 and opt2
---create new object (array or string)
----insert original array elements at even index points of new object
----insert opt 1 at odd index points from index[1]...index[-4] and opt2 at index[-2]
--return new object as a string


#FIRST ATTEMPT - WORKS

def joinor(brd, opt1=', ', opt2='or')

  options = brd.keys.select { |num| brd[num] == INITIAL_MARKER } # change space back to constant
  counter = 0
  joined_array = []

  if options.size == 1
    options.join
  elsif options.size == 2
    options.join(' ' + opt2 + ' ')
  else
    loop do
      joined_array << options[counter]
      counter +=1
      break if counter == options.length
      joined_array << opt1
    end
  joined_array.insert(-2, opt2 + ' ').join
  end
end

#SECOND ATTEMPT - refactored based on solution

def joinor(brd, opt1=', ', opt2='or')
  case brd.size
  when 1
    brd.first.to_s
  when 2
    brd.join(" #{opt2} ")
  else
    brd[-1] = "#{opt2} #{brd.last}"
    brd.join(opt1)
  end
end

#BONUS 2

keep score of each round - first to win 5 rounds is the winner

PEDAC

Need to keep main game loop intact but insert it into an additional outer loop
_outer loop with hold the score
-add to score based on result of each round
-break out of outer loop if outer score = 5
-alter prompt to allow exiting game after each round,
--need another replay prompt after a grand winner is declared


-create helper method `winners(result)` (add arg someone_won?(brd) )to hold grand winner score
def winners(result)
  player_score = 0
  computer_score = 0
  ties = 0

  if result == "Player"
    player_score += 1
  elsif result == "Computer"
    computer_socre += 1
  else
    ties += 1
  end

  prompt "Current score is Player: #{player_score}, Computer: #{computer_score}," +
        "Ties: #{ties}."
end

prompt "Current score is #{winners(someone_won?(brd))}"

#add another helper method to determine grand wnner and break main loop

def grandwinner(score)
if winners

# BONUS 3

changes the computer_places_piece! method
-iterate through WINNING_LINES (possible 3-space combos that win)
---thoughts - i think we need a manual loop to achieve this? Not sure how else to
      short-circuit the looping.
      --currently using each is causing computer to populate all spaces that meet the criteria (all empty spaces)
      using loop and a counter alls for a break statement as soon as a row meetshte condition
      ----other probs:
                not sure WHY comp is populating all empty spaces -- given the if condition, it should oly do that if
                the row already contains 2 player markers, but it's populating the entire board after the player's first move
                go find out WHY


--if a winning line includes 2 Xs (PLAYER_MARKER)
----computer places piece on the third line
--else
----random placement

ok -- took a peek at some code review comments

looks like I should maintain the original computer_places_pieces method, but
within it place helper method find_at_risk_square
then if that ocde returns false, computer will choose randomly

BONUS 6

removed the individual lines;

 player_places_piece!(board)
  break if someone_won?(board) || board_full?(board)

  computer_places_piece!(board)
  break if someone_won?(board) || board_full?(board)

  and replace with2  methods: place_piece! and alternate_player

  --on the previous exericse, I removed this lines and placed them into separate
  based on the identfied starting player. Need to a) refactor within methods
  b) combine into new method or c) take some steps back, modify in-place per
  original, and consider how else to lend control over the starting player

  new code is:

loop do
  display_board(board)
  place_piece!(board, current_player)
  current_player = alternate_player(current_player)
  break if someone_won?(board) || board_full?(board)
end

assignment is to write the two methods:

def place_piece!(brd, turn)

end

def alternate_player(turn)

end

### TTT2

Pedac notes from second pass through tic tac toe bonus (12/9)

BONUS 1

Problem:

-modify display so that available spaces are joined with 'or'
-allow for optional arguments that can change 1. punctuation and 2. joining word

input: array (passed in by detect_winner(board))
output: array joined with punctuation (arg2) and joining word of user's choice (arg3)

rules:
when array length >= 3
-add arg2 and arg3
when array length == 2
-add arg3
when array length == 1
array

thoughts:
define method
-set method definition to 3 parameters
--2nd and 3rd parameters should have default arguments set to ',' and 'or'
outline control flow statement instructing program how to apply arg2 and arg3

Example:

joinor([1, 2])                   # => "1 or 2"
joinor([1, 2, 3])                # => "1, 2, or 3"
joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"


ok. Keeping score of rounds and breaking loop when winner hits 5 

this will need a double loop - one greater gameplay loop with scores initialized
and a second inner loop that is tallying those score. break the inner loop when 5
and then break without condition the outer loop


=end

