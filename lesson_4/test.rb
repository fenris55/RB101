require 'pry'

=begin
def vowel_check(string)
  vowel_subtr_length = 0
  counter = 0
    loop do
      if %w(a e i o u).include?(string[counter])
        string[counter += 1]
        break if %w(a e i o u) != string[counter +=1]
        vowel_subtr_length << counter -= 1
      else
        counter += 1
        break if counter == string.length
      end
    end
 end

p vowel_check('fearful')

=end
=begin

p: write a method that take a string and return the length of the longest
substring of vowels

  input: string
  output: integer

  explicit rule: argument must be a string
                 method must identify vowels in the word as
                 --- use an array?

  implicit rules:

e: 'fearful' - 2
  'lemonade' - 1

d: array?

a: split string into array of strings
  iterate throough array
  save first variable (as iterator?)
  save array of vowel as variable
  if first item is not included in vowel array
  assign next as saved index
  if element is included in vowel array
  save vowel length as 1
  if next item is also included in vowel array
  increment vowel length
  continue throguh array, incremental length of vowels if a new greatest lengh is reached

=end

def vowel_string_counter(string)
  index_counter = 0
  vowel_counter = 0
  vowels = %w(a e i o u)

 string = string.split(//)

 loop do
  if vowels.include?(string[index_counter])
    vowel_counter += 1
  end

  index_counter += 1
  break if index_counter == string.size

  vowel_counter
  end
end

p vowel_string_counter('towel')
