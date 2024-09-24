#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

RANDOM_NUMBER=$((RANDOM % 1000 + 1))

echo "Enter your username:"
read USERNAME

# Überprüfen, ob der Benutzer in der Datenbank ist
USER_INFO=$($PSQL "SELECT username, games_played, best_game FROM userdata WHERE username = '$USERNAME'")

if [[ -z $USER_INFO ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  INSERT_USERNAME=$($PSQL "INSERT INTO userdata(username, games_played, best_game) VALUES('$USERNAME', 0, NULL)")
else
  GAMES_PLAYED=$(echo $USER_INFO | cut -d '|' -f 2)
  BEST_GAME=$(echo $USER_INFO | cut -d '|' -f 3)
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# Start des Spiels
echo -e "\nGuess the secret number between 1 and 1000:"
TRIES=0

while true; do
  read GUESS
  ((TRIES++))

  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
  elif [[ $GUESS -gt $RANDOM_NUMBER ]]
  then
    echo "It's lower than that, guess again:"
  elif [[ $GUESS -lt $RANDOM_NUMBER ]]
  then
    echo "It's higher than that, guess again:"
  else
    echo "You guessed it in $TRIES tries. The secret number was $RANDOM_NUMBER. Nice job!"
    
    # Anzahl der gespielten Spiele erhöhen
    UPDATE_GAMES_PLAYED=$($PSQL "UPDATE userdata SET games_played = games_played + 1 WHERE username = '$USERNAME'")

    # Aktualisiere best_game, wenn es besser ist
    if [[ -z $BEST_GAME || $TRIES -lt $BEST_GAME ]]
    then
      UPDATE_BEST_GAME=$($PSQL "UPDATE userdata SET best_game = $TRIES WHERE username = '$USERNAME'")
    fi
    break
  fi
done
