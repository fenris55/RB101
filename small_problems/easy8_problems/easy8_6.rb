=begin
2/23

problem: write a method that takes a string and returns a new string with every
character doubled

=end

def repeater(string)
string.chars.map { |el| el *= 2}.join
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''