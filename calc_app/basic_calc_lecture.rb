def say(msg)
  puts "=> #{msg}"
end

begin
  say "What's the first number?"
  num1 =  gets.chomp

  say "What's the second number?"
  num2 =  gets.chomp
  
  say "Enter + for addition; - for subtraction; * for multiplication; / for division"
  operator = gets.chomp
  
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
  answer = gets.chomp
  
end while answer == 'Y'
