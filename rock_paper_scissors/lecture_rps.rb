#Players Choose Paper, Rock, Scissors
#Compare choices
#REpeat?

CHOICES = { "s" => "scissors", "p" => "paper", "r" => "rock"}
score = 0

def convert(letter)
    if letter == "s"
        letter = "scissors"
    elsif letter == "p"
        letter = "paper"
    elsif letter == "r"
        letter = "rock"
    end
end


puts "Welcome to Rock Paper Scissors!\nEach round you'll pick Rock (r), Paper (p), or Scissors (s).\n\n*Rock beats scissors*\n*Paper beats rock*\n*Scissors beats paper*\n\nYou'll earn 2 points for a win, 1 for a tie, and 0 for loss.\n\nGood Luck!"

begin
    begin
        puts "\nTo get started , pick one: (r, p, s)"
        p_choice = gets.chomp.downcase
    end until CHOICES.keys.include?(p_choice)
    
    c_choice = CHOICES.keys.sample
    
    puts "You chose #{convert(p_choice)} and the computer chose #{convert(c_choice)}..."
    
    if (p_choice == "s" && c_choice == "p") || (p_choice == "r" && c_choice == "s") ||(p_choice == "p" && c_choice == "r")
        puts "You win! :)"
        score += 2
    elsif p_choice == c_choice
        puts "You tied!"
        score += 1
    else
        puts "The Computer wins! :("
    end
        
    puts "Another round? (Y/N)"
    answer = gets.chomp.upcase
    
end while answer == "Y"

puts "Great job! You scored #{score} points!"