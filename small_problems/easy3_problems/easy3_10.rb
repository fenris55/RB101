=begin

write method that returns true if integer arg is palindromic, false if not

=end

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