=begin

write method that returns true if integer arg is palindromic, false if not

#played with the challenge here a lot (input starting with 0s)
# learned that .to_s can take an argument to convert to correct string, ubt loses leading 0s

def palindromic_number?(num)
 p num.to_s(8).reverse
  #num.coerce(1).join.delete_prefix('1').reverse.to_i #== num
end



p palindromic_number?(0034543) #== true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true

retrying 1/26

problem:
write a method that takes a string argument and returns true only if all letters
are uppercase; ignore characters that are not letters

input: string
return: boolean
output: none

rules:
- write method
- takes 1 string argument
- ignore (remove) all non-letter characters (exept spaces): numbers, punctuation
- spaces should return true
- check whether all letters are uppercase (range)
- return boolean

data:
-iterative structure to remove non-letter characters
- array of chars (returned by above)
- range of capital letters to compare input letters against

examples:
uppercase?('t') == false
uppercase?('T') == true
uppercase?('Four Score') == false
uppercase?('FOUR SCORE') == true
uppercase?('4SCORE!') == true
uppercase?('') == true

algorithm:
-if input is empty, return true (#strip, #empty?)
-convert input string to an array (#chars)
- perform selection (#select)
  - only select elements == A..Z or a..z
- iterate over returned array (#map)
  -  check whether each element is included in range A..Z
  - if all iteration (returned array contents) return true
    - return true
  -else, return false


Notes:
-mostly easy, had a little trouble at the end
- tried taking the boolean array returned by map, calleding #uniq to remove
  repeated booleans, returning to string and comparing to true
  (capital_array.uniq.join == true)
-AHA! writting this made me realize -- i was comparing a string and a boolean
- solved using #all?
- could have fixed but converting boolean to string
=end

def uppercase?(string)
 return true if string.strip.empty?

 string_array = string.chars
 selected_letters = string_array.select do |el|
  ('A'..'Z').include?(el) || ('a'..'z').include?(el)
 end

 capital_array = selected_letters.map do |letter|
  ('A'..'Z').include?(letter)
 end

  #capital_array.uniq.join == true.to_s # fix initial attempt
  capital_array.all? {|boolean| boolean == true} # 2nd attempt seems much cleaner
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true

#OMFG i feel so dumb
# - initial thought was to comare string to upcase string but thought other
# - characters would throw off the result
# APPARENTLY NOT -- should have tested what happens










