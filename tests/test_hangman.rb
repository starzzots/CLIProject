require 'minitest/autorun'
require './hangman'

class TestHangman < Minitest::Test
  def setup # This method runs before each test
    @game = Hangman.new("test")# Initialize a new Hangman object
  end

  def test_initialize
    assert_equal "test", @game.word # Check that the word is initialized correctly
    assert_equal [], @game.guesses # Check that guesses start as an empty array
    assert_equal 6, @game.max_attempts # Check that the max attempts are set to 6
  end

  def test_guess
    @game.add_guess("t")
    assert_equal true, @game.guess("t")
    assert_equal false, @game.guess("e")
  end

  def test_add_guess
    @game.add_guess("l")
    @game.add_guess("e")
    assert_equal ["l", "e"], @game.guesses
    @game.add_guess("l") # Guessing "t" again
    assert_equal ["l", "e"], @game.guesses # should remain unchanged
  end
end
