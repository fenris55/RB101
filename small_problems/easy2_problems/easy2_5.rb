=begin

Write a program that asks for user's name and greets  user.
If user writes "name!" then the computer yells back to the user.

input: string
output: string (upcased if input includes !)

algorithm:

-prompt user for name
--validate

-if name includes ! as the last character
--upcase name and return upcase sentence with name interpolated
-if name doesn't include !
--return normal greeting with interpolated name


user_name = ''

loop do
  puts "What is your name?"
  user_name = gets.chomp
  break unless user_name.empty?
  put "Please enter a name!"
end

if user_name.split('').last == '!' #shorter to check with index reference
  puts "WHY ARE WE SCREAMING, #{user_name.delete_suffix('!').upcase}?"
else
  puts "Hello #{user_name.capitalize}."
end

completing bonus challenge below: use chomp! and chop!
# alos, noticing these solutions don't include input validation

puts "What's your name?"
name = gets.chomp!

if name[-1] == '!'
  name = name.chop!
  puts "WHY ARE WE SCREAMING, #{name.upcase}?"
else
  puts "Hello, #{name}."
end
retrying 1/18

problem:

ask for user's name and greet them - if they enter a !, output in all caps

input: string (with or without !)
output: string

rules:
-if user name include !, output greeting in all caps
- otherwise, just greet using name
 - assume valid input?

algorithm:
-prompt user for name and save
- check if name includes !
  - if no, interpolate name into string greeting and print
  - if yes, same but upcase output

notes:
forgot to consider example - ! is removed from output. opted for #delete
-- could have also used #chop


puts "Hi! What's your name?"
name = gets.chomp

if name.include?('!')
  puts "HELLO #{name.upcase.delete('!')}. WHY ARE WE SHOUTING?!"
else
  puts "How's it going, #{name.capitalize}?"
end

challenge: repeat, but use both #chomp and #chop
=end

puts "Hi! What's your name?"
name = gets.chomp

if name[-1] == '!'
  puts "HELLO #{name.upcase.chop}. WHY ARE WE SHOUTING?!"
else
  puts "How's it going, #{name.capitalize}?"
end






















