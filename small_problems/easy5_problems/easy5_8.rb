=begin
2/9

problem:
write a method that takes an array of integers between 0 and 19 and returns the
array sorted alphabetically according to the english letter name

input: array (of integers)
output: none
return: array (of integers)

rules:
- unclear - return new array or original array sorted?
- sort input array according to alphabetical value of English word for number

data:
-hash for holding integer-letter word associations

thoughts:
-could populate new hash with key-value associations, sort by value, and then
return array of keys -- not first thought but maybe easiest
-could also iterate over input array, access hash key within block, attempt
to sort according to value?? - i think this would work but much hazier on how to
execute

examples:
alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

# it works! but seems ridiculously long. The first half of the code is essentially
replicating the numbers constant. trying to shorten below.

NUMBERS = {
  0 => 'zero', 1 => 'one', 2 => 'two', 3 => 'three', 4 => 'four', 5 => 'five',
  6 => 'six', 7 => 'seven', 8 => 'eight', 9 => 'nine', 10 => 'ten',
  11 => 'eleven', 12 => 'twelve', 13 => 'thirteen', 14 => 'fourteen',
  15 => 'fifteen', 16 => 'sixteen', 17 => 'seventeen', 18 => 'eighteen',
  19 => 'nineteen'
  }


def alphabetic_number_sort(array)
  new_hash = array.each_with_object({}) do |num, object|
    object[num] = NUMBERS[num]
  end

  sorted_subarrays = new_hash.sort_by { |_, value| value }

  sorted_subarrays.map { |sub_arr| sub_arr[0] }
end

#ok, eliminated the first chunk of code and nondestrucively sorted the constant
feel like there's a shorten way to do this with <=>

NUMBERS = {
  0 => 'zero', 1 => 'one', 2 => 'two', 3 => 'three', 4 => 'four', 5 => 'five',
  6 => 'six', 7 => 'seven', 8 => 'eight', 9 => 'nine', 10 => 'ten',
  11 => 'eleven', 12 => 'twelve', 13 => 'thirteen', 14 => 'fourteen',
  15 => 'fifteen', 16 => 'sixteen', 17 => 'seventeen', 18 => 'eighteen',
  19 => 'nineteen'
  }


def alphabetic_number_sort(array)
  sorted_nums = NUMBERS.sort_by { |_, value| value }

  sorted_nums.map { |sub_arr| sub_arr[0] }
end

UGH seen this before. when hash key-values are numeric pairs starting at 0,
TAKE ADVANTAGE of index reference using an array!


#lesson solution - KNEW it could be shortened to 1 line
# challenge - rewrite using #sort instead
-- challenge was easy!

NUMBERS = %w( zero one two three four five six seven eight nine ten eleven
              twelve thirteen fourteen fifteen sixteen seventeen eighteen
              nineteen)

def alphabetic_number_sort(array)
  array.sort_by { |num| NUMBERS[num] }
end

=end

NUMBERS = %w( zero one two three four five six seven eight nine ten eleven
              twelve thirteen fourteen fifteen sixteen seventeen eighteen
              nineteen)

def alphabetic_number_sort(array)
  array.sort { |num1, num2| NUMBERS[num1] <=> NUMBERS[num2] }
end

p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

