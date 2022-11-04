=begin
Lesson 3, Medium 1

Question 1
words = 'The Flintstones Rock!'

#okay below works but didn't read the instructions closely (tired)..need to do 10.
solution uses a block, trying that out instead
puts words.rjust(22)
puts words.rjust(23)
puts words.rjust(24)

10.times { |number| puts " " * number + 'The Flintstones Rock!' }
#don't think I would have gotten that

Question 2
-why is it and error and show 2 ways to fix

i think - ruby thinks we're trying to add a string and an integer?
solve by wrapping the entire argument in parentheses or claling -to_s on the integer or with string interpolation?
--no parentheses needed

puts "the value of 40 + 2 is " + (40 + 2).to_s
puts "the value of 40 + 2 is #{40 + 2}"

Question 3

change the loop to not use begin/until/end

my solution is below -- it works, but breaks the advice given in the methods chapter
to not allow a method to but output and return; however, it does one or the lther, not both

lesson solution instead uses sa while loop - net yet sure how that solution the issue
of handling 0 and negatives

def factors(number)
  divisor = number
  factors = []

  loop do
    if number <= 0
      puts 'Not a valid entry'
      break
    else
    factors << number / divisor if number % divisor == 0
    divisor -= 1
    break if divisor == 0
    end
  factors
  end
end

p factors(0)
# p factors(15)

def factors(number)
  divisor = number
  factors = []
  while divisor > 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end

p factors(-9)

Question 8

first returns paper, then paper again, then finally paper

Question 9

will return no - foo method is passed in as an argument, returning 'yes', which
makes the ternary operator in the second method return 'no'

=end
