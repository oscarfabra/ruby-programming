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

  # Stores the points obtained for rolling dice
  attr_reader :values

  def initialize
    @values = Array.new  # Initializes the values Array
  end

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

  attr_reader :points_count  # Keeps the total score of the player

  def initialize
    @points_count = 0
  end

  def turn!
    # TODO: A player takes a turn
  end
end

#------------------------------------------------------------------------------
# Game is a class that simulates a GREED game played among 2 or more players, 
# using 5 six-sided dice.
#------------------------------------------------------------------------------
class Game

  #----------------------------------------------------------------------------
  # Class methods
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
      players = Array.new  # Array of Player objects
      puts "-" * 20
      puts "Starting Greed game with #{players_number} players:"
      last_round = false
      while !last_round
        round(players)
        last_round = true if players.values.max >= 3000
      end      
      # All players take last turn
      round(players)
      # Finds the winner and its score
      winner = 0
      max_score = 0
      (0...players_number).each do |i|
        if players[i].points_count >= max_score
          max_score = players[i].points_count
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
      # All players take a turn and their scores are added
      def round(*players)
        players.each do |player| 
          player.turn!
        end
      end
  end
end

#------------------------------------------------------------------------------
# The about extra credit program should pass the following tests:
#------------------------------------------------------------------------------
class AboutExtraCredit < Neo::Koan

  #----------------------------------------------------------------------------
  # DiceSet unit tests
  #----------------------------------------------------------------------------

  def test_rolling_the_dice_returns_a_set_of_integers_between_1_and_6
    dice = DiceSet.new

    dice.roll(5)
    assert dice.values.is_a?(Array), "should be an array"
    assert_equal 5, dice.values.size
    dice.values.each do |value|
      assert value >= 1 && value <= 6, "value #{value} must be between 1 and 6"
    end
  end

  def test_dice_values_should_change_between_rolls
    dice = DiceSet.new

    dice.roll(5)
    first_time = dice.values.dup

    dice.roll(5)
    second_time = dice.values.dup

    assert_not_equal first_time, second_time, "Two rolls should not be equal"
  end

  #----------------------------------------------------------------------------
  # Game scoring unit tests
  #----------------------------------------------------------------------------

  def test_score_of_multiple_1s_and_5s_is_the_sum_of_individual_scores
    assert_equal 300, Game.score([1,5,5,1])
  end

  def test_score_of_other_triples_is_100x
    assert_equal 200, Game.score([2,2,2])
    assert_equal 300, Game.score([3,3,3])
    assert_equal 400, Game.score([4,4,4])
    assert_equal 500, Game.score([5,5,5])
    assert_equal 600, Game.score([6,6,6])
  end

  def test_score_of_mixed_is_sum
    assert_equal 250, Game.score([2,5,2,2,3])
    assert_equal 550, Game.score([5,5,5,5])
    assert_equal 1100, Game.score([1,1,1,1])
    assert_equal 1200, Game.score([1,1,1,1,1])
    assert_equal 1150, Game.score([1,1,1,5,1])
  end

  #----------------------------------------------------------------------------
  # Player unit tests
  #----------------------------------------------------------------------------

  def test_player_doesnt_accumulate_points_unless_it_gets_300_points
    # TODO: Write test
  end

  def test_after_scoring_player_can_only_roll_non_scoring_dice
    # TODO: Write test
  end

  def test_if_roll_has_zero_points_player_loses_accumulated_score
    # TODO: Write test    
  end

  def test_when_player_decides_to_stop_accumulated_points_are_added_to_its_total
    # TODO: Write test
  end

  #----------------------------------------------------------------------------
  # Game integration tests
  #----------------------------------------------------------------------------

  def test_game_should_have_at_least_two_players
    # TODO: Write test
  end

  def test_once_a_player_reaches_3000_points_game_enters_final_round
    # TODO: Write test
  end
    
  def test_winner_is_player_with_highest_score_after_final_round
    # TODO: Write test
  end
end