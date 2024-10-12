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

  def test_display_word
    @game.add_guess("t")
    result = @game.display_word
    expected = "t _ _ t"

    assert_equal expected, result
  end
  
  def test_remaining_attempts
    assert_equal 6, @game.remaining_attempts  # Check that you start with 6 attempts
    @game.add_guess("x")  # Simulate guessing a wrong letter
    assert_equal 5, @game.remaining_attempts  # After a wrong guess, you should have 5 attempts left
  end

  def test_wrong_guesses_count
    @game.add_guess("x")  # Guess a wrong letter
    @game.add_guess("y")  # Guess another wrong letter
    assert_equal 2, @game.wrong_guesses_count  # There should be 2 wrong guesses now
    @game.add_guess("t")  # Guess a correct letter
    assert_equal 2, @game.wrong_guesses_count  # The count of wrong guesses should still be 2
  end

  def test_won?
    @game.add_guess("t")  # Guess "t"
    @game.add_guess("e")  # Guess "e"
    @game.add_guess("s")  # Guess "s"
    @game.add_guess("t")  # Guess "t" again
    assert_equal true, @game.won?  # Check if the game is won
  end

end
