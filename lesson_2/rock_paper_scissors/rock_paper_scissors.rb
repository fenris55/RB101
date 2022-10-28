require "yaml"

MESSAGES = YAML.load_file(".rps_messages.yml")

VALID_CHOICES = ["rock", "paper", "scissors", "lizard", "spock"]

WINNING_PLAYS = { rock: ["scissors", "lizard"],
                  paper: ["rock", "spock"],
                  scissors: ["paper", "lizard"],
                  lizard: ["paper", "spock"],
                  spock: ["rock", "scissors"] }

def prompt(message)
  Kernel.puts("=> #{message}")
end

def clear_screen
  system("clear") || system("cls")
end

def letter_to_word(letter)
  case letter
  when "r" then "rock"
  when "p" then "paper"
  when "s" then "scissors"
  when "l" then "lizard"
  when "sp" then "spock"
  end
end

# took this solution from code reviews - the rest did without checking answers
def win?(move1, move2)
  WINNING_PLAYS[move1.to_sym()].include?(move2)
end

def display_results(player, computer)
  if win?(player, computer)
    prompt(MESSAGES["win"])
  elsif win?(computer, player)
    prompt(MESSAGES["lose"])
  else
    prompt(MESSAGES["tie"])
  end
end

def grandwinner(score1, score2)
  if score1 == 3
    prompt(MESSAGES["linebreak1"])
    prompt(MESSAGES["grandwinner"])
  elsif score2 == 3
    prompt(MESSAGES["linebreak2"])
    prompt(MESSAGES["grandloser"])
  end
end

loop do # creating outermost loop for replay
  player_score = 0
  computer_score = 0

  loop do # outer loop for incrementation
    choice = ""
    computer_choice = ""

    loop do # main game loop for single round
      loop do # user input validation loop
        prompt(MESSAGES["welcome"])
        prompt("Choose one: #{VALID_CHOICES.join(', ')}.")
        prompt(MESSAGES["abbr_choices"])
        choice = Kernel.gets().chomp.downcase

        clear_screen

        if VALID_CHOICES.include?(choice)
          break
        elsif letter_to_word(choice)
          choice = letter_to_word(choice)
          break
        else
          prompt(MESSAGES["input_error"])
        end
      end # end of user input validation loop

      computer_choice = VALID_CHOICES.sample

      prompt("You chose #{choice}; Computer chose #{computer_choice}")
      display_results(choice, computer_choice)
      break # round complete, breaking out of main game loop
    end # end of main game loop

    # now returning to outer loop for incrementation

    if win?(choice, computer_choice)
      player_score += 1
    elsif win?(computer_choice, choice)
      computer_score += 1
    end

    prompt("Current score is you: #{player_score} Computer: #{computer_score}")

    grandwinner(player_score, computer_score)
    break if player_score == 3 || computer_score == 3
  end # end incrementation loop

  prompt(MESSAGES["replay"])
  answer = Kernel.gets.chomp
  clear_screen
  break unless answer.downcase().start_with?("y")
end # ending outermost loop
prompt(MESSAGES["goodbye"])
