=begin

Completing a second pass at the tic tac toe walk through and bonuses.

Had a busy week on the first round and I don't have a good grasp of the overall
logic of the program - having a hard time keeping the methods straight etc

Completed the bonus problems but making a second attmept before moving on to 21

Steps:

X 1. Display initial empty 3x3 board
2. Ask user to mark a square
3. Computer marks square
4. Display updated board
5. If winner, display winner
6. If board is full, display tie
7. If neither winner nor full board, back to Step 2 (user marks square)
8. Play again?
9. If yes, back to Step 1 (display empty board)
10. if no, goodbye)

=end

require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system "clear"
  puts "You're #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |"
  puts " #{brd[1]}   |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts " #{brd[4]}   |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(array, punctuation=', ', joiner='or')
  case array.size
  when 1 then array.first.to_s
  when 2 then "#{array.first} #{joiner} #{array.last}"
  else
    array[-1] = "#{joiner} #{array.last}"
    array.join(punctuation)
  end
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = nil
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd)
    break if square
  end
  if !square
    square = empty_squares(brd).sample
  end
  brd[square] = COMPUTER_MARKER
end

def find_at_risk_square(line, board)
  if board.values_at(*line).count(PLAYER_MARKER) == 2
    board.select {|k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  else
    nil
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return "Player"
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return "Computer"
    end
  end
  nil
end

def display_round_result(brd)
  if someone_won?(brd)
    prompt "#{detect_winner(brd)} won!"
  else
    prompt "It's a tie!"
  end
end

def score_keeper(winner, brd, score_hash)
  case detect_winner(brd)
  when 'Player' then score_hash[:player_score] += 1
  when 'Computer' then score_hash[:computer_score] += 1
  else
    score_hash[:ties] += 1
  end
end

def display_score_update(score_hash)
  prompt "Current score is Player: #{score_hash[:player_score]}, " \
         "Computer: #{score_hash[:computer_score]}, ties: #{score_hash[:ties]}."
end

def replay_prompt
  prompt "Play again? (y or n)"
  loop do
  answer = gets.chomp
  if answer.start_with?('y')
    return true
  elsif answer.start_with?('n')
    return false
  else
    prompt "Sorry, invalid choice. Pick 'y' or 'n"
  end
end
end

def grand_winner(scores_hash)
  if scores_hash[:computer_score] == 5
    prompt "Computer is the grandwinner!"
  elsif scores_hash[:player_score] == 5
    prompt "Player is the grandwinner!"
  end
end

def score_reset(scores_hash)
  scores_hash[:player_score] = 0
  scores_hash[:computer_score] = 0
  scores_hash[:player_score] = 0
end

scores = {
  player_score: 0,
  computer_score: 0,
  ties: 0
}

loop do #grandwinner outer loop start
 board = initialize_board

  loop do # single round inner loop start
    display_board(board)

    player_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
    computer_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
  end # single round inner loop end

  display_board(board)
  display_round_result(board)

  score_keeper(detect_winner(board), board, scores)
  display_score_update(scores)

  if scores[:player_score] == 5 || scores[:computer_score] == 5
    grand_winner(scores)
    score_reset(scores)
  end

  break unless replay_prompt
end #end of outer grandwinner game loop

prompt "Thanks for playing Tic Tac Toe! Goodbye!"
