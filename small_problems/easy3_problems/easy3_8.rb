=begin

return true if argument is palindrome
case sensitive

examples
palindrome?('madam') == true
palindrome?('Madam') == false          # (case matters)
palindrome?("madam i'm adam") == false # (all characters matter)
palindrome?('356653') == true


# confused -- challenges is to repeat but for array and then boths strings and array -
this solution already works on both types of input


def palindrome?(input)
  input.reverse == input
end

p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?([3, 5, 6, 6, 5, 3]) == true
p palindrome?([1, 2, 3, 3, 2, 1]) == true
p palindrome?([1, 2, 3, 4, 5]) == false


retrying 1/24

problem:
write a method that checks is string input is a palindrome. case insensitive.

input: string
output: boolean

rules:
-check if string input is palindrome
-case insenstive
-return boolean
-speaces and punctuation still matter - NOPE
-DID NOT READ CAREFULLY - only consider alphanumerics
code:
same as before but downcase input at the start

NOTE: had range format wrong on this, which took a while to solve for -- tried
setting a range as an array and needed below format - review

#Brain is tired -- leaving this for tomorrow
# this works but it's messyyy

def real_palindrome?(string)
  string.downcase!
  alphanumerics = string.chars.select do |el|
   ('a'..'z').include?(el) || ('0'..'9').include?(el)
  end
  p alphanumerics.join
  alphanumerics.join.reverse == alphanumerics.join

end

p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false

# solved again below but feel like it could be shorter
 -- per solution - methods can be chained if nondestructive. Trying below.

def real_palindrome?(string)
  string.downcase!
  string.delete!('^a-z0-9')
  string == string.reverse
end

p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false

=end

def palindrome?(string)
  reverse = []
  string.chars.each do |letter|
    reverse.unshift(letter)
  end
  string == reverse.join
end

def real_palindrome?(string)
  string = string.downcase.delete('^a-z0-9')
  palindrome?(string)
end

p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false











