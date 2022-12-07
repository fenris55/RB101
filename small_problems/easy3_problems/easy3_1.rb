=begin

Write a program that solicits 6 numbers from the user, then prints a message
that describes whether or not the 6th number appears amongst the first 5 numbers.

input: 6 integers
output: string (based on/explaining boolean return value of method)

-initialize empty array

-initialize loop
-prompt user to enter a number
-validate number
--if valid, add number to array
--else, output string asking for valid input
-break loop if empty array contains 6 values
-end loop

-write method num_checker that take the user input array as an argument
-remove array element at index[-1] from array and save in separate variable (last_num) -- pop
-check if user input array (now length == 5) includes last_num
---feed back to main loop
if num_checker,
-output confirmation that the final number was included in the first 5
else
-not number was not included

=end

def num_checker(arr)
  last_num = arr.pop
  arr.include?(last_num)
end

user_input = []

loop do
  puts "Enter a number:" # shouldhave read examples more carefully - use different putput for each
  user_num = gets.chomp
  #skipping integer validation for now -- no rules, exmples only show positive integers
  user_input << user_num
  break if user_input.length == 6
end

last_num = user_input.last # refactor - included both here and in method

if num_checker(user_input)
  puts "The number #{last_num} apears in #{user_input}."
else
  puts puts "The number #{last_num} does not apear in #{user_input}."
end





