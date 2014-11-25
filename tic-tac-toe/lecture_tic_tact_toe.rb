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

def draw_board
	puts "   |   |   "
	puts "---+---+---"
	puts "   |   |   "
	puts "---+---+---"
	puts "   |   |   "
end
puts "Welcome to Tic-Tac-Toe!"

begin
	puts "Choose your side, X or O:"
	player1 = gets.chomp.downcase
end until player1 == "o" || player1 == "x"

if player1 == "o"
	player2 = "x"
	puts "You chose O's the computer will be X's."
else
	player2 == "o"
	puts "You chose O's the computer will be X's."
end




draw_board