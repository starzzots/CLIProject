require './hangman.rb'

def prompt(message)
  puts "#{message} "
  gets.chomp
end

def play_game
  puts "Welcome to Hangman!"
  #word = prompt("Please enter a word to guess:")  # Get the word from the user
  word = ["apple","carrot","amazing", "tomato", "mississippi", "fragile"].sample
  game = Hangman.new(word)

  until game.remaining_attempts.zero? || game.won?
    puts "\nCurrent word: #{game.display_word}"
    puts "Guessed letters: #{game.guesses.join(', ')}"
    puts "Remaining attempts: #{game.remaining_attempts}"

    guess = prompt("Please guess a letter:").downcase
    game.add_guess(guess)  # Add the guess to the game

    if game.guess(guess)
      puts "You've already guessed '#{guess}'. Try again!"
    elsif !game.word.include?(guess)
      puts "'#{guess}' is not in the word."
    end
  end

  if game.won?
    puts "\nCongratulations! You've won! The word was '#{game.word}'."
  else
    puts "\nGame Over! The word was '#{game.word}'."
  end
end

play_game
