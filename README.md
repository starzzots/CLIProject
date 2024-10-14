# Hangman Game in Ruby

## Description

This is a command-line implementation of the classic Hangman game. In this game:

- **Word Selection**: One player enters a secret word for another player to guess.
- **Letter Guessing**: The guessing player attempts to figure out the word by guessing letters one at a time.
- **Game Feedback**: The game provides feedback on each guess:
  - Displays the current state of the word (with correctly guessed letters revealed and others as blanks).
  - Shows previously guessed letters and the number of remaining attempts.
- **Win/Lose Conditions**: The game continues until the guessing player either reveals the entire word or exhausts their allowed attempts.

## Requirements

- Ruby (version 2.0 or higher)

## Installation

1. Ensure you have Ruby installed on your machine.
2. Clone the repository or download the source code.
3. Make sure the `main.rb` file is in the same directory as your hangman file.

## Usage

Run the game using:

```bash
ruby main.rb
