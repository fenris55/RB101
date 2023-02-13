=begin

write a method that takes 2 strings and concatenates: shorter, longer, shorter

input: 2 strings
output: 1 string

rules
must compare length of 2 strings
concatenate by joining shorter, then longer, then shorter
assume strings are differnt lengths

examples:
short_long_short('abc', 'defgh') == "abcdefghabc"
short_long_short('abcde', 'fgh') == "fghabcdefgh"
short_long_short('', 'xyz') == "xyz"

algorithm:
def method with 2 parameters
compare the length of both string inputs
save and indicate shorter and longer
join shorter, then longer, then shorter together


# works - trying another
def short_long_short(str1, str2)

 if str1.size > str2.size
    "#{str2}#{str1}#{str2}"
  else
    "#{str1}#{str2}#{str1}"
  end
end

def short_long_short(str1, str2)
  if str1.size > str2.size
    str2+str1+str2
  else
    str1+str2+str1
  end
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"


retrying 1/26

write method that takes two string arguments and returns new string with
-arguments concatenated: shirt string, long string, short string

input: 2 strings
output: none
return: 1 string

rules:
-write method
-2 string arguments
-concatenate strings
 - short, long, short
- assume strings are different lengths
-input can be an empty string

data:
comparator
-if/else statement to control output

examples :
short_long_short('abc', 'defgh') == "abcdefghabc"
short_long_short('abcde', 'fgh') == "fghabcdefgh"
short_long_short('', 'xyz') == "xyz"

algorithm:
- find and save lengths of arguments
- compare lengths
- if str1 length is greater
 - concatenate str2, strr1, str2
- if string2 length is greater
 - concatenate str1, str2, str1
=end

def short_long_short(str1, str2)
  if str1.length > str2.length
    str2 + str1 + str2
  else
    str1 + str2 + str1
  end
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"
















