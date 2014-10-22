require File.expand_path(File.dirname(__FILE__) + '/neo')

# Greed is a dice game where you roll up to five dice to accumulate
# points.  The following "score" function will be used to calculate the
# score of a single roll of the dice.
#
# A greed roll is scored as follows:
#
# * A set of three ones is 1000 points
#
# * A set of three numbers (other than ones) is worth 100 times the
#   number. (e.g. three fives is 500 points).
#
# * A one (that is not part of a set of three) is worth 100 points.
#
# * A five (that is not part of a set of three) is worth 50 points.
#
# * Everything else is worth 0 points.
#
#
# Examples:
#
# score([1,1,1,5,1]) => 1150 points
# score([2,3,4,6,2]) => 0 points
# score([3,4,5,3,3]) => 350 points
# score([1,5,1,2,4]) => 250 points
#
# More scoring examples are given in the tests below:
#
# Your goal is to write the score method.

def score(dice)
  
  # Number of rolled dices must be between 0 and 5.
  if !dice || dice.size > 5
    raise StandardError, "Number of rolled dices should be between 0 and 5."
  else
    # Checks whether dice contains only valid numbers.
    dice.each do |n|
      if n < 1 || n > 6
        raise StandardError, "Dice must only contain numbers between 1 and 6."
      end
    end
  end

  # Walks through the array counting the numbers of each dice.
  h = Hash.new(0)             # Initializes all values with 0.
  dice.each {|n| h[n] += 1 }  # Adds 1 to the value with key n.

  # Message in stdout for debugging purposes.
  # puts "-" * 22
  # puts "Dice rolled:"
  # h.each { |n, value| puts "Number #{n} is #{value} time(s)."}
  
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

class AboutScoringProject < Neo::Koan
  def test_score_of_an_empty_list_is_zero
    assert_equal 0, score([])
  end

  def test_score_of_a_single_roll_of_5_is_50
    assert_equal 50, score([5])
  end

  def test_score_of_a_single_roll_of_1_is_100
    assert_equal 100, score([1])
  end

  def test_score_of_multiple_1s_and_5s_is_the_sum_of_individual_scores
    assert_equal 300, score([1,5,5,1])
  end

  def test_score_of_single_2s_3s_4s_and_6s_are_zero
    assert_equal 0, score([2,3,4,6])
  end

  def test_score_of_a_triple_1_is_1000
    assert_equal 1000, score([1,1,1])
  end

  def test_score_of_other_triples_is_100x
    assert_equal 200, score([2,2,2])
    assert_equal 300, score([3,3,3])
    assert_equal 400, score([4,4,4])
    assert_equal 500, score([5,5,5])
    assert_equal 600, score([6,6,6])
  end

  def test_score_of_mixed_is_sum
    assert_equal 250, score([2,5,2,2,3])
    assert_equal 550, score([5,5,5,5])
    assert_equal 1100, score([1,1,1,1])
    assert_equal 1200, score([1,1,1,1,1])
    assert_equal 1150, score([1,1,1,5,1])
  end

end
