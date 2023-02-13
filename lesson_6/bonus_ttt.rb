=begin
Notes - planning to come back around and do this assignmet again

1. did not complete bonus 6 - already refactored that main code into helper methods
2. parts of main code could be refactored, but not sure how to continue accessing the variables
3. one method is very long and needs to be refactored into helper methods
4. random selection does not work
  - chooses whichever methods (player or computer) is listed first
  - when r is chosen, screen continues displaying for one round -- after a computer win,
     player must take another turn before the score updates and game ends
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
  puts " #{brd[7]}   |  #{brd[8]}  |   #{brd[9]}"
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

# solved and then refactored based on solution
def joinor(arr, opt1=', ', opt2='or')
  case arr.size
  when 1 then arr.first.to_s
  when 2 then arr.join(" #{opt2} ")
  else
    arr[-1] = "#{opt2} #{arr.last}"
    arr.join(opt1)
  end
end

def first_move(brd, choice)
  player_first_move(brd) if choice == 'p'
  computer_first_move(brd) if choice == 'c'
  random_first_move(brd) if choice == 'r'
end

#bonus 6 - use the below code in place of the code used in the
#player_first_move and computer_first_move methods

=begin
loop do
  display_board(board)
  place_piece!(board, current_player)
  current_player = alternate_player(current_player)
  break if someone_won?(board) || board_full?(board)
end

=end

def player_first_move(brd)
loop do
  player_places_piece!(brd)
  break if someone_won?(brd) || board_full?(brd)
  computer_places_piece!(brd)
  break if someone_won?(brd) || board_full?(brd)
end
end

def computer_first_move(brd)
loop do
    computer_places_piece!(brd)
    break if someone_won?(brd) || board_full?(brd)
    player_places_piece!(brd)
    break if someone_won?(brd) || board_full?(brd)
end
end

def random_first_move(brd) # not working -- running whichever comes first
  c = computer_first_move(brd)
  pl = player_first_move(brd)
  [c, pl].sample
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square: #{joinor(empty_squares(brd))}"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, thats not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def find_at_risk_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select { |k, v| line.include?(k) && v == INITIAL_MARKER}.keys.first
  else
    nil
  end
end

def computer_places_piece!(brd) # refactor with helper methods for each if
  square = nil
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, COMPUTER_MARKER)
    break if square
  end

  if !square
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, PLAYER_MARKER)
    break if square
    end
  end

  if !square
    brd.each do |k, v|
      if k == 5 && v == INITIAL_MARKER
        square = brd[5] = COMPUTER_MARKER
      end
    break if square
    end
  end

  if !square
    square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
  display_board(brd)
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

def score_update(brd)
  if someone_won?(brd)
    prompt "#{detect_winner(brd)} won!"
  else
    prompt "It's a tie!"
  end
end

loop do # main loop for grandwinner (5 rounds)
  player_score = 0 # level 1 loop initializing scores
  computer_score = 0
  ties = 0

  loop do # level 2 loop for incrementation (up to 5 rounds)
    board = initialize_board

    loop do # level 3 for single round
    answer = ''
      loop do # input validation loop
        prompt "Who should go first? Type 'p' for player, 'c' for computer, or 'r' for 'random'."
        answer = gets.chomp.downcase

        unless ['c', 'p', 'r'].include?(answer)
          prompt "Sorry, that's not a valid choice. Type 'p' or 'c'."
        end
        break if answer =='c' || answer == 'p' || answer == 'r'
      end # end input validation loop

      display_board(board)
      first_move(board, answer)
     # display_board(board) # why is this here? - to display results of move
      score_update(board)

      # not sure how to refactor into method and still access score variables
      if detect_winner(board) == "Player"
        player_score += 1
      elsif detect_winner(board) == "Computer"
        computer_score += 1
      else # detect_winner(board) == nil
        ties += 1
      end

      prompt "Current score for rounds won is Player: #{player_score}, " \
             "Computer: #{computer_score}, ties: #{ties}."

      break
    end # level 3 loop for single round

    #again not sure how to put into method and access variables
    if player_score == 5 || computer_score == 5
      prompt "The grand winner is: #{detect_winner(board)}!"
      player_score = 0 && computer_score = 0
    end

    prompt "Would you like to play another round? (type 'y' or 'n')"
    answer = gets.chomp
    break unless answer.downcase == 'y'
  end # end of level 2 loop for grandwinner incrementation

  break
end # end of level 1 loop - grandwinner

prompt "Thanks for playing Tic Tac Toe! Goodbye!"
