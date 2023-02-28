=begin
2/26

problem:
write a method that takes the given array and outputs arrays grouping the words
that are anagrams

input: array
output: arrays
return -- unclear. nil?

rules:
-take the given array and find the anagrams
-output each group of anagrams as an array on its own line

examples: see below

data:
-subarrays to hold each word
-iterative structure to compare letters in each word

algorithm
-iterate over input array, placing each word in an array
-iterate over new subarray, converting each subarray to an array of sorted letters
-iterate again
  -initialize hash
  -if no existing key, save subarry of letters as hash key and 1 word as value

#OK jumped in with no alg, made a mess. Leaving off for tonight. Try fresh tomorrow.

def anagram_finder(word_list)
  word_subarrays = word_list.map {|word| [word]}
  letters = word_subarrays.map { |word| word.chars.sort }

  result = letters.each_with_object({}) do |el, hash|
    if hash.key?(el)
      hash[el] += word_subarrays[el.index]
    else
      hash[el] = word_subarrays[el.index]
    end
end

puts result.keys
end

2/27
OK not even loking at yesterday

problem: write a 'program' that takes an array and prints news arrays holding
the original array elements grouped as anagrams

input: array
return: unclear - nil?
output: arrays of anagrams, each its own line

rules:
-says write a program -- doesn't specify a method
-program takes one array of strings as input
-program should sort array elements into new arrays
-each new array should contain all original array elements that are anagrams
-program must output each array on its own line
-assume valid input

thoughts:
-could create array of chars, sort, and add to hash as key
-could iterate throguh original array
  -take current element, turn to chars and sort
  -use this to reference the hash key
  -add current el to hash value array
-iterate over hash, printing each value

#SUCCESS! took like 5 minutes was tired yesterday, but had the right idea.
Feel like the first 2 iterations could be combined.

def anagram_finder(word_list)
  hash = {}

  word_list.each do |string|
    next if hash.keys.include?(string.chars.sort)
    hash[string.chars.sort] = []
    end

  word_list.each do |string|
    hash[string.chars.sort] << string
  end

  hash.each_value { |array| p array }
end

YES - lesson solution takes same approach, but combines those two iterations
above into one. Also, write 'program', not a method. See below:
=end

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

result = {}

words.each do |word|
  key = word.split('').sort.join #here keys are strings
  if result.has_key?(key)
    result[key].push(word)
  else
    result[key] = [word]
  end
end

result.each_value do |v| # weird, this does not output arrays like in example
  puts '-------------'
  puts v
end

#["demo", "dome", "mode"]
#["neon", "none"]
#(etc)