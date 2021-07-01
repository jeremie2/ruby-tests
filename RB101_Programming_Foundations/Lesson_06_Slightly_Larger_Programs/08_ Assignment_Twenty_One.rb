
############## ASSIGNMENT: TWENTY-ONE


##### RULES OF TWENTY-ONE

# - 52-card deck
# - 4 groups: 13 values each (hearts, diamonds, clubs, and spades)
# - Each group: 2..10 + jack, queen, king, ace 
# 
# - Target: try to get as close to 21 as possible, without going over.
#           If you go over 21, you loose.
# 
# - The game consists of a "dealer" and a "player". Both participants are initially 
#   dealt 2 cards. The player can see their 2 cards, but can only see one of the 
#   dealer's cards.
# 
# - Card values: - 2..10 are worth their face value
#                - jack, queen, and king are each worth 10
#                - ace: 1 or 11. Value changes so that the sum with other cards
#                       will not exceed 21.
# 
# - Player turn: player goes first, and can decide to either "hit" (ask another 
#   card) or "stay". He decides depending by the cards he got. Ex. if you know that 
#   the dealer already has a 10 and you got a 2 and a 4... you have to ask for 
#   another card.
# - Turn is over when the player either busts or stays.
#   - If player busts, game is over and dealer won.
# 
# - Dealer turn: when the player stays, it's the dealer's turn. The dealer must 
#   follow a strict rule for determining whether to hit or stay: hit until the 
#   total is at least 17. If the dealer busts, then the player wins.
# 
# - Comparing cards: when both the player and the dealer stay, it's time to compare 
#   the total value of the cards and see who has the highest value.


##### EXAMPLES OF GAMEPLAY

# 1.
# Dealer has: Ace and unknown card
# You have: 2 and 8
# 
# You should "hit" in this scenario. You see the dealer has an "Ace", which means 
# the dealer has a high probability of having a 21, the optimal number. On top of 
# that, your total of 10 can only benefit from an extra card, as there's no way you 
# can bust.

# 2.
# Dealer has: 7 and unknown card
# You have: 10 and 7
# 
# You should "stay" here, because chances are good that the unknown card is not an 
# Ace, which is the only situation where you can lose. Most likely, you're going to 
# win with 17, or tie. There's a very small chance you will lose.

# 3.
# Dealer has: 5 and unknown card
# You have: Jack and 6

# This one is a little tricky, and at first glance, you may think that either a 
# "hit" or "stay" would be appropriate. You have 16 and you could maybe try to get 
# lucky and land a card less than 6. That would be ok reasoning, except for the 
# fact that the dealer has a 5. You're anticipating that the unknown card is worth 
# 10, thereby making the dealer's cards worth 15. This means the dealer must hit, 
# and there's a good chance the dealer will bust. The best move here is to "stay", 
# and hope the dealer busts.


##### IMPLEMENTATION STEPS

# 1. Initialize deck
# 2. Deal cards to player and dealer
# 3. Player turn: hit or stay
#   - repeat until bust or "stay"
# 4. If player bust, dealer wins.
# 5. Dealer turn: hit or stay
#   - repeat until total >= 17
# 6. If dealer bust, player wins.
# 7. Compare cards and declare winner.


##### TIPS ON GETTING STARTED

# 1. Figure out a data structure to contain the "deck" and the "player's cards" and 
#    "dealer's cards". Maybe a hash? An array? A nested array? Your decision will 
#    have consequences throughout your code, but don't be afraid of choosing the 
#    wrong one. Play around with an idea, and see how far you can push it. If it 
#    doesn't work, back out of it.


# 2. Calculating Aces. Remember that aces can be worth either 1 or 11, depending 
#    on the context. You should not ask the user what the value of the ace is; your 
#    program should be able to figure this out automatically.


# 3. Player turn. When thinking about how to code up the player's turn, think about 
#    a loop that keeps asking the player to either "hit" or "stay". Now, think about 
#    the breaking condition for that loop. When do we stop asking that question to 
#    the user? Some pseudo-code may help.
# 
#    1. ask "hit" or "stay"
#    2. if "stay", stop asking
#    3. otherwise, go to #1

