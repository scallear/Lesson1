def say(msg)
  puts "\n=> #{msg}"
end

def check_number(number)
  number =~ /\d/
end

def check_operator(operator)
  operator =~ /[+\-*\/]/
end
number
system 'clear'

puts "Welcome to my first Ruby calculator!\nLet's build an expression and solve it."

begin
  begin
    say "What's the first number?"
    number1 =  gets.chomp
  end until check_number(number1)

  begin
    say "What's the second number?"
    number2 =  gets.chomp
  end until check_number(number2)
  
  begin
    say "What's the operator?\nEnter + for addition; - for subtraction; * for multiplication; / for division"
    operator = gets.chomp
  end until check_operator(operator)

  if operator == "+"
    results = number1.to_i + number2.to_i
  elsif operator == "-"
    results = number1.to_i - number2.to_i
  elsif operator == "*"
    results = number1.to_i * number2.to_i
  elsif operator == "/"
    results = number1.to_f / number2.to_f
  end
  
  say "#{number1} #{operator} #{number2} = #{results}"

  puts "Do you have another calculation?(Y/N)"
  answer = gets.chomp.upcase
  
end while answer == 'Y'
