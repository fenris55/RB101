=begin
2/19

problem:
write a method that takes a string and swaps all lower and upper case chars

input: string
output: none
return: new string

rules:
-swap all upper and lower case letters
-leave all other characters alone
-do not use String#swapcase

examples:
swapcase('CamelCase') == 'cAMELcASE'
swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

algorithm:
can set upper and lowercase constants
-iterate
-if current el is included in upper, reassign to lower (downcase)
-if current el is included in lowers, reassign to upper (upcase)
-else, return el
=end

UPPER = ('A'..'Z').to_a
LOWER = ('a'..'z').to_a

def swapcase(string)
  result = string.chars.map do |el|
    if UPPER.include?(el)
      el.downcase
    elsif LOWER.include?(el)
      el.upcase
    else
      el
    end
  end
  result.join
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'