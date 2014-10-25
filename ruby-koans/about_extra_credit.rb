require File.expand_path(File.dirname(__FILE__) + '/neo')

# EXTRA CREDIT:
#
# Create a program that will play the Greed Game.
# Rules for the game are in GREED_RULES.TXT.
#
# You already have a DiceSet class and score function you can use.
# Write a player class and a Game class to complete the project.  This
# is a free form assignment, so approach it however you desire.

#------------------------------------------------------------------------------
# DiceSet is a class that simulates a set of Dice that can be rolled for the
# GREED game.
#------------------------------------------------------------------------------
class DiceSet

  attr_reader :values  # Stores the points gotten for rolling dice

  # Rolls the specified number of dice
  def roll(dice_number)
    @values = Array.new(dice_number) do |i|
      @values[i] = 1 + rand(6)  # Sets a random value for each dice
    end
  end
end

#------------------------------------------------------------------------------
# Player is a class that simulates a player for the GREED game.
#------------------------------------------------------------------------------
class Player

  # Hash that accumulates points for last turn
  attr_accessor :points_on_last_turn
  # Keeps the score of this player
  attr_reader :points_count

  def turn
    # TODO: A player takes a turn
  end
end

#------------------------------------------------------------------------------
# Game is a class that simulates a GREED game played among 2 or more players, 
# using 5 six-sided dice.
#------------------------------------------------------------------------------
class Game

  #----------------------------------------------------------------------------
  # class methods
  #----------------------------------------------------------------------------

  class << self

    # Calculates the score for a given dice
    def score(dice)
      
      if !dice || dice.size > 5
        # Number of rolled dices must be between 0 and 5.
        raise StandardError, "Number of dices should be between 0 and 5."
      else
        # Checks whether dice contains only valid numbers.
        dice.each do |n|
          if n < 1 || n > 6
            raise StandardError, "A die must contain a number between 1 and 6."
          end
        end
      end

      # Walks through the array counting the numbers of each dice.
      h = Hash.new(0)             # Initializes all values with 0.
      dice.each {|n| h[n] += 1 }  # Adds 1 to the value with key n.

      # Considers ones, adding points as appropriate.
      points_count = 0
      if h[1] >= 3
        points_count += 1000      # A set of three ones is 1000 points.
        h[1] -= 3
      end

      h[1].times do
        points_count += 100     # Adds 100 points for each additional one.
      end

      # Considers the other numbers, adding points as appropriate.
      (2..6).each do |n|
        if h[n] >= 3
          points_count += n * 100 # A set of three numbers is worth 100 * n.
          h[n] -= 3
        end
      end

      h[5].times do
        points_count += 50        # Adds 50 for each additional 5.
      end

      points_count                # Returns the number of points.

    rescue StandardError => ex
      # Throws exception out of the method.
      raise ex.class, ex.message
    end

    # Simulates a new Greed Game given a number of players
    def play(players_number)
      players = []  # Initializes an Array of players' scores
      puts "-" * 20
      puts "Starting Greed game with #{players_number} players:"
      last_round = false
      while !last_round
        round(players)
        (0...players_number).each do |i|
          if players[i] >= 3000
            last_round = true
            break
          end
        end
      end      
      # All players take last turn
      round(players)
      # Finds the winner and its score
      winner = 0
      max_score = 0
      (0...players_number).each do |i|
        if players[i] >= max_score
          max_score = players[i]
          winner = i + 1
        end
      end
      puts "-" * 20
      puts "Player #{winner} wins with score #{max_score}."
    end

    #--------------------------------------------------------------------------
    # private class methods
    #--------------------------------------------------------------------------

    private
      def round(*players)
        # TODO: All players take a turn and their scores are added
      end
  end
  
end

# The about extra credit program should pass the following tests:
#
class AboutExtraCredit < Neo::Koan
    def test_can_create_a_dice_set
    dice = DiceSet.new
    assert_not_nil dice
  end

  def test_rolling_the_dice_returns_a_set_of_integers_between_1_and_6
    dice = DiceSet.new

    dice.roll(5)
    assert dice.values.is_a?(Array), "should be an array"
    assert_equal 5, dice.values.size
    dice.values.each do |value|
      assert value >= 1 && value <= 6, "value #{value} must be between 1 and 6"
    end
  end

  def test_dice_values_do_not_change_unless_explicitly_rolled
    dice = DiceSet.new
    dice.roll(5)
    first_time = dice.values
    second_time = dice.values
    assert_equal first_time, second_time
  end

  def test_dice_values_should_change_between_rolls
    dice = DiceSet.new

    dice.roll(5)
    first_time = dice.values.dup

    dice.roll(5)
    second_time = dice.values.dup

    assert_not_equal first_time, second_time, "Two rolls should not be equal"

    # THINK ABOUT IT:
    #
    # If the rolls are random, then it is possible (although not
    # likely) that two consecutive rolls are equal.  What would be a
    # better way to test this?
  end

  def test_you_can_roll_different_numbers_of_dice
    dice = DiceSet.new

    dice.roll(3)
    assert_equal 3, dice.values.size

    dice.roll(1)
    assert_equal 1, dice.values.size
  end
end