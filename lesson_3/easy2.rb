=begin

Question 1

see if 'spot' is in the given hash

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
p ages.key?('Spot')

#name 2 other methods that would also work
p ages['Spot'] #setter method, returns nil
p ages.keys #returns array of keys, spot nto included

#the above do serve as ways to find the answer to the questions, but the
#methods suggested are:

p ages.include?('Spot')
p ages.member?('Spot')

Question 2

reproduce the 4 example strings using destructive methods

munsters_description = "The Munsters are creepy in a good way."

# 1. munsters_description.swapcase!
# 2. munsters_description.capitalize!
# 3. munsters_description.downcase!
# 4. munsters_description.upcase!
p munsters_description

Question 3

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }

ages.merge!(additional_ages)

p ages

Question 4

see if name 'Dino' appears in string

advice = "Few things in life are as important as house training your pet dinosaur."

p advice.include?('Dino')
# solution uses:
p advice.match?('Dino')

Question 5

find easy way to rewrite

flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
p flintstone = %w(Fred Barney Wilma Betty BamBam Pebbles)

Question 6

add 'Dino'

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones << 'Dino'
p flintstones

Question 7
add 'Dino and 'Happy'

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.push("Dino", "Happy")

# or solution shows:
flintstones.concat(%w(Dino Happy))
p flintstones

Question 8

advice = "Few things in life are as important as house training your pet dinosaur."

#p advice.slice!(0...39)
p advice.slice!(0, advice.index('house'))
#lesson uses:
p advice

Question 9

write one-liner counting lower case 't's

statement = "The Flintstones Rock!"
p statement.count('t')

Question 10

how would you center sentence in a table 40 spaces wide
tried using .rjust & /ljust but couldn't get it right..answer uses .center
=end

title = "Flintstone Family Members"
p title.center(40)
