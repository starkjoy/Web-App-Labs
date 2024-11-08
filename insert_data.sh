#!/bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
# Clear existing data
$PSQL "TRUNCATE TABLE games, teams;"

# Process each game record
tail -n +2 games.csv | while IFS="," read -r YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
    # Check if winner exists in the teams table and get the team_id
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    if [[ -z $WINNER_ID ]]; then
        # If the winner doesn't exist, insert it
        $PSQL "INSERT INTO teams(name) VALUES('$WINNER')"
        # Retrieve the new team_id for the winner
        WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    fi

    # Check if opponent exists in the teams table and get the team_id
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    if [[ -z $OPPONENT_ID ]]; then
        # If the opponent doesn't exist, insert it
        $PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')"
        # Retrieve the new team_id for the opponent
        OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    fi

    # Insert game data using the retrieved winner_id and opponent_id
    $PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)"
done


