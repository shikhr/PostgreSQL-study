#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi
$PSQL "Truncate teams, games"
# Do not change code above this line. Use the PSQL variable above to query your database.

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WGOALS OGOALS
do
  # echo $YEAR $ROUND $WINNER $OPPONENT $WGOALS $OGOALS
  if [[ $YEAR == year ]]
  then 
    continue
  fi
  OPPONENT_ID="$($PSQL "select team_id from teams where name='$OPPONENT'")"
  if [[ -z $OPPONENT_ID ]]
  then
    OPPONENT_INSERTED="$($PSQL "insert into teams (name) values ('$OPPONENT')")"
    OPPONENT_ID="$($PSQL "select team_id from teams where name='$OPPONENT'")"
  fi
  WINNER_ID="$($PSQL "select team_id from teams where name='$WINNER'")"
  if [[ -z $WINNER_ID ]]
  then
    WINNER_INSERTED="$($PSQL "insert into teams (name) values ('$WINNER')")"
    WINNER_ID="$($PSQL "select team_id from teams where name='$WINNER'")"
  fi
  GAME_INSERTED="$($PSQL "insert into games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) values ($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WGOALS, $OGOALS)")"
done
