
######## ASSIGNMENT: TWENTY-ONE BONUS FEATURES

# I'm going to change the original solution code saved into solution.rb file.
# My solution is on 11_Twenty_One_Bonus_CODE.rb file.


##### 1. PLAYER'S AND DEALER'S TOTAL

# Calculating the total. You'll notice that in our solution, every time we need the 
# player's or dealer's total value, we call a total method. Doing this is 
# expensive, from a performance perspective (suppose that we cared about 
# performance). Do we really need to calculate the total value over and over? Can 
# we use a local variable to cache the calculation, and instead of calling total 
# every time, just use the local variable? For example, our solution contains 
# multiple calls to total within the main loop:

  prompt "You have: #{player_cards[0]} and #{player_cards[1]}, for a total of #{total(player_cards)}."

  puts "=============="
  prompt "Dealer has #{dealer_cards}, for a total of: #{total(dealer_cards)}"
  prompt "Player has #{player_cards}, for a total of: #{total(player_cards)}"
  puts "=============="

# Along with that, total is also being invoked within the busted? and detect_result 
# methods:

  def busted?(cards)
    total(cards) > 21
  end

  def detect_result(dealer_cards, player_cards)
    player_total = total(player_cards)
    dealer_total = total(dealer_cards)

    # ...omitted for brevity
  end

# We're unnecessarily calling total multiple times here. We can cache each player's 
# total in a local variable within the main loop and just call those local 
# variables instead, like this:

  player_total = total(player_cards)
  dealer_total = total(dealer_cards)

# Now we can replace each call to total with the appropriate local variable. This 
# includes changing the busted? and detect_result methods to accept these new 
# local variables instead of player_cards or dealer_cards.

# If we cache each player's total like this, will it continue to update correctly 
# throughout the game? If not, at what point do we need to update each player's 
# total?

##### ANSWER

# We have to update totals again like this:

  player_total = total(player_cards)
  dealer_total = total(dealer_cards)

# every time one of the players decides to hit a new card.
# A way to avoid this repetition could be to split #total method in 3 different
# methods, for example (used on twenty_one.rb file):

  def card_value(card_val)
    return card_val if card_val.class == Integer
    card_val == 'A' ? 11 : 10
  end

  def add_cards(arr)
    total = 0
    arr.each { |el| total += card_value(el) }
    total
  end

  def total(cards)
    values = cards.map { |arr| arr[1] }
    total = add_cards(values)
    values.each { |el| total -= 10 if total > 21 && el == 'A' }
    total
  end

# so that when updating the total we can do like this:

  total_player += card_value(new_card[1])
  total_dealer += card_value(new_card[1])


##### 2. DIFFERENT USE OF #play_again?

# We use the play_again? three times: after the player busts, after the dealer busts, 
# or after both participants stay and compare cards. Why is the last call to 
# play_again? a little different from the previous two?

##### ANSWER

# The previous two take in consideration that if the player decides to play again,
# the remaining code inside the loop has to be skipped. And remaining code can be
# skipped using 'next'. 
# This doesn't matter in the last case... the loop is at its end anyway and there is
# no code to be skipped, no need to use 'next'.


##### 3. CONSISTENT END-OF-ROUND OUTPUT

# Ending the round. As mentioned above, there are 3 places where the round can end 
# and we call play_again? each time. But another improvement we'd like to make is to 
# give it a consistent end-of-round output. Right now, we get a grand output only 
# after comparing cards. Can we extract this to a method and use it in the other two 
# end-of-round areas?

##### ANSWER

# We can create the #end_of_round method:

def end_of_round(dealer_cards, dealer_total, player_cards, player_total)
  puts "=============="
  prompt "Dealer has #{dealer_cards}, for a total of: #{dealer_total}"
  prompt "Player has #{player_cards}, for a total of: #{player_total}"
  puts "=============="
end

# and place it before #display_result

##### 4. RESULT TRACKING

# Keep track of who won each round, and declare whoever reaches 5 points first as 
# the winner.

##### ANSWER

# The result is on a new file: 11_Twenty_One_Bonus_POINT.rb
# 
# - I've left #play_again? only in the final and it appears only if one of the 
#   player has won 5 rounds. As a game has to be played for 5 rounds, there's no
#   no need to ask the user if he wants to play again after any round.
# 
# - New variables declared at the beginning:
#   as we are going to have several variables that need to be updated I thought
#   it would have been better to use a hash match_data to collect all of them:

    def reset_data
      {dealer_score: 0, player_score: 0, round: 0, champion: nil}
    end

    match_data = reset_data

#   This doesn't make a big difference during the game while updating one
#   of player's score, but #reset_data allowed to update all of them in case
#   the player wants to play again.
# 
#   Using the 'round' variable is not necessary, but it's a way to communicate
#   the user and keep trace of all the stages of the game.

    MAX_SCORE = 5  # Max number of victory that a player has to reach to become
                   # the champion.

    match_data[:dealer_score] = 0  # take trace of dealer's score
    match_data[:player_score] = 0  # ... and player's score


    match_data[:round] = 0   # Take trace of the round to be displayed at the beginning of a 
                # new round. It just shows the round.

    match_data[:champion] = nil  # Take trace of the final winner if one player 
                                 # has reached MAX_SCORE

# - #display_score(dealer_score, player_score) has been created to show the
#   actual result at the end of every round
# 
# - #assign_champion is checking whether one of the player has reached MAX_SCORE

  def assign_champion(dealer_score, player_score)
    if dealer_score == MAX_SCORE
      'DEALER'
    elsif player_score == MAX_SCORE
      'PLAYER'
    else
      nil
    end
  end

# - PROBLEMS..
#   Code works:
# 
#     ==============
#     => ROUND 6
#     ==============
#     => Dealer has ["C", "K"] and ?
#     => You have: ["H", "9"] and ["S", "A"], for a total of 20.
#     => Would you like to (h)it or (s)tay?
#     s
#     => You stayed at 20
#     => Dealer turn...
#     => Dealer stays at 18
#     ==============
#     => Dealer has [["C", "K"], ["D", "8"]], for a total of: 18
#     => Player has [["H", "9"], ["S", "A"]], for a total of: 20
#     ==============
#     => You win!
#     ==============
#     => Dealer 1
#     => Player 5
#     => PLAYER IS THE CHAMPION!
#     ==============
#     -------------
#     => Do you want to play again? (y or n)
#     n
#     => Thank you for playing Twenty-One! Good bye!
#
#   but a still annoying part is that there still are REPETITIONS.
#   Just take a piece of code like this, when evaluating if dealer is 'busted': 

      if busted?(dealer_total)
        match_data[:player_score] += 1
        prompt "Dealer total is now: #{dealer_total}"
        end_of_round(dealer_cards, dealer_total, player_cards, player_total)
        display_result(dealer_total, player_total)
        display_score(match_data[:dealer_score], match_data[:player_score])
        champion = assign_champion(match_data[:dealer_score], match_data[:player_score])
        if champion != nil
          display_champion(champion)
          if play_again?
            match_data = reset_data
            next
          else
            break
          end
        end
        next_round
        next
      else
        # ..........
      end

#   This code is repeated when checking if player is busted and at the end when
#   comparing the two result.
#   Next attempt is trying to find a more concise way to resume all the steps.
# 
# 
# 
# 
