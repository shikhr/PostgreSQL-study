#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess --no-align -t -c"

echo "Enter your username:"
read USERNAME

USERID=$($PSQL "select user_id from users where username='$USERNAME'")

if [[ -z "$USERID" ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  USERINSERT=$($PSQL "insert into users (username) values ('$USERNAME')")
  USERID=$($PSQL "select user_id from users where username='$USERNAME'")
else
  GAMES_PLAYED=$($PSQL "select count(user_id) from games where user_id=$USERID")
  BEST_GAME=$($PSQL "select min(no_guess) from games where user_id=$USERID")
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

RAND=$((1+$RANDOM%1000))
GUESS=-1
COUNT=0
echo "Guess the secret number between 1 and 1000:"
while [[ $GUESS -ne $RAND ]]
do
  read GUESS
  COUNT=$((COUNT+1))
  if ! [[ "$GUESS" =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
  elif [[ $GUESS -lt $RAND ]]
  then
    echo "It's higher than that, guess again:"
  elif [[ $GUESS -gt $RAND ]]
  then
    echo "It's lower than that, guess again:"
  fi
done

echo "You guessed it in $COUNT tries. The secret number was $RAND. Nice job!"
GAMEINSERT=$($PSQL "INSERT INTO games(user_id, no_guess) VALUES ($USERID, $COUNT)")
