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


retrying 1/21

problem:
prompt user for 6 numbers and identify whether number 6 was already entered

input: 6 integers
output: string displaying results

rules:
-should output from program
-should interpolate the 6 inputs in output
-prompt user for input 5 times and save result in array
-prompt user for 6th input and check if included in array

algorithm:

-create int_array to hold first 5 integers
-create variable = 0  to hold 6th integer
-set counter = 1 for loop
-initialize loop
  -prompt user for integer with counter interpolated
  -save and convert to integer
  -validate
  -add to int_array if int_array.length <=5
else save to variable
  -increment counter
  break if counter > 6

  check if int_array includes variable
  if true..
else...


Notes: initially had the if/else wrong
- had it set to "if int_array.size <= 5"
- on the 6th iteration int_array.size == 5, so the sixth number was being added,
  no reassignment reoccured, and the array was being checked for 0. Solved by
  changing from <= to ==

- forgot to validate!
=end


def output_solution(array, number)
  if array.include?(number)
    puts "The number #{number} appears in #{array}."
  else
    puts "The number #{number} doesn't appear in #{array}."
  end
end

numbers = {1 => '1st', 2 => '2nd', 3 => '3rd', 4 => '4th', 5 =>'5th', 6 => 'last'}
int_array = []
sixth_num = 0
counter = 1

loop do
  puts "Enter the #{numbers[counter]} number:"
  num = gets.chomp.to_i
  if int_array.size < 5
    int_array << num
  else
    sixth_num = num
  end
  counter +=1
  break if counter > 6
end

output_solution(int_array, sixth_num)
















