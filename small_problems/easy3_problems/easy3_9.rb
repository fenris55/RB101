=begin

-return true if palindrome, false if not
-case insensitive
-ignore non alphanumeric characters

examples:
real_palindrome?('Madam') == true           # (case does not matter)
real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
real_palindrome?('356653') == true


#one of the few I've had to check solution for
-needed to see how to set the argument for #delete

def palindrome?(input)
  input.reverse == input
end

def real_palindrome?(input)
  input = input.downcase.delete('^a-z0-9')
  palindrome?(input)
end

p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true


retrying 1/26

problem:
write a method that returns true if integer argument is palindromic

input: integer
return: boolean
output: none

rules:
- return boolean
- ID wether integer is palindrome
 - single digits return true
 - assume valid input?

edge cases:
-if integer format begins with 0, alg will not work

data: comparator

examples:
palindromic_number?(34543) == true
palindromic_number?(123210) == false
palindromic_number?(22) == true
palindromic_number?(5) == true

algorithm:
- convert integer to string
-compare string to reversed string

-return boolean

=end

def palindromic_number?(integer)
  string_number = integer.to_s
  string_number == string_number.reverse
end

p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true














