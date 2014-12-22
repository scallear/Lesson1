CHOICES = { "s" => "scissors", "p" => "paper", "r" => "rock"}
score = 0

system 'clear'

puts "Welcome to Rock Paper Scissors!\nEach round you'll pick Rock (r), Paper (p), or Scissors (s).\n\n*Rock beats scissors*\n*Paper beats rock*\n*Scissors beats paper*\n\nYou'll earn 2 points for a win, 1 for a tie, and 0 for loss.\n\nGood Luck!"

begin
    begin
        puts "\nTo get started , pick one: (r, p, s)"
        player_choice = gets.chomp.downcase
    end until CHOICES.keys.include?(player_choice)
    
    computer_choice = CHOICES.keys.sample
    
    puts "You chose #{CHOICES[player_choice]} and the computer chose #{CHOICES[computer_choice]}..."
    
    if (player_choice == "s" && computer_choice == "p") || (player_choice == "r" && computer_choice == "s") ||(player_choice == "p" && computer_choice == "r")
        puts "You win! :)"
        score += 2
    elsif player_choice == computer_choice
        puts "You tied!"
        score += 1
    else
        puts "The Computer wins! :("
    end
        
    puts "Another round? (Y/N)"
    answer = gets.chomp.upcase
    
end while answer == "Y"

puts "Great job! You scored #{score} points!"