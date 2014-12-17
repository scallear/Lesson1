def say(msg)
  puts "\n=> #{msg}"
end

def check_num(num)
  num =~ /\d/
end

def check_operator(operator)
  operator =~ /[+\-*\/]/
end

system 'clear'

puts "Welcome to my first Ruby calculator!\nLet's build an expression and solve it."

begin
  begin
    say "What's the first number?"
    num1 =  gets.chomp
  end until check_num(num1)

  begin
    say "What's the second number?"
    num2 =  gets.chomp
  end until check_num(num2)
  
  begin
    say "What's the operator?\nEnter + for addition; - for subtraction; * for multiplication; / for division"
    operator = gets.chomp
  end until check_operator(operator)

  if operator== "+"
    results = num1.to_i + num2.to_i
  elsif operator == "-"
    results = num1.to_i - num2.to_i
  elsif operator == "*"
    results = num1.to_i * num2.to_i
  elsif operator == "/"
    results = num1.to_f / num2.to_f
  end
  
  say "#{num1} #{operator} #{num2} = #{results}"

  puts "Do you have another calculation?(Y/N)"
  answer = gets.chomp.upcase
  
end while answer == 'Y'
