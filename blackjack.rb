
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

def show_cards(hand)
	 hand.to_s
end

	cards = ['2','3','4','5','6','7','8','9','10','J','Q','K','A']
	suit = ['Hearts','Diamonds','Clubs','Spades']
	deck = cards.product(suit)
	deck.shuffle!

	


puts "Let's get ready to play BLACKJACK!"
player_hand = []
dealer_hand = []
player_total = 0
dealer_total = 0

player_hand << deck.pop
dealer_hand << deck.pop
player_hand << deck.pop
dealer_hand << deck.pop

player_total = calculate_total(player_hand)
dealer_total = calculate_total(dealer_hand)


puts "Dealer showing: #{dealer_hand[0] }"
puts "You have: " + show_cards(player_hand)
puts "for a total of #{player_total}"

# Player's turn
while true
	puts "h) to hit or s) to stay?"
	hit_or_stay = gets.chomp

	if hit_or_stay == 's'
		break
	else
	player_hand << deck.pop
	player_total = calculate_total(player_hand)
		if player_total > 21 
			puts 'BUSTED! Dealer wins!'
			exit
		else
			puts "You now have: #{show_cards(player_hand)}"
			puts "for a total of #{player_total}"
		end				
	end
end

# Dealer's turn
while dealer_total < 17 || dealer_total < player_total
	puts "Dealer has: #{dealer_hand}, for a total of: " + calculate_total(dealer_hand).to_s
	puts ''
	puts "Dealer hits ..."
	dealer_hand << deck.pop
	dealer_total = calculate_total(dealer_hand)
	puts show_cards(dealer_hand)

	if dealer_total > 21
		puts "Dealer BUSTED! You Win!"
		break
	elsif dealer_total > player_total
		puts "Dealer wins! - buuuuuurn "
		break
	end
end






