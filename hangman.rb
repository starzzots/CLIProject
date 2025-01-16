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
  
  def display_word
    display = []
    @word.chars.each do |char|
      if guess(char)
        display << char
      else
        display << '_'
      end
    end
    display.join(' ')
  end
  
  def remaining_attempts
    # Calculate how many guesses are left
    @max_attempts - wrong_guesses_count
  end

  def wrong_guesses_count
    # Count how many guesses were wrong
    @guesses.reject { |g| @word.include?(g) }.size
  end

  def won?
    # Check if all letters in the word have been guessed
    (@word.chars - @guesses).empty?
  end

end
