=begin
2/19

problem:
write a method that takes a string and returns a hash with counts for uppercase,
lowercase, and other characters

input: string
output: none
return: hash

rules:
-string can have one or multiple words
-string can be empty (all counts 0)
-hash keys should use order: uppercase; lowercase; neither
- counts should be added as hash values
-an empy string returns zero BUT space count as "neither"

examples:
letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

data:
constants for A..Z and a..z
initialize hash with values at 0
iterative structure to count values and add to hash

algorithm:
-initialize hash with the three given keys and values at 0
-iterate over string
  - since object returned is hash, can use (#each) -- maybe also each_with_object?
-initialize control flow within block:
  -if char is included in A..Z
    - increment corresponding hash value by one
  - elsif char is included in a..z, same
  - else increment neither by 1

thoughts:
maybe this needs more complexity. Before we can check for upper/lower case, need
to check that it's a letters -- otherwise an error will be throguh and execution
will end. ok. using arrays of letter. use constants?

LOWERCASE = ('a'..'z').to_a
UPPERCASE = ('A'..'Z').to_a

def letter_case_count(string)
  result = { lowercase: 0, uppercase: 0, neither: 0 }
  string = string.chars

  string.each do |el|
    if LOWERCASE.include?(el)
      result[:lowercase] += 1
    elsif UPPERCASE.include?(el)
      result[:uppercase] += 1
    else
      result[:neither] += 1
    end
  end

  result
end

# easy, and lesson solution is identical. Second lesson soltuon using regex is below.

=end

def letter_case_count(string)
  counts = {}
  chars = string.chars

  counts[:lowercase] = chars.count { |el| el =~ /[a-z]/ }
  counts[:uppercase] = chars.count { |el| el =~ /[A-Z]/ }
  counts[:neither] = chars.count { |el| el =~ /[^A-Za-z]/ }
  counts
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
