require 'rubygems'
require 'pry'

# getting started
# what are the major actors in my app?  What are the common behaviors extracted from those actors?
# Major nouns from the specs of the app will be your classes
# Major verbs - assign them to classes, behaviors/methods
# Example - Deck, Card, Player, Dealer
# Example - Deal, Shuffle, Hit, 

class Card
	attr_accessor :suit, :face_value

	def initialize (s, fv)
		@suit = s
		@face_value = fv
	end

	def pretty_output
		puts "The #{face_value} of #{find_suit}"
	end
	
	def to_s
		pretty_output
	end
	
	def find_suit
    ret_val = case suit
                when 'H' then 'Hearts'
                when 'D' then 'Diamonds'
                when 'S' then 'Spades'
                when 'C' then 'Clubs'
              end
    ret_val
  end
end

class Deck
	attr_accessor :cards

	def initialize
		@cards = []

		value = ['2','3','4','5','6','7','8','9','10','J','Q','K','A']
		suit = ['H','D','S','C']
		@cards = value.product(suit)
		
	end		
	
	def shuffle_deck!
		@cards.shuffle!
	end

	def deal_one
		cards.pop
	end

end

module Hand 

	def show_hand
		cards.each do |card|
			card.pretty_output
		end
	end

	def calculate_total(cards)
		
		arr = cards.map{ |e| e[0] }

		total = 0
		arr.each do |value|
			if value == "A"
				total += 11
			elsif value.to_i == 0 # J,Q,K
				total += 10
			else
				total += value.to_i
			end
	end


# control for Aces
	arr.select{|e| e == "A"}.count.times do
		total -= 10 if total > 21
	end

	total
	end
	
	def show_total

	end
end

class Player

	include Hand

	attr_accessor :name , :cards

	def initialize (name = 'Player')
		@name = name
		@cards = []	
	end
end

class Dealer < Player	

	def initialize (name = 'Dealer')
		@name = name
		@cards = []	
	end
end

#Start the game

deck = Deck.new
deck.shuffle_deck!



dealer = Dealer.new

dealer.cards << deck.deal_one
dealer.cards << deck.deal_one

#setup player
player = Player.new

puts "Enter your name:"
player.name = gets.chomp

player.cards << deck.deal_one
player.cards << deck.deal_one

binding.pry

	











