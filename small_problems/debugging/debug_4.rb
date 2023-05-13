=begin
Problem: fix code to behave as expected

Understanding the code:

-the call to `split` is returning the argument as an array: ['how', 'are', 'you' 'doing']
-array is saved to `words`
-empty array is initialized to `saved_words`

-i is initialized to 0 (counter)
-while loop is initialized with the conditional 1 (0) is less than the length of the array (4)
-the reversed_word array (empty) is reassigned to the result of concatenating the
`words array element at index 0 to the reversed words array (adding a string and an array)

Thoughts - I'm seeing 2 problems here
-1 not sure how this is accomplishing the achieved goal
  (or even what is intended with the reassignment)
-2 attemptign to add a string and array throguhs an error.

def reverse_sentence(sentence)
  words = sentence.split(' ')
  reversed_words = []

  i = 0
  while i < words.length
    reversed_words = [words[i]] + reversed_words
    i += 1
  end

  reversed_words.join(' ')
end

p reverse_sentence('how are you doing')
# expected output: 'doing you are how'


#or can use `#unshift`

def reverse_sentence(sentence)
  words = sentence.split(' ')
  reversed_words = []

  i = 0
  while i < words.length
    reversed_words.unshift(words[i])
    i += 1
  end

  reversed_words.join(' ')
end

p reverse_sentence('how are you doing')
# expected output: 'doing you are how'

reviewing 4/3

P:
why does the code raise an error?

the code raises an error because on line 7, the #+ method is being used to
join objects from 2 different classes: words[i] here references a string, and
reveresed_words references an array. This can be fixed by converting word[i] to
an array object by placing it in square brackets: [words[i]] + reversed words

=end














