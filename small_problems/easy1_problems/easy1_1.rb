# Easy 1 - 1

#initially this attempt didn't work - didn't need a block paramter 
#bc this is an integer method, not a block?

def repeat(string, integer)
  integer.times do 
    puts string
  end
end
  
repeat("Howdy", 5)


#2nd attempt works
=begin
def repeat(string ="Hi!", integer = 3)
  while integer > 0
    puts string
    integer -= 1
  end
end

#repeat("Howdy", 5)
#repeat('Hello', 3)
repeat(7)
repeat("How are you?")
#tried adding default parameters - the default integer works but
#the default string does not - instead it uses the integer as the string input
=end