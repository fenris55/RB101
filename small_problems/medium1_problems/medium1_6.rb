=begin

P:
write a mini stack and register program (method) that takes an unknonw number of
string arguments execute them from within the main method

input: string
output: can be an integer -- register value is 'PRINT' argument is entered (only possible)
return: ?? if nothing is printed, return will be lasted evaluate expression within
        the method -- either the register number (integer) or stack (array of integers)

rules:
-write the mult method to simulate a stack and register language
-method will take a string argument
  -string will only contain string numbers and commands accepted by the program
  -assume all input is valid
-the main method will contain:
  -local variable register (integer)
  -local variable stack (aray of integers)
  -9 helper methods to handle each of the language's commands (assumption)
-all operations will be integer operations
  -(consider the impact of DIV and MOD)
-numbers will enter method as string and need to be converted to integers
-need to separate input string at the spaces so that:
  -a.integers nd commands canbe separated and
  -b. commands can be identified and executed in correct order (using the intgers in the string)
-initialize register to zero
-initialze stack to an empty array (assumption)

E:
minilang('PRINT')
# 0

minilang('5 PUSH 3 MULT PRINT')
# 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

minilang('5 PUSH POP PRINT')
# 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

minilang('-3 PUSH 5 SUB PRINT')
# 8

minilang('6 PUSH')
# (nothing printed; no PRINT commands)

D:
main method
-handle input string
-array to hold words in the input string
-iterative structure to loop over the input string array
-case statement to control flow based on the input commands (within iteration?)
-9 helper methods (one for each language command)

A:
-create the 9 helper method
  -each should perform one of the given calculations
-define main method
-initialize register to 0
-initialize stack to empty array
-convert input string to an array split at the spaces
-iterate over input string array perofring transformation
  -if current lement is included in a range of string integers from 0-9
    -convert to intger
  (returned array (formatted_array) now hold commands and integer numbers)
-iterate over formatted_array
  -try initializing a case statement within the block
  -on each iteratation,
    -if command is a number, call method that reassigns the number to the register
    -for all other commands, execute the correct helper method

=end

def reassign_register!(register, n)
  register = n #in main method, reasign register to this return value
end

def push(register, stack)
  stack.push(register)
end

def add(register, stack)
  stack_value = stack.pop
  register += stack_value
end

def subt(register, stack)
  stack_value = stack.pop
  register -= stack_value
end

def mult(register, stack)
  stack_value = stack.pop
  register *= stack_value
end

def div(register, stack)
  stack_value = stack.pop
  register /= stack_value
end

def mod(register, stack)
  stack_value = stack.pop
  register = register % stack_value
end

def pop(register, stack)
  register = stack.pop
end

def print_register(register)
  puts register
end

#handling helper method return values:
#print - do nothing
#push - do nothing - stack in main method scope should be mutated
#all other helper method - reassign register

#thoguhts for additional refactoring:
# - could use helper to perform 1st iteration for integers
# - could place entire case statement into helper and excute help from within block
COMMANDS = %w(PUSH ADD SUB MULT DIV MOD POP PRINT)

def minilang(command_string)
  register = 0
  stack = []

  commands_and_integers = command_string.split.map do |cmd|
    cmd.to_i.to_s == cmd ? cmd.to_i : cmd #validation won't work with leading 0s
  end

  commands_and_integers.each do |cmd|

    case
   # when stack.empty?   then puts "Error - stack is empty"
    when cmd == 'PUSH'  then push(register, stack)
    when cmd == 'ADD'   then register = add(register, stack)
    when cmd == 'SUB'   then register = subt(register, stack)
    when cmd == 'MULT'  then register = mult(register, stack)
    when cmd == 'DIV'   then register = div(register, stack)
    when cmd == 'MOD'   then register = mod(register, stack)
    when cmd == 'POP'   then register = pop(register, stack)
    when cmd == 'PRINT' then print_register(register)
    when cmd.to_s.to_i == cmd then register = reassign_register!(register, cmd)
    end
  end
end

#further exploration:
#minilang('SUB')
#minilang('3 PUSH 5 MOD PUSH 7 PUSH 3 PUSH 4 PUSH 5 MULT ADD SUB DIV PRINT')
#minilang('PRINT')
# 0
#minilang('5 PUSH 3 MULT PRINT')
# 15
minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8
#minilang('5 PUSH POP PRINT')
# 5
#minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7
#minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6
#minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12
#minilang('-3 PUSH 5 SUB PRINT')
# 8
#minilang('6 PUSH')
# (nothing printed; no PRINT commands)