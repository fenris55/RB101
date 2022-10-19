require 'yaml'

MESSAGES = YAML.load_file(".mortgage_calc_messages.yml")

def prompt(message)
  puts "=> #{message}"
end

def valid_user_name?(name)
  name.length > 0 && /^[a-zA-Z]*$/.match(name)
end

def valid_loan_amount?(loan_amount)
  loan_amount.to_f > 0 && (/^\d+\.\d\d$/.match(loan_amount) ||
  /^\d+$/.match(loan_amount))
end

# else clause does not allow for input without 0 before . (like '.05')
def valid_apr?(apr)
  if %w(0 0.0 00.00 .0 .00 0.00).include?(apr)
    true
  else
    apr.to_f >= 0 && apr.to_f < 1 && apr.to_f.to_s == apr
  end
end

def valid_years?(years)
  years.to_i.to_s == years && years != "0"
end

def apr_to_monthly(apr) # monthly interest rate
  (apr.to_f / 12)
end

def years_to_months(years) # loan duration in months
  (years.to_f * 12)
end

def calculator(c_loan_amount, c_monthly_interest_rate, c_duration_in_months)
  if c_monthly_interest_rate > 0
    c_loan_amount.to_f * (c_monthly_interest_rate.to_f /
  (1 - (1 + c_monthly_interest_rate.to_f)**(-c_duration_in_months.to_f)))
  else
    c_loan_amount.to_f / c_duration_in_months.to_f
  end
end

prompt(MESSAGES["welcome"])

user_name = ""
loop do
  prompt(MESSAGES["name_prompt"])
  user_name = gets.chomp.strip.capitalize
  if valid_user_name?(user_name)
    system("clear") || system("cls")
    prompt "Hi, #{user_name}! Let's get started!"
    break
  else
    prompt(MESSAGES["name_error"])
  end
end

loop do # main loop
  user_loan_amount = ""
  loop do
    prompt(MESSAGES["loan_amount_prompt"])
    user_loan_amount = gets.chomp
    break if valid_loan_amount?(user_loan_amount)
    prompt(MESSAGES["loan_amount_error"])
  end

  system("clear") || system("cls")

  user_apr = ""
  loop do
    prompt(MESSAGES["apr_prompt"])
    user_apr = gets.chomp
    break if valid_apr?(user_apr)
    prompt(MESSAGES["apr_error1"])
    prompt(MESSAGES["apr_error2"])
  end

  system("clear") || system("cls")

  duration_in_years = ""
  loop do
    prompt(MESSAGES["loan_duration_prompt"])
    duration_in_years = gets.chomp
    break if valid_years?(duration_in_years)
    prompt(MESSAGES["loan_duration_error"])
  end

  system("clear") || system("cls")

  monthly_interest_rate = apr_to_monthly(user_apr)
  duration_in_months = years_to_months(duration_in_years)
  result = calculator(user_loan_amount, monthly_interest_rate,
                      duration_in_months)

  monthly_payment = result.round(2)
  prompt "You chose a $#{user_loan_amount} loan with #{user_apr} APR
          and a duration of #{duration_in_years} years."
  prompt "Your monthly payment will be: $#{monthly_payment}."

  answer = ""
  loop do
    prompt(MESSAGES["repeat_question"])
    answer = gets.chomp.downcase
    if %w(n no y yes).include?(answer)
      break
    else
      prompt(MESSAGES["repeat_error"])
    end
  end

  break if %w(n no).include?(answer)
end

system("clear") || system("cls")
prompt "Goodbye, #{user_name}!"
prompt(MESSAGES["goodbye"])
