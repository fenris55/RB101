=begin
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
    string = string[0, 78]
  else
    string#.join
  end
  string#.join
end

print_in_box('I see a lemondrop and a lollipop and a chocolate buttercup and some candy canes')

retrying 1/12

def print_in_box(string)
  length = string.size + 2
  horizontal = '+' + ('-' * length) + '+'
  puts horizontal
  puts '|' + ' ' * length + '|'
  puts '| ' + string + ' |'
  puts '|' + ' ' * length + '|'
  puts horizontal
end

print_in_box('I see you')

close, but cleaning up by copying solution

def print_in_box(message)
  horizontal_rule = "+#{'-' * (message.size + 2) }+"
  vertical = "|#{' ' * (message.size + 2)}|"

  puts horizontal_rule
  puts vertical
  puts "| #{message} |"
  puts vertical
  puts horizontal_rule
end


print_in_box('I see you')


practicing again 1/15


p:  write a method that prints a line of text correctly formatted in a box

input: string
output: string in box

rules:
- print from within method
-box corners are +
-box horizontal sides are -
-box vertical sides are |
-vertical side have 3 bars
- string about be aligned with middle (2nd) bar
-horizontal lines should be 2 spaces longer thn string (1 extra space each side)
-empty string input should output an empty box
-assume valid string input

and UGh. Can complete challenge one, but still can do challenge 2. Leaving it to come back to
=end

def print_in_box(string)

  if string.length > 78
    string = string[0, 77]
  end

  horizontal = "+#{ '-' * (string.length + 2)}+"
  vertical = "|#{ ' ' * (string.length + 2)}|"

  puts horizontal
  puts vertical
  puts "| #{string} |"
  puts vertical
  puts horizontal
end

print_in_box('ishdfjhbiufgwiuhfoiwhfjourhiuhfoihf;oiw;gouhliufbiugfliwuhfliuwhFLIUWGFLIUWGFILGIUGFjudsffjwyrgfiuheuhqochqbib')
