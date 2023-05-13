=begin
4/2

P:
write a method that takes a stringg and check if all pairs of parentheses have
matching opening and closings; first occurence must be an opening parenthesis

input: string
return: boolean

rules:
-check if all parentheses appear in correct pairs
-first occurence must be an opening parenthesis
-return true if input string contains no parentheses
-occurence of parentheses must follow the pattern: ()()()
  -cannot simply check whether the count of opengin adn closing equal
    -ie: 'Hey (there) )how are you('

E:
balanced?('What (is) this?') == true
balanced?('What is) this?') == false
balanced?('What (is this?') == false
balanced?('((What) (is this))?') == true
balanced?('((What)) (is this))?') == false
balanced?('Hey!') == true
balanced?(')Hey!(') == false
balanced?('What ((is))) up(') == false

D:
-iterative strucutre to evaluate string

A:
-remove all non-( ) chars from the input string
-return true if string is empty
-return false if length of string is odd
-iterate over each_char with index
  -if index is even (0, 2, 4)
    el == '('
  -else (meaning index is odd) (1, 3, 5)
    el == ')'
# tried and then refactored. Test cases pass, but my logic for finding the pattern
doesn't hold up. I can modify the test cases so that it doesn't work: this is very
similar to the issue I had with the codewars url problem. and also the one with the
# representing delete. Basically the string needs to be modified according to the
given parameters. Then that actins need to be looped until nothing is left to delete.

so here: basically need to delete an opening and closing pair, and then repeated until
none are left

#ugh idk this is turning into hack and slash mess. Checking solution, writing
below, and following up re this specific type of string manipulation during
next session

def balanced?(string)
  string.gsub!(/[^()]/, '')
  return true if string.empty?
  return false if string.length.odd?
  first = '('
  last = ')'
 # loop do
  # break if string[0] == first && string[-1] == ')' && string.size == 2

  string.count('(') == string.count(')') && string[0] == '(' && string[-1] == ')'
 #p (booleans = string.chars.map.with_index do |par, index|
  #  if index.even?
   #   par == '('
  #  else
  #    par == ')'
   # end

  #end)
 # booleans.all? { |bool| bool == true }
end

p balanced?('What (is) )( ()this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false


#lesson solution
solution uses a counter: +1 for an opening, -1 for a closing. If a closing appears
before an opening, the counter will eventually dip to -1; break condition exits
loop at this point, then checks if counter is at 0 or -1 for return value. does not
modify original strnig; iteration only considers chars ( and
)

def balanced?(string)
 parens = 0
 string.each_char do |char|
  parens += 1 if char == '('
  parens -+ 1 if char == ')'
  break if parens < 0
 end
 parens.zero?
end

#challenge: modify method to account for other matching pairs, like {}, [], single
and double quotes - case statements and counters for each?
pedac:
-initialize counters for [], {}, '', ""
place case statement into black
=end


def balanced?(string)
 parens = 0
 curly = 0
 square = 0
 single = 0
 double = 0
#infinite loop - coming back later
 string.each_char do |char|
  case char
  when '(' then parens +=1
  when ')' then parens -=1
  when '{' then curly += 1
  when '}' then curly -=1
  when '[' then square +=1
  when ']' then square -= 1
  when "'" then single += 1
  when '"' then double +=1
  end
  break if parens < 0 || curly < 0 || square < 0
 end
 parens.zero? && curly.zero? && square.zero? && single.even? && double.even?
end

p balanced?('Wh{at [(is)}]'''' this?') == true
balanced?('What is) this?') == false
balanced?('What (is this?') == false
balanced?('((What) (is this))?') == true
balanced?('((What)) (is this))?') == false
balanced?('Hey!') == true
balanced?(')Hey!(') == false
balanced?('What ((is))) up(') == false