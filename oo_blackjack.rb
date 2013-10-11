require 'rubygems'
require 'pry'

# getting started
# what are the major actors in my app?  What are the common behaviors extracted from those actors?
# Major nouns from the specs of the app will be your classes
# Major verbs - assign them to classes, behaviors/methods
# Example - Deck, Card, Player, Dealer
# Example - Deal, Shuffle, Hit, 

class Card
  attr_accessor :face_value, :suit

  def initialize (fv, s)
    @face_value = fv
    @suit = s
  end

  def pretty_output
    puts "#{face_value} of #{suit}"
  end
  
  # def to_s
  #   pretty_output
  # end
 
end

class Deck
	attr_accessor :cards

	def initialize
		@cards = []

		['2','3','4','5','6','7','8','9','10','Jack','Queen','King','Ace'].each do |face_value|
			['Hearts','Diamonds','Spades','Clubs'].each do |suit|
				@cards << Card.new(face_value,suit)	
			end	
		end
		shuffle_deck!
	end
	
	def shuffle_deck!
		cards.shuffle!
	end

	def deal_one
		cards.pop
	end

	def size
		cards.size
	end

end


class Player

	attr_accessor :name , :cards

	def initialize (name = 'Player')
		@name = name
		@cards = []	
	end
end

class Dealer < Player	

	attr_accessor :name , :cards

	def initialize (name = 'Dealer')
		@name = name
		@cards = []	
	end
end

class Hand

end

# Blackjack Class should ask name, shuffle deck, deal initial hands, and show proper total to start
# First Player turn, then dealer turn, showing totals as you go - hit_or_stay

class Blackjack

	def calculate_total(cards)
		
		arr = cards.map{ |e| e[0] }

		total = 0
		arr.each do |value|
			if value == "Ace"
				total += 11
			elsif value.to_i == 0 # J,Q,K
				total += 10
			else
				total += value.to_i
			end
	end
# control for Aces
		arr.select{|e| e == "Ace"}.count.times do
		total -= 10 if total > 21
	end

		total
	end
	
	def show_total(player)
		puts "Showing a total of: #{player.calculate_total}"
	end

	def start
		deck = Deck.new
		deck.shuffle_deck!
		dealer = Dealer.new
		player = Player.new
		dealer_total = 0
		player_total = 0

		2.times do
			dealer.cards << deck.deal_one
			player.cards << deck.deal_one
		end




		puts "Welcome to Blackjack, what's your name, player?"
		player.name = gets.chomp

		puts "#{dealer.name} is showing:"
		puts "#{dealer.cards}"
		puts "#{player.name} is showing:"
		puts "#{player.cards}"
		

		player_total = calculate_total(player.cards)
		puts "For a total of: #{player_total}"

		#player.hit_or_stay

	end



	def hit_or_stay(player)
		if player == "Dealer"
			#do dealer logic
		else
			"puts #{player.name}, enter h to hit or s to stay"
		end

	end

	def who_won

	end

	def play_again?

	end

end

game = Blackjack.new
game.start




	











