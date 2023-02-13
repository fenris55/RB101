=begin

#note on progression (12/25)

1. made initial hash, but didn't know how to move forward with it
2. followed suggestions given in lesson, but couldn't make a complete program
3. moving to new doc (21_solution.rb) to code out provided solution
4. will return and see if any of the code I wrote below can be implemented in it


pseudocode taken from lesson:

1.Initialize deck
2. Deal cards to player and dealer
3. Player turn: hit or stay
-repeat until bust or 'stay'
4. If player bust, dealer wins
5. Dealer turn: hit or stay
-repeat until total >= 17
6.If dealer bust, player wins
7. Compare cards and decalre winner


Step 1: initialize the deck

problem:
-need to represent an entire card deck, including suits
-each card has a corresponding numeric value
--so, each card has 3 pieces of data: suit, type, and value
--2 options:
  -1. associate numeric value from the start, or
  -2. associate just suit and type from the start, and worry about adding values later
--seems like it will improve efficiency in teh long run to full set the deck with all three data bits

How to arrnage deck:
seems like a nested hash works best, with suit as key and value as nested hash of type/amount for key value
----suits as keys, etc

OK test below. I can autopopulate the numbers (deck = {} // (2..10).each { |num| deck[num] = num } )
BUT idk how to deal with A the nested elements of the hash or B the need ot repeat them 4 times


deck = { 'hearts'=> {2=> 2, 3=>3, 4=>4, 5=>5, 6=>6, 7=>7, 8=>8, 9=>9, 10=>10, 'jack'=> 10, 'queen'=> 10, 'king'=>10, 'ace'=> [1, 11] },
         'diamonds'=> {2=> 2, 3=>3, 4=>4, 5=>5, 6=>6, 7=>7, 8=>8, 9=>9, 10=>10, 'jack'=> 10, 'queen'=> 10, 'king'=>10, 'ace'=> [1, 11] },
         'spades'=> {2=> 2, 3=>3, 4=>4, 5=>5, 6=>6, 7=>7, 8=>8, 9=>9, 10=>10, 'jack'=> 10, 'queen'=> 10, 'king'=>10, 'ace'=> [1, 11] },
         'clubs'=> {2=> 2, 3=>3, 4=>4, 5=>5, 6=>6, 7=>7, 8=>8, 9=>9, 10=>10, 'jack'=> 10, 'queen'=> 10, 'king'=>10, 'ace'=> [1, 11] }
}

### Having fun playing with this, but pausing to follow LS's solution

PEDAC for adding cards and handling ace
-currently, ace value is array [1, 11]. This can complicate hash iterations.
--consider changing to a stand-in value for easier iteration

pass players_cards into total method (hash with same format as deck)
-access values of players_cars hash (will return an array of hashes)


def create_deck #omg this works
  deck = {}
  %w(hearts diamonds spades clubs).each do |suit|
    deck[suit] = {}
    (2..10).each do |num|
      deck[suit][num] = num
      %w(jack queen king).each do |head|
        deck[suit][head] = 10
        %w(ace).each do |ace|
          deck[suit][ace] = [1, 11]
        end
      end
    end
  end
  deck
end

def players_cards(card) #initializing hash with keys set as the suits
  players_hand = {}
  %w(hearts diamonds spades clubs).each do |suit|
    players_hand[suit] = ''
  end
  players_hand
end

def dealers_cards(card)
  dealers_hand = {}
  %w(hearts diamonds spades clubs).each do |suit|
    dealers_hand[suit] = ''
  end
  dealers_hand
end

def add_total(cards)
  # cards: {hearts: {2=>2, 'jack'=> 10}}
amounts = 0
cards.each do |suit, data|
  data.each do |type, amount|
    unless amount == '' || amount == 'X'
     total += amount

     if amount == 'X' && ((amounts - 11) < 21) # i know this can't work within the block
       amount == 11
      else
        amount = 1
      end
    amounts += amount
  end
  amounts
end


end

add_total(players_cards(card))


beginning PEDAC to attempt LS solution

creating deck

problem:
create a nested array. each sub array has 2 elements: suit and type (ie [heart, 3], [diamond, jack])
-each first sub-array element (suit letter) will be repeated 13 times

deck = [['H', '2'], ['H', '3'], ['H', '2']]

UGH this is not working. Going back to my first attempt

deck = []
suits = %w(H D C S)

suits.map do |suit|
  13.times { deck << [suit] }
end

(deck[0]..deck[7]).m

#handling ace value - used code example given in lesson

# handling player's turn

1. prompt player to 'hit' or 'stay'
2. if stay, stop
3. if hit, return to 1

=end

SUITS = %w(H S C D)
VALUES = (2..10)
FACES = %w(jack king queen)
ACE = %w(ace)

def create_deck(s, v, f, a) # messy, but successfully creates entire deck as nested array
  deck = []
    SUITS.map do |suit|
      VALUES.map do |num|
        deck << [suit, num]
      end
      FACES.map do |face|
        deck << [suit, face]
      end
      ACE.map do |ace|
      deck << [suit, ace]
      end
    end
  deck
end

# need to hold dealer and player hands using nested array structure
def players_cards(card) # arg is nested array
  players_hand = []
  players_hand << card
  players_hand
end

def dealers_cards(card) #arg is nested array
  dealers_hand = []
  dealers_hand << card
  dealers_hand
end

def total(cards) # total method taken from solution
  values = cards.map { |card| card[1] } # extracting values from nested array

  sum = 0
  values.each do |value|
    if value == 'A'
      sum += 11
    elsif value.to_i == 0 # j, q, k
      sum += 10
    else
      sum += value.to_i #my numbers are already integers; watch out for that here.
    end
  end
# adjusting ace value based on total (1 or 11)
  values.select { |value| value == 'A'}.count.times do# adjusting Ace
    sum -=10 if sum > 21
  end

  sum
end

def busted?(cards)
  total = 0
  cards.values.select { |value| value += total }
  total
end

def determine_winner(cards1, cards2)

end

def display_winner(result) #feed in determne winner method above
  if result == "Player"
    puts "Player wins!"
  else
    puts "Dealer wins!"
  end
end

deck = create_deck(SUITS, VALUES, FACES, ACE) # renaming deck to pass around

player_score = 0
dealer_score = 0

answer = nil
loop do
  puts "hit or stay?"
  answer = gets.chomp
  break if answer == 'stay' || busted?(player_cards) #need to write busted? method
end

if busted?(player_cards)
  puts "Game over!" # add play again prompt
else
  puts "You chose to stay!"
end

#dealer turn
loop do
  break if total(dealer_cards) >= 17
  # idk - need to generate cards
end

display_winner(determine_winner(player_cards, computer_cards))
