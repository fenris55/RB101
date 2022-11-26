=begin

P:
  write a method that takes a string and an integer and prints the string as
  many times as specific by the integer

  input: string, integer
  output: strings

explicit rules: use a method def to achieve results
                method must have two parameters (string and int)
                must print string int number of time

implicit rules: must print output from within the method

edge cases: what if other objects are input
            what is int is zero or negative

E:
input: ('hello', 3) => output: hello \n hello \n hello \n

Data: no need to save data; perform printing iteration int number of times

A:

define method with two parameters
perform a looping action that outputs the first string argument
stop output when count has reached amount specified by second argument (int)

=end

#first completing using loop
=begin
def repeat(string, int)
  counter = 0
  loop do
    puts string
    counter += 1
    break if counter == int
  end
end

repeat("hello", 3)
=end

#completing again with Integer#times method

def repeat(string, int)
  int.times { puts string } #re-explore using a block parameter here
end

repeat('howdy', 5)