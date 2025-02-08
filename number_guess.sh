#!/bin/bash

# Variable to query the database
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Prompt player for username
echo -e "\nEnter your username:"
read USERNAME

# Get user ID and previous game data
USER_INFO=$($PSQL "SELECT user_id, (SELECT COUNT(*) FROM games WHERE users.user_id = games.user_id), (SELECT MIN(guesses) FROM games WHERE users.user_id = games.user_id) FROM users WHERE username='$USERNAME'")

if [[ -z $USER_INFO ]]; then
    # New player: Insert into users table
    INSERT_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
    USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
    echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
else
    # Extract user info from query result
    IFS='|' read USER_ID GAMES_PLAYED BEST_GAME <<< "$USER_INFO"
    
    # If BEST_GAME is NULL (no games played), set it to "N/A"
    if [[ -z $BEST_GAME ]]; then
        BEST_GAME="N/A"
    fi

    echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# Generate a random number between 1 and 1000
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))

# Initialize guess count
GUESS_COUNT=1

# Prompt first guess
echo -e "\nGuess the secret number between 1 and 1000:"
read USER_GUESS

# Loop until the correct guess
while [[ $USER_GUESS -ne $SECRET_NUMBER ]]; do
    # Check if input is an integer
    if [[ ! $USER_GUESS =~ ^[0-9]+$ ]]; then
        echo -e "\nThat is not an integer, guess again:"
    else
        # Provide hint if guess is too high or low
        if [[ $USER_GUESS -lt $SECRET_NUMBER ]]; then
            echo "It's higher than that, guess again:"
        else
            echo "It's lower than that, guess again:"
        fi
    fi
    
    # Read next guess and increment guess count
    read USER_GUESS
    ((GUESS_COUNT++))
done

# Insert game result into database
INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(user_id, guesses) VALUES ($USER_ID, $GUESS_COUNT)")

# Winning message
echo -e "\nYou guessed it in $GUESS_COUNT tries. The secret number was $SECRET_NUMBER. Nice job!"
