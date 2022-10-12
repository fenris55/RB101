# Lesson 2.15 -
#Adding bonus features to calculator

=begin

# BONUS FEATURE 1 - improve integer validation and allow for 0
## solved both without checking answer

P: current method of integer validation is weak and doesn't allow
0 to be used in calculations. Improve validation method to fix

E: ?? not sure how to show examples for better int validation
  input: 2, 0, add; output: 2
  input: 0, 5, subtract; output: -5
  input: 8, 0, multiply; output: 0
  input 0, 2, divide; output: 0
  input 2, 0, divide; output: ZeroDivisionError

  SO zero can be used for every problem except as the second number if divide
  is chose

  - changes to integer validation must occur in our valid_number method
  - also need to set an IF statement that asks user to choose a different
    operation if they've selected 'divide' && set number2 as 0

D: for integer validation: ?? variables/methods
   for zero division: if statement

A: for int validation:
    define method with one parameter
    convert parameter into an integer and then back into a string
    check if converted parameter is equal to initial parameter
    if yes, true - method returns true so don't need to explicitly return

   for adding zero:
    if above modifications work, program will now accept zero
    however, will throw an error if 0 is entered as number2 and operator is
    'divide' (4)

    2 ways to solve:
    with reg ex (dont have much practice with this)
    with an if statement that asks user to choose a different operation
   ( IF number2 == 0 && operator == 4
     loop do
     prompt("Can't divide by zero! please choose a different operator")
     break if w%(1 2 3).include? operator
     end

BONUS FEATURE 2 - account for floats or integers

P: program currently doesn't accept floats - resolve
thoughts -- do we need to now remove valid_num? method for interger validation
   and replace it with new method number? i think yes?

E: input: 4.1, 5.9, add; output: 10.0
   input 4.1 * 3.2, multiply; output: 13.12

D: ?? writing new method with .to_i, .to_s, .to_f

A: def method with parameter accepting number for validation
   use logical or (||)
   convert string input to int and back to string and compare to input
   OR
   convert float input to string and back to float and compare to input
   method will return true if either conversion is true
   commenting out valid_number? to try this feature instead
  ----come back to think. The above works, but fails to consider final case
  statement, which converts to integers. Convert all to floats?
  --this works. problem says pretend it's a scientific calculator so I guess
  that's ok?

Bonus feature 3 - fix case statement so it still output correctly if additional
text is added to program

P: case statement is relying on implicit return. if addiitonal text is added,
case wil no longer return to correct operator message

E?
D?
A: add implict return
   and test with additional text at end of case statement

BONUS FEATURE 4 - extract messages into configuration file

P: problem: program has many messages - make easier to manage by housing message text in
    a separate configuration file access by keys

  input: will input config file name (?) and hash key
  output: hash value (message)

  explicit rules: -house messages in config file
                 -file should contain a hash of reference keys and values of
                 message text
                 must fill prompt fields throughout program with hash keys

   implicit rules: -each key should numerically reference message sequentially
                  - will need to learn how to create and reference a config file

E: prompt("Welcome to Calculator! Enter your name:") => prompt(config file,
   hash, hash key)

D: hash for messages and config file for hash

A: (learn how to) create config file
   -create new YAML file from command line: calc_config.yaml
   - within YAML file create hash of keys and values (messages)
   -at top of calc program add "require 'yaml'"
  applying config file:
      -create new hash of prompt references and messages
      -add text of each message to hash
      -remove message from calculator program and replace with reference to config
      -file and hash key

 follow up -- spent a long time on this and got close. Can successfully import
   text from YAML file into calc messgae prompt. Cannot successfully set up
   and reference the hash key to pull in value/message from yaml file. At this
   point checking solution, but got pretty far!
   - string interpolation no longer works with the YAML file
   - read message board post, but not messing with the detail required to add

BONUS FEATURE 5 - internationalize language

P: link config file to translator so program messgae can be displayed in
   different language
   rules: send YAML config file to translators
        call right translation within code
A: checking solution on this one
  - not attempting this bonus -- need to translate message for each prompt

=end
require 'yaml'

MESSAGES = YAML.load_file(".calc_config.yml")

def prompt(message)
  Kernel.puts("=> #{message}")
end

#initial number validation being replaced with method below to allow floats

# def valid_number?(num)
  # num.to_i.to_s == num # bonus feature works! Accepts zero
# end

def number?(num)
  num.to_i.to_s == num || num.to_f.to_s == num
end

def operation_to_message(op)
  word = case op
         when '1'
          'Adding'
         when '2'
          'Subtracting'
         when '3'
          'Multiplying'
         when '4'
          'Dividing'
         end
  puts "Calculating results now..."
  # bonus features 3 works - added code but expicit retrun makes program work
  # unsure about why the test output above doesn't display
  # solved without answer, but this time incorporating solution
  #(save return value into variable and add to end of case)
word
end

prompt(MESSAGES['welcome'])

name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

prompt(MESSAGES["greeting"])

loop do # main loop
  number1 = ''
  loop do
    prompt(MESSAGES["num_1"])
    number1 = Kernel.gets().chomp()

    if number?(number1) # replaced method for bonus feature 2 - floats
      break
    else
      prompt(MESSAGES["num1_error"])
    end
  end

  number2 = ''
   loop do
    prompt(MESSAGES["num_2"])
    number2 = Kernel.gets().chomp()

    if number?(number2) # replaced method for bonus feature 2 - floats
      break
    else
      prompt(Messages["num2_error"])
    end
  end

  # MSG is a delimiter - can be anything but open and close must match
  operator_prompt = <<-MSG
  What operation would you like to perform?
  1) add
  2) subtract
  3) multiply
  4) divide
  MSG
  prompt(operator_prompt)

  operator = ''
  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(MESSAGES["choice_error"])
    end

  end
 # bonus feature works (below)! user is re-directed if they attempt to divide
 # by zero
  if number2 == '0' && operator == '4'
      loop do
        prompt(MESSAGES["zero_div_error"])
        prompt(operator_prompt)
        operator = Kernel.gets().chomp()
        break if operator != '4'
      end
  end

  prompt(MESSAGES["calculating"])

# converting all to floats as a fix for bonus feature 2
# not sure that is the best solution

  result = case operator
           when '1'
             number1.to_f() + number2.to_f()
           when '2'
             number1.to_f() - number2.to_f()
           when '3'
             number1.to_f() * number2.to_f()
           when '4'
             number1.to_f() / number2.to_f()
           end

 prompt(MESSAGES["result"])

  prompt(MESSAGES["repeat"])
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt(MESSAGES["goodbye"])