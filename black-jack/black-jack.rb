# create a deck
require 'pry'

deck = {:heart => ['A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K'], :diamond => ['A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K'], :spade => ['A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K'], :club => ['A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K']}
# Infinite deck? or Shuffle?

SUIT = [:heart, :diamond, :club, :spade]

def init_deck
    deck = {}
    arr = []
    (1..13).each {|value| arr[value-1] = value}
    SUIT.each {|suit| deck[suit] = arr}
    deck
end

    

# check for 21
# check for bust
# check for check for 17
# CHECK WIN

puts "Welcome to black jack!\nLadies and Gentlemen place your bets!"



p deck

card = deck[:heart].pop
p deck