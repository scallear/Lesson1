require 'pry'

suit = ["♥", "♦", "♣", "♠" ]

cards = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]

def show_cards(player)
  cards = ""
  player.each {|card| cards += "#{card[0]}#{card[1]} "}
  cards
end

def total(player)
  total = 0
  player.sort!
  player.each do |card|
    if (card[0] == "J" || card[0] == "Q" || card[0] == "K")
      total += 10
    elsif card[0] == "A" && total >= 10
      total += 1
    elsif card[0] == "A"
      total += 11
    else
      total += card[0].to_i
    end
  end
  total
end

deck = cards.product(suit).shuffle

my_cards = []
computer_cards = []

puts "Welocome to balckjack!"

puts "Ready to deal? [Enter]"
gets

my_cards << deck.pop
computer_cards << deck.pop
my_cards << deck.pop
computer_cards << deck.pop

puts "The computer has the #{computer_cards[1][0]}#{computer_cards[1][1]} showing."

#Player Turn

begin
  puts "Your have #{show_cards(my_cards)}for a total of #{total(my_cards)}."
  begin
    puts "\nWould you like to hit or stay? (hit/stay)"
    hit_stay = gets.chomp.downcase
  end until hit_stay == "hit" || hit_stay == "stay"
  if hit_stay == "hit"
    my_cards << deck.pop
  else
    break
  end
end until total(my_cards) >= 21

#Computer Turn

until total(computer_cards) >= 17 || total(my_cards) > 21
  computer_cards << deck.pop
end

#computer wins - player busts
#computer  wins - total(comp) > total(player)
#player wins - computer busts
#player wins - total(player) > total(comp)
#tie -player and computer get 21

if total(my_cards) > 21
  puts "Sorry, you lose. Your cards, #{show_cards(my_cards)}, equal #{total(my_cards)}, you busted!"
elsif total(computer_cards)> 21
  puts "Congrats you win! The computer's cards, #{show_cards(computer_cards)}, equal #{total(computer_cards)}; the computer busted."
elsif total(computer_cards) == total(my_cards)
  puts "Your cards are #{show_cards(my_cards)}, for a total of #{total(my_cards)}."
  puts "The computer's cards are #{show_cards(computer_cards)}, for a total of #{total(computer_cards)}."  
  puts "You tied..."
elsif total(computer_cards) > total(my_cards)
  puts "Your cards are #{show_cards(my_cards)}, for a total of #{total(my_cards)}."
  puts "The computer's cards are #{show_cards(computer_cards)}, for a total of #{total(computer_cards)}."  
  puts "Sorry, you lose"
elsif total(computer_cards) < total(my_cards)
  puts "Your cards are #{show_cards(my_cards)}, for a total of #{total(my_cards)}."
  puts "The computer's cards are #{show_cards(computer_cards)}, for a total of #{total(computer_cards)}."  
  puts "Congrats, you win!"
end






