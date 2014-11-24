print "Play Rock Paper Scissors!"

print "Choose one: (P/R/S)"
player_choice = gets.chomp

comp_choice = rand(3)


def choice_convert(choice)
    if (choice == "0" || choice == "P")
        choice == "paper"
    elsif (choice == "1" || choice == "R")
        choice == "rock"
    elsif (choice == "2" || choice == "S")
        choice = "scissors"
    end
end

puts "Player choice is #{player_choice} and Comp choice is #{comp_choice}"

puts choice_convert(player_choice)

puts choice_convert(comp_choice)

