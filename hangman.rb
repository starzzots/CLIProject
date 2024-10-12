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

  def add_guess(letter)
    #if guess isnt true add to guesses array
    letter = letter.downcase
    unless guess(letter)
      @guesses << letter
    end
  end

end
