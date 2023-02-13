=begin
1/28

problem:
write method that takes time in minute-based format and return the time in 24
hour format

input: positive or negative integer
output: string (24-hour time format - hh:mm)

rules:
-method takes time in minute format
  - 1440 minutes in 24-hour period
-positive indicates minutes after midnight
-negative indicates minutes before midnight
-convert minutes to times in 24 hour format
- do not use Date or Time classes
- ignore DSL, time zones etc

data:

examples:
time_of_day(0) == "00:00"
time_of_day(-3) == "23:57"
time_of_day(35) == "00:35"
time_of_day(-1437) == "00:03"
time_of_day(3000) == "02:00"
time_of_day(800) == "13:20"
time_of_day(-4231) == "01:29"

thoughts:
midnight = 00:00 = 1400
00:01 = 1 OR -1439
23:59 = 1439 OR -1

retrying 2/6

write a method that takes a time in minutes (positive is minutes after
midnight, negative is minutes until midnight ) and returns time in hh:mm format

input: positive or negative integer (representing minutes before or after midnight)
output: none
return: string (numbers in military time format hh:mm)

rules:
-disregard DSL, time zones, etc
-do not rules Time or Date classes
-positive input is minutes after midnight
-1440 minutes in a 24 hour period
  BUT input can be any integer, ie 3000 == "02:00"
- i think that means if int.abs is >= 1440, divide by 1400?? ORr not. idk.
-suggests trying #divmod, %, and #format

-suggestions first solving for positive input between 0 and 1439
  -then deal with integers greater than 1439 (subtract)?
  -then solve for negative (reverse)

examples:
time_of_day(0) == "00:00"
time_of_day(-3) == "23:57"
time_of_day(35) == "00:35"
time_of_day(-1437) == "00:03"
time_of_day(3000) == "02:00"
time_of_day(800) == "13:20"
time_of_day(-4231) == "01:29"

data:
-control flow for positive, negative, over or under 1439
-empty string/array to hold result -- don't forget colon
-something to associate int to time -- thinking this is what the math/divmod is for


algorithm for positive 0-1439
-assuming input integer is a positive number between 0-1439

ok nope. no idea. copying solution below this sad small attempt

def time_of_day(int)
  if int <= 9
    "00:0#{int}"
  elsif int <= 99
    "00:#{int}"
  elsif int <= 999

  end
end


p time_of_day(0) == "00:00"
p time_of_day(35) == "00:35"
# time_of_day(800) == "13:20"

=end

MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR #1440

# first normal input so only calulcating with ints 0-1439

def normalize_minutes_to_0_through_1439(minutes)
  while minutes < 0         # making input positive
    minutes += MINUTES_PER_DAY
  end
  minutes % MINUTES_PER_DAY # reducing for numbers >= 1440
end

def time_of_day(delta_minutes)
  delta_minutes = normalize_minutes_to_0_through_1439(delta_minutes)
  hours, minutes = delta_minutes.divmod(MINUTES_PER_HOUR)
  format('%02d:%02d', hours, minutes)
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"