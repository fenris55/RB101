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

=end

def palindrome?(input)
  input.reverse == input
end

p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?([3, 5, 6, 6, 5, 3]) == true
p palindrome?([1, 2, 3, 3, 2, 1]) == true
p palindrome?([1, 2, 3, 4, 5]) == false