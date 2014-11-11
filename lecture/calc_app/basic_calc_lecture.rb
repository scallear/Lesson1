def say(msg)
  puts "=> #{msg}"
end

say "What's the first number?"
num1 =  gets.chomp

say "What's the second number?"
num2 =  gets.chomp

say "Input 1 for 'addition'; 2 for 'subtraction'; 3 for 'multiplication'; 4 for 'division'"
operator = gets.chomp

if operator.to_i == 1
  results = num1.to_i + num2.to_i
elsif operator.to_i == 2
  results = num1.to_i - num2.to_i
elsif operator.to_i == 3
  results = num1.to_i * num2.to_i
elsif operator.to_i == 4
  results = num1.to_f / num2.to_f
end

if operator.to_i == 1
  operator_val = "+"
elsif operator.to_i == 2
  operator_val = "-"
elsif operator.to_i == 3
  operator_val = "*"
elsif operator.to_i == 4
  operator_val = "/"
end

say "#{num1} #{operator_val} #{num2} = #{results}"

