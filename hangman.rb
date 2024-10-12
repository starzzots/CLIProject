class Hangman
  attr_reader :word, :guesses, :max_attempts

  def initialize(word, max_attempts = 6)
    @word = word.downcase
    @max_attempts = max_attempts
    @guesses = []
  end
  
  def guess(letter)
    @guesses.include?(letter.downcase)
  end


end
