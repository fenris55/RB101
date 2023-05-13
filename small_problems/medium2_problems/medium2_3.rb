=begin
4/2

P:
write a method that takes a string and returns a hash with lowercase, upcase, and
other chars as keys and pertcentage of occurences as values

input: string
return: hash (with keys lowercase, uppercase, neither and percentages as values )

rules:
-count the occurance of upper, lower, and other character
-find percentage of count
-place in hash
-input string will always have at least one character
-percentage values should be formatted to have one decimal place (no percent sign)

E:
letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }

D:
-array of lowercase letters
-array of uppercase letters
-iterative structure to loop over string
control flow structure to check current el
-hash with the three given keys and default values of 0.0

A:
-initialize lower_case letter array
-initialize upper_case letter array
-iterative over input string (#each_char)
  -if lowercase array includes el
    increment hash[lowercase] by 1
  -elsif uppercase array include el
    -increment hash[uppercase] by 1
  -else
    -increment hash neither by 1
-iterate over hash values
  -divide length of input string converted to a float by the hash value/count
  -replace current hash count with returned percentage formatted to 1 decimal place
=end

LOWERCASE = ('a'..'z').to_a
UPPERCASE = ('A'..'Z').to_a

def letter_percentages(string)
  result_hash = { lowercase: 0.0, uppercase: 0.0, neither: 0.0 }

  string.each_char do |el|
    if LOWERCASE.include?(el)
     result_hash[:lowercase] += 1
    elsif UPPERCASE.include?(el)
      result_hash[:uppercase] += 1
    else
      result_hash[:neither] += 1
    end
  end

  result_hash.keys.each do |key|
    result_hash[key] = ((result_hash[key] / string.size.to_f) * 100).round(1)
  end
  result_hash
end

p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
p letter_percentages('abcdefGHI')
