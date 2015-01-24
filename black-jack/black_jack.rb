#Blackjack with choice of single or double deck and basic betting implemented, no insurance, no splitting aces.

#Constants
SUIT = ["♥", "♦", "♣", "♠" ]

FACE = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]

#Methods
def show_user(player_cards, total)
  cards = ""
  player_cards.each {|card| cards += "#{card[0]}#{card[1]} "}
  puts "Your cards: #{cards}Total: #{total}"
end

def show_computer(player_cards, total)
  cards = ""
  player_cards.each {|card| cards += "#{card[0]}#{card[1]} "}
  puts "Computer Cards: #{cards}Total: #{total}"
end

def total(player_cards)
  total = 0
  
  aces = player_cards.select {|card| card[0] == "A"}
  other_cards = player_cards.select {|card| card[0] != "A"}

  other_cards.each do |card|
    if (card[0] == "J" || card[0] == "Q" || card[0] == "K")
      total += 10
    else
      total += card[0].to_i
    end
  end
  
  aces.each do |card|
    total += 11
    total -= 10 if total > 21
  end  
  total
end

def deal(player_cards, deck)
  player_cards << deck.pop
end

def payout(player_total, bet, deck, computer_total=nil)
  multiplier = 0 #Single deck has a slightly worse payout for blackjack
  if deck == 1
    multiplier = 1.2
  else
    multiplier = 1.5
  end
  if player_total == 21
    (bet + (bet * multiplier)).to_i
  elsif computer_total == player_total
    bet
  else
    bet + bet
  end
end

#Game Start
puts "Welcome to balckjack! You've been given $20 to start, see how long you last. If you make it to $50, you win!"
user_money = 20

puts "Enter 1 for a single deck or 2 for a double deck. Better odds for a double."
deck_type = gets.chomp.to_i

until deck_type == 1 || deck_type == 2
  puts "You forgot to choose your deck... Enter 1 for a single or 2 for a double."
  deck_type = gets.chomp.to_i
end

#Round Start
begin
  puts "New round! Ready? [Enter]"
  gets
  
  system "clear"
  
  #Betting
  puts "You have $#{user_money}, place your bet! You may bet in increments of $5."
  user_bet = gets.chomp.to_i
  
  until user_bet > 0 && user_bet%5 == 0 && user_bet <= user_money
    puts "You must bet in increments of $5 and cannot bet more money than you have!\nYou have $#{user_money}, place your bet!"
    user_bet = gets.chomp.to_i
  end
  
  user_money -= user_bet
  
  #Shuffle
  puts "Shuffling..."
  deck = (FACE.product(SUIT) * deck_type).shuffle 

  #Deal
  user_cards = []
  computer_cards = []  

  puts "Ready to deal? [Enter]"
  gets
  
  deal(user_cards, deck)
  deal(computer_cards, deck)
  deal(user_cards, deck)
  deal(computer_cards, deck)

  user_total = total(user_cards)
  computer_total = total(computer_cards)
  
  puts "Computer Showing: #{computer_cards[1][0]}#{computer_cards[1][1]}"
  
  #Player Turn
  until user_total >= 21
    show_user(user_cards, user_total)
    begin
      puts "\nWould you like to hit or stay? Enter [hit] or [stay]"
      hit_stay = gets.chomp.downcase
    end until hit_stay == "hit" || hit_stay == "stay"
    if hit_stay == "hit"
      deal(user_cards, deck)
      user_total = total(user_cards)
    else
      break
    end
  end
  
  #Computer Turn
  until computer_total >= 17 || user_total > 21
    deal(computer_cards, deck)
    computer_total = total(computer_cards)
  end
  
  #Payout
  if user_total == 21
    if user_total == computer_total
      show_user(user_cards, user_total)
      show_computer(computer_cards, computer_total) 
      puts "\nYou tied..."
      user_money += payout(user_total, user_bet, deck_type, computer_total)
    else
      show_user(user_cards, user_total)
      puts "\nYou got blackjack! You win!"
      user_money += payout(user_total, user_bet, deck_type)
    end
  elsif user_total > 21
    show_user(user_cards, user_total)
    puts "\nYou busted, you lose."
  elsif computer_total > 21
    show_computer(computer_cards, computer_total)  
    puts "\nThe computer busted, you win!"
    user_money += payout(user_total, user_bet, deck_type)
  elsif computer_total > user_total
    show_user(user_cards, user_total)
    show_computer(computer_cards, computer_total)  
    puts "\nSorry, you lose."
  elsif computer_total < user_total
    show_user(user_cards, user_total)
    show_computer(computer_cards, computer_total)
    puts "\nCongrats, you win!"
    user_money += payout(user_total, user_bet, deck_type, computer_total)
  else
    show_user(user_cards, user_total)
    show_computer(computer_cards, computer_total)
    puts "\nYou tied..."
    user_money += payout(user_total, user_bet, deck_type, computer_total)
  end
  
  puts "You now have $#{user_money}."
  
end until user_money < 5 || user_money >= 50
#Round End

if user_money >= 50
  puts "You beat the house! Congrats!"
else
  puts "You're broke. Better luck next time..."
end
#Game End
