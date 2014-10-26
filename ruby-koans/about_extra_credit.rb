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

  # Stores the non-scoring dice of last roll (if any)
  attr_reader :non_scoring

  def initialize
    @values = Array.new  # Initializes the values Array
  end

  # Rolls the specified number of dice
  def roll(dice_number)
    @values = Array.new(dice_number) do |i|
      @values[i] = 1 + rand(6)  # Sets a random value for each dice
    end
  end

  # Computes the score for a given dice, updating @non_scoring variable
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

    h = Hash.new(0)  # For counting the frequency of each dice number.
    @non_scoring = dice.size  # For counting non_scoring dice.
    dice.each {|n| h[n] += 1 }  # Adds 1 to the value with key n.

    # Considers ones, adding points as appropriate.
    points_count = 0
    if h[1] >= 3
      points_count += 1000  # A set of three ones is 1000 points.
      h[1] -= 3
      @non_scoring -= 3
    end

    h[1].times do
      points_count += 100  # Adds 100 points for each additional one.
      @non_scoring -= 1
    end

    # Considers the other numbers, adding points as appropriate.
    (2..6).each do |n|
      if h[n] >= 3
        points_count += n * 100  # A set of three numbers is worth 100 * n.
        h[n] -= 3
        @non_scoring -= 3
      end
    end

    h[5].times do
      points_count += 50  # Adds 50 for each additional 5.
      @non_scoring -= 1
    end

    points_count  # Returns the number of points.

  rescue StandardError => ex
    # Throws exception out of the method.
    raise ex.class, ex.message
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

  # A player takes a turn to play and its total score is updated
  def turn!
    dice = DiceSet.new
    dice_number = 5
    continue = true
    points_of_turn = 0

    while continue
      print "Hit enter to roll #{dice_number} dice..."
      gets.chomp

      # Player rolls dice and its points are recorded
      dice.roll(dice_number)
      values = dice.values.dup
      score = dice.score(values)
      puts "The values obtained are: #{values}."

      if score == 0
        puts "You got 0 points on this roll... You loose your turn"
        puts "and the accumulated points of this turn. Sorry!"
        points_of_turn = 0
        continue = false
      else
        # Adds score to the points of this turn
        points_of_turn += score

        # Updates the number of dice that the player can use now
        dice_number = (dice.non_scoring == 0)? 5 : dice.non_scoring
        
        print "#{points_of_turn} points accumulated on this turn. "
        print "#{dice_number} dice for use.\nRoll again? (y/n) "
        opc = gets.chomp.to_s
        continue = false if (opc == "n" || opc == "N")
      end
    end

    # Adds points of turn to total score and display corrsponding messages
    if @points_count == 0 && points_of_turn < 300
      puts "You didn't reach 300 points. No points accumulated!"
    else
      if points_of_turn > 0
        puts "#{points_of_turn} points accumulated on this turn. Good!"
      end
      @points_count += points_of_turn
    end
    puts "You have a total of #{points_count} points so far."    
  end
end

#------------------------------------------------------------------------------
# Game is a class that simulates a GREED game played among 2 or more players, 
# using 5 six-sided dice.
#------------------------------------------------------------------------------
class Game

  class << self

    # Simulates a new Greed Game given a number of players
    def play(players_number)
      # Ensures players_number is at least 2
      if players_number < 2
        raise GreedError, "Greed must be played with at least 2 players."        
      end
      # Initializes Array of Player objects
      players = Array.new
      players_number.times { players << Player.new }
      puts "*" * 60
      puts "Starting Greed game with #{players_number} players:"
      last_round = false
      while !last_round
        round(players)
        (0...players_number).each do |i|
          last_round = true if players[i].points_count >= 3000
        end
      end
      # All players take last turn
      puts "*" * 60
      puts "Entering final round...!!!"
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
      puts "*" * 60
      puts "Player #{winner} wins with score #{max_score}. Bye!"
      puts "*" * 60
    end

    private
      # All players take a turn and their scores are updated accordingly
      def round(players)
        (0...players.size).each do |i| 
          puts "-" * 60
          puts "It's player #{i + 1}'s turn:"
          players[i].turn!
          break if players[i].points_count >= 3000
        end
      end
  end
end

# Own error class, for testing purposes
class GreedError < StandardError
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

  def test_score_of_various_sample_dice
    dice = DiceSet.new

    # Score of multiple 1s and 5s is the sum of individual scores
    assert_equal 300, dice.score([1,5,5,1])
  
    # Score of other triples is 100x
    assert_equal 200, dice.score([2,2,2])
    assert_equal 300, dice.score([3,3,3])
    assert_equal 400, dice.score([4,4,4])
    assert_equal 500, dice.score([5,5,5])
    assert_equal 600, dice.score([6,6,6])
  end

  def test_score_of_sample_dices_and_non_scoring_dice
    dice = DiceSet.new
    
    assert_equal 250, dice.score([5,1,3,4,1])
    assert_equal 2, dice.non_scoring

    assert_equal 1100, dice.score([1,1,1,3,1])
    assert_equal 1, dice.non_scoring

    assert_equal 450, dice.score([2,4,4,5,4])
    assert_equal 1, dice.non_scoring
  end

  #----------------------------------------------------------------------------
  # Game integration tests
  #----------------------------------------------------------------------------

  def test_game_should_have_at_least_two_players
    # Should raise exception for 0 or 1 players
    (0..1).each do |players_number|
      assert_raise(GreedError) do
        Game.play(players_number)
      end
    end
  end

  def test_game_should_play_well_for_two_or_more_players
    # If there's an error, an exception would be raised
    puts ""
    Game.play(2)
    puts ""
    Game.play(3)
  end
end