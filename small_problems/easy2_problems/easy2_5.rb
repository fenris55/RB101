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
=end

puts "What's your name?"
name = gets.chomp!

if name[-1] == '!'
  name = name.chop!
  puts "WHY ARE WE SCREAMING, #{name.upcase}?"
else
  puts "Hello, #{name}."
end


