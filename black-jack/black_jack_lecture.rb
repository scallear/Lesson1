suit = ["♥", "♦", "♣", "♠" ]

cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q", "K", "A"]

def show_cards(player)
  cards = ""
  player.each {|card| cards += "#{card[0]}#{card[1]} "}
  cards
end

def total(player)
  total = 0
  player.each do |card|
    if (card[0] == "J" || card[0] == "Q" || card[0] == "K")
      total += 10
    elsif card[0] == "A" && total >= 20
      total += 1
    elsif card[0] == "A"
      total += 11
    else
      total += card[0]
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

puts "Your have #{show_cards(my_cards)}for a total of #{total(my_cards)}"
puts "The computer has the #{computer_cards[1][0]}#{computer_cards[1][1]} showing."
