=begin
2/12

problem:
ID whether the given method will create a copy or return the original string

answer: will return new string. Non-destructive #split creates a copy/array,
and then #join creates a copy of that copy. #reverse is only mutating each letter
with the array



def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

spin_me("hello world") # "olleh dlrow"

=end