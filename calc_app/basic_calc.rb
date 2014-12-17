require 'pry'

def say(msg)
  puts "\n=> #{msg}"
end

def check_num(num)
  num =~ /\d/
end

def check_operand(operand)
  operand =~ /[+\-*\/]/
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
    say "Enter + for addition; - for subtraction; * for multiplication; / for division"
    operator = gets.chomp
  end until check_operand(operator)

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
