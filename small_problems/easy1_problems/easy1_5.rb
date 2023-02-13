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

=end

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