=begin

-based on solution provided in lesson

current issue:
-reset method not working (resetting scores isn't working, so grandwinner
prompt outputs on each round after 5 is reached) - have tried multiple ways to
fix this and just dont know why scores aren't resetting

=end

SUITS = ['Hearts', 'Diamonds', 'Spades', 'Clubs']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen'] +
         ['King', 'Ace']
WIN = 21
DEALER_MAX = 17

def prompt(msg)
  puts "=> #{msg}"
end

def intro
  prompt "Welcome to Twenty-One!"
  prompt "Get as close as possible to 21 to win. Go over 21 and you bust."
end

def initialize_deck
  SUITS.product(VALUES).shuffle
end

def initial_deal(player, dealer, deck)
  2.times do
    player << deck.pop
    dealer << deck.pop
  end
end

def clear
  system("clear") || system("cls")
end

def total(cards)
  values = cards.map { |card| card[1] }

  sum = 0
  values.each do |value|
    if value == 'A'
      sum += 11
    elsif value.to_i == 0
      sum += 10
    else
      sum += value.to_i
    end
  end

  values.select { |value| value == 'A' }.count.times do
    sum -= 10 if sum > WIN
  end

  sum
end

def display_starting_hand(player_cards, dealer_cards, player_total)
  prompt "Dealer has #{dealer_cards[0]} and ?"
  prompt "Player has #{player_cards[0]} and #{player_cards[1]} for a total of" \
         " #{player_total}"
end

def busted?(totals)
  totals > WIN
end

def detect_result(dealer_total, player_total)
  if player_total > WIN
    :player_busted
  elsif dealer_total > WIN
    :dealer_busted
  elsif dealer_total < player_total
    :player
  elsif dealer_total > player_total
    :dealer
  else
    :tie
  end
end

def display_results(dealer_cards, player_cards)
  result = detect_result(dealer_cards, player_cards)

  case result
  when :player_busted
    prompt "You busted! Dealer wins!"
  when :dealer_busted
    prompt "Dealer busted! You win!"
  when :player
    prompt "You win!"
  when :dealer
    prompt "Dealer wins!"
  when :tie
    prompt "It's a tie!"
  end
end

def play_again?
  puts "-------------"
  prompt "Do you want to play again?"
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

def card_compare(dealer_cards, dealer_total, player_cards, player_total)
  puts "=================="
  prompt "Dealer has: #{dealer_cards}, for a total of: #{dealer_total}"
  prompt "Player has: #{player_cards}, for a total of: #{player_total}"
  puts "=================="
end

def score_keeper(result, scores)
  case result
  when :player_busted
    scores[:dealer] += 1
  when :dealer
    scores[:dealer] += 1
  when :dealer_busted
    scores[:player] += 1
  when :player
    scores[:player] += 1
  when :tie
    scores[:ties] += 1
  end
end

def display_round_score(scores)
  prompt "Current score is: #{scores}"
end

def grandwinner(scores)
  if scores[:player] == 5
    prompt "Player is the grandwinner!"
  elsif scores[:dealer] == 5
    prompt "Dealer is the grandwinner!"
  end
end

def reset(scores)
  scores[:player] = 0
  scores[:dealer] = 0
  scores[:ties] = 0
end

# begin program
loop do
  intro
  scores = { player: 0, dealer: 0, ties: 0 }

  loop do
    deck = initialize_deck
    player_cards = []
    dealer_cards = []

    initial_deal(player_cards, dealer_cards, deck)

    player_total = total(player_cards)
    dealer_total = total(dealer_cards)

    display_starting_hand(player_cards, dealer_cards, player_total)

    # player turn
    loop do
      player_turn = nil
      loop do
        prompt "Would you like to (h)it or (s)tay?"
        player_turn = gets.chomp.downcase
        clear
        break if ['h', 's'].include?(player_turn)
        prompt "Sorry, must enter 'h' or 's'."
      end

      if player_turn == 'h'
        player_cards << deck.pop
        player_total = total(player_cards)
        prompt "You chose to hit!"
        prompt "Your cards are now: #{player_cards}"
        prompt "Your total is now: #{player_total}"
      end

      break if player_turn == 's' || busted?(player_total)
    end

    if busted?(player_total)
      clear
      card_compare(dealer_cards, dealer_total, player_cards, player_total)
      display_results(dealer_total, player_total)
      score_keeper(detect_result(dealer_total, player_total), scores)
      display_round_score(scores)
      reset(scores) if grandwinner(scores)
      play_again? ? next : break
    else
      prompt "You stayed at #{player_total}"
    end

    # dealer turn
    prompt "Dealer's turn..."

    loop do
      break if dealer_total >= DEALER_MAX

      prompt "Dealer hits!"
      dealer_cards << deck.pop
      dealer_total = total(dealer_cards)
      prompt "Dealer's cards are now: #{dealer_cards}"
    end

    if busted?(dealer_total)
      clear
      prompt "Dealer total is now: #{dealer_total}"
      card_compare(dealer_cards, dealer_total, player_cards, player_total)
      display_results(dealer_total, player_total)
      score_keeper(detect_result(dealer_total, player_total), scores)
      display_round_score(scores)
      reset_scores(scores) if grandwinner(scores)
      play_again? ? next : break
    else
      prompt "Dealer stays at #{dealer_total}"
    end

    # if both player and dealer stay
    card_compare(dealer_cards, dealer_total, player_cards, player_total)
    display_results(dealer_total, player_total)
    score_keeper(detect_result(dealer_total, player_total), scores)
    display_round_score(scores)
    reset(scores) if grandwinner(scores)
    play_again? ? next : break
  end
  break
end

clear
prompt "Thank you for playing Twenty-One! Goodbye!"
