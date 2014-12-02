#1. Come up with requirements to determine the scope
#2. Application Logic/flow
#3. Translation of steps into code
#4. Run to verify

#Game Sudo code (step 2)

#Draw a board

#choose who's x and who's o

#loop until winner/ no free spaces
	#Player1 picks an empty square
#	check win
	#Player2 picks an empty square
#	check win
#end

#if there is a winner
#	create winning message
#elsif tie 
#	display cat message
require 'pry'

#Methods-------------------------------------------------------------

def initialize_spaces
	spaces = {}
	(1...10).each{|position| spaces[position] = position}
	spaces
end

def draw_board(s)
	system 'clear'
	puts " #{s[1]} | #{s[2]} | #{s[3]} "
	puts "---+---+---"
	puts " #{s[4]} | #{s[5]} | #{s[6]} "
	puts "---+---+---"
	puts " #{s[7]} | #{s[8]} | #{s[9]} "
end

def empty_spaces(spaces)
	spaces.select{|k,v| v.is_a? Numeric}.keys
end

def player_choice(spaces, side)
		puts "Choose a space (1-9):"
		choice = gets.chomp.to_i
	until empty_spaces(spaces).include?(choice)
		puts "Space already taken, choose an empty space:"
		choice = gets.chomp.to_i
	end 
	spaces[choice] = side
end

def computer_choice(spaces, side)
	choice = empty_spaces(spaces).sample
	spaces[choice] = side
end

def check_win(spaces)
	winning_lines = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
	winning_lines.each do |line| 
		return "X" if spaces.values_at(*line).count("X") == 3
		return "O" if spaces.values_at(*line).count("O") == 3
	end
	nil
end
#Game-----------------------------------------------------------

puts "Welcome to Tic-Tac-Toe!"

#Choosing sides.................................................
begin
	puts "Choose your side, X or O:"
	player = gets.chomp.upcase
end until player == "O" || player == "X"

if player == "O"
	computer = "X"
	puts "You chose O's the computer will be X's. Press [enter] to continue..."
	gets
else
	computer = "O"
	puts "You chose X's the computer will be O's. Press [enter] to continue..."
	gets
end

spaces = initialize_spaces

draw_board(spaces)

#The play...............................................................
if player == "X"
	begin
		player_choice(spaces, player)
		computer_choice(spaces, computer)
		draw_board(spaces)
		winner = check_win(spaces)
	end until winner || empty_spaces(spaces).empty?
else
	begin
		computer_choice(spaces, computer)
		draw_board(spaces)
		if empty_spaces(spaces).empty?
			break
		else
			player_choice(spaces, player)
		end
		winner = check_win(spaces)
	end until winner || empty_spaces(spaces).empty?
end

#Win message...........................................................
if winner == player
	puts "#{winner}'s won! Cograts, you beat the computer!"
elsif winner == computer
	puts "#{winner}'s won! Sorry, you lost...try again next time."
else
	puts "Cat game! It's a tie. Good game."
end



