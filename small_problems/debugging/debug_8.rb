=begin
4/3


-currently, the password in being initialized to nil in the main program scope.
-when the user input is captured in the set_password method, it is initialized
to the method local variable password, which does not impact the passowrd in the
program's main scope.

-this can be fixed by reassign the local variable password to refernece the
return value of the set_password method. This should happen in the if statement
!password is forceing the nil password value to evaluate to true (while a valid
passowrd would here evaluate to true, be coerce to false, and the if clause
would not execute)

after this scoping issue is fixed, passowrd needs to be passed as an argument
to the verify_password method so that it can be compared to user input after
the login prompt.


=end

password = nil

def set_password
  puts 'What would you like your password to be?'
  password = gets.chomp
end

def verify_password(password)
  puts '** Login **'
  print 'Password: '
  input = gets.chomp

  if input == password
    puts 'Welcome to the inside!'
  else
    puts 'Authentication failed.'
  end
end

if !password
  password = set_password
end

verify_password(password)