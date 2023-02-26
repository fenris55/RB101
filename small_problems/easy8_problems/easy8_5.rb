=begin
2/23

problem: write a method that takes 2 integer arguments and prints out all numbers
between the 2: if num is divisible by 3 sub "Fizz". by 5 sub "Buzz", by both
sub FizzBuzz

input: 2 integers
output: unclear - string? output is single line comma separated with int and strings
return: also unclear: nil?

rules:
-1st arg is starting number. 2nd arg is ending number
-print out all numbers between starting and ending
-if num % 3 == 0 print Fizz
-if num % 5 == 0 print Buzz
-if num % 5 == 0 && num % 3 == 0 print FizzBuzz

Questions:
-unsure of output format
unsure of return value
-guessing i should assume first number is smaller than second

data:
range from arg1 to arg2
iterative structure
control flow

examples:
fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz

algorithm:
-set range from arg1 to arg2
-start with most complex (Fizzbuzz)
-then fizz
then buzz
then num

#solved: had to check for correct output form (save to array and then join)
def fizzbuzz(int1, int2)
  result = []
  int1.upto(int2) do |num|
    if num % 3 ==0 && num % 5 == 0
      result << "FizzBuzz"
    elsif num % 3 == 0
      result << "Fizz"
    elsif num % 5 == 0
      result << "Buzz"
    else
      result << num
    end
  end
  p result.join(" ") # heree we go
end

#lesson solution below:
=end

def fizzbuzz(starting_number, ending_number)
  result = []
  starting_number.upto(ending_number) do |number|
    result << fizzbuzz_value(number)
  end

  puts result.join(' ')
end

def fizzbuzz_value(number)
  case
  when number % 3==0 && number % 5 == 0
    'FizzBuzz'
  when number % 3 == 0
    'Fizz'
  when number % 5 == 0
    'Buzz'
  else
    number
  end
end

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz