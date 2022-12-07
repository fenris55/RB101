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

=end
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