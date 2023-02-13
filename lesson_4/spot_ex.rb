=begin

problem 1

7 kyu

Return substring instance count

Complete the solution so that it returns the number of times the search_text is found within the full_text.

Usage example:

solution('aa_bb_cc_dd_bb_e', 'bb') # should return 2 since bb shows up twice
solution('aaabbbcccc', 'bbb') # should return 1

P: Write a method which takes a string(str) as an argument and counts the number of times the substring(sub_str) appears in the str and return that count as an integer.

E: 

solution('abcdeb','b') == 2 => we search through str and find 'b' twice.
solution('abcdeb', 'a') == 1 => 'a' is found once
solution('abbc', 'bb') == 1 => 1 is output because we find one instance of'bb'

D: 
Input: string - split into an array of chars
Output: Integer

array
split

A: 

- save length of sub_str in a local variable (length) (2)
- initialize a match_counter as 0 (match_counter) (0)
- initialize 2 idx counters (idx1 = 0, idx2 = (length - 1)
- Take the input_string, split it into individual characters. (chars_arrray) ['a', 'b', 'b', c']
- iterate through chars_array, looking at chunks of str of the same length as sub_str.
- examine each subset of chars_array from idx1 to idx2 and compare it to sub_str to see if they MatchData
  - if they match, increase match_counter by 1
- return 'match counter if idx2 exceeds char_array length'

C: 
=end

def solution(word, substring)
  substring_length = substring.size
  match_counter = 0
  idx1 = 0
  idx2 = substring_length - 1
  chars_array = word.chars
  loop do
    chunk = chars_array[idx1..idx2].join
    match_counter += 1 if chunk == substring
    idx1 += 1 
    idx2 += 1
    break if idx2 > chars_array.size
  end
  match_counter
end

p solution('abcdeb','b') == 2
p solution('abcdeb', 'a') == 1
p solution('abbc', 'bb') == 1
