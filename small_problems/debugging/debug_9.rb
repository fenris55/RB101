=begin
4/3

P:
-rightnow, the methdo is being recusively called in the else statement
--the brek condition only works when the user guesses correctly, but it forced
the user to undergo 3 rounds of the games.

secondly, the recursive method call in the else clause means that the
winning number and attempts counter are reset to 0 with each recursion, so the break condition
cannot be met unless the user guesses the winning number (and enters it three times. )

1. add break condition to break after winning output
2. remove the recusive method call, since the program is already running in
loop with an appropriate counter adn break condition
=end


def valid_integer?(string)
  string.to_i.to_s == string
end

def guess_number(max_number, max_attempts)
  winning_number = (1..max_number).to_a.sample
  attempts = 0

  loop do
    attempts += 1
    break if attempts > max_attempts

    input = nil
    until valid_integer?(input)
      print 'Make a guess: '
      input = gets.chomp
    end

    guess = input.to_i

    if guess == winning_number
      puts 'Yes! You win.'
      break
    else
      puts 'Nope. Too small.' if guess < winning_number
      puts 'Nope. Too big.'   if guess > winning_number

      # Try again:
  #    guess_number(max_number, max_attempts)
    end
  end
end

guess_number(10, 3)