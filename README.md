# Mastermind

Odin Project Reference: https://www.theodinproject.com/courses/ruby-programming/lessons/mastermind

This project was created with Ruby and is my second project completed with an object oriented approach.

The board game version of mastermind can be played with 2 players. One player is the code breaker and one player is the code maker; however, I've limited the team selection to only allow the player to play as the code breaker. The gameplay loop of playing the code maker without a human opponent was very uninsteresting. The player could only set a code while the computer made randomized guesses based on a sorting algorithm. This made for very unengaging gameplay and had a cheap feeling when the computer will quickly guess your code.

    *The Player can select a range of difficulty from easy, medium, hard & codebreaker. This limits the amount of turns the player has to decode.

    *A confirmation screen is prompted followed by an outline of the game settings.

    *The Code Maker will randomly generate a code based on an array of 6 colors with the possibility of having up to 2 duplicate colors.

    *The player will have a given number of turns based on the difficulty selected to decode the secret code set by the Code Maker.
