=begin
2/26

problem:
write a method tat takes 3 integers, calculates the mean, and returns the
corresponding letter grade as a string

input: 3 integers
output: none
return: string

rules:
-assume integer inputs are between 0 and 100
-always 3 integers input
-find mean
-return string letter grade corresponding to mean

examples:
get_grade(95, 90, 93) == "A"
get_grade(50, 50, 95) == "D"

data:
-structure to associate letters with grades (case statement)

algorithm
-add together the 3 input integers and divid by 3 to find average
-initialize a case statement for average
-set up structure to return correct letter string, starting with lowest score

def get_grade(grade1, grade2, grade3)
  mean = (grade1 + grade2 + grade3) / 3

  case
  when mean < 60 then 'F'
  when mean < 70 then 'D'
  when mean < 80 then 'C'
  when mean < 90 then 'B'
  when mean <= 100 then 'A'
  end
end

#Lesson solution is the same, but uses range instead:
=end

def get_grade(s1, s2, s3)
  result = (s1 + s2 + s3) / 3

  case result

  when 90..100 then 'A'
  when 80..89  then 'B'
  when 70..79  then 'C'
  when 60..69  then 'D'
  when 0..59   then 'F'
  else              'A+' # CHallenge: account for extra credit grades over 100
  end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"