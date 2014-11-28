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
	choice= empty_spaces(spaces).sample
	spaces[choice] = side
end

#Game-----------------------------------------------------------

puts "Welcome to Tic-Tac-Toe!"

begin
	puts "Choose your side, X or O:"
	player = gets.chomp.upcase
end until player == "O" || player == "X"

if player == "O"
	computer = "X"
	puts "You chose O's the computer will be X's."
else
	computer = "O"
	puts "You chose X's the computer will be O's."
end

spaces = initialize_spaces

draw_board(spaces)

if player == "X"
	begin
		player_choice(spaces, player)
		computer_choice(spaces, computer)
		draw_board(spaces)
	end until empty_spaces(spaces) == []
else
	begin
		computer_choice(spaces, computer)
		player_choice(spaces, player)
		draw_board(spaces)
	end until empty_spaces(spaces) ==[]
end

draw_board(spaces)



