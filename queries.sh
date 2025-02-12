#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=worldcup --no-align --tuples-only -c"

# Do not change code above this line. Use the PSQL variable above to query your database.

echo -e "\nTotal number of goals in all games from winning teams:"
echo "$($PSQL "SELECT SUM(winner_goals) FROM games")"

echo -e "\nTotal number of goals in all games from both teams combined:"
echo "$($PSQL "SELECT SUM(winner_goals + opponent_goals) FROM games;")"

echo -e "\nAverage number of goals in all games from the winning teams:"
echo "$($PSQL "SELECT AVG(winner_goals) FROM games;")" 

echo -e "\nAverage number of goals in all games from the winning teams rounded to two decimal places:"
echo "$($PSQL "SELECT ROUND(AVG(winner_goals), 2) FROM games;")"

echo -e "\nAverage number of goals in all games from both teams:"
echo "$($PSQL "SELECT AVG(winner_goals + opponent_goals) FROM games;")"

echo -e "\nMost goals scored in a single game by one team:"
echo "$($PSQL "SELECT MAX(goals)
FROM ( 
SELECT winner_goals AS goals FROM games
UNION ALL
SELECT opponent_goals AS goals FROM games)
AS all_goals;")"

echo -e "\nNumber of games where the winning team scored more than two goals:"
echo "$($PSQL "SELECT COUNT(game_id) FROM games WHERE winner_goals > 2;")"

echo -e "\nWinner of the 2018 tournament team name:"
echo "$($PSQL "SELECT name FROM teams 
WHERE team_id = (SELECT winner_id FROM games WHERE round = 'Final' AND year = 2018);")"

echo -e "\nList of teams who played in the 2014 'Eighth-Final' round:"
echo "$($PSQL "SELECT DISTINCT t.name
FROM teams AS t
JOIN (
  SELECT winner_id AS team_id FROM games
  WHERE round = 'Eighth-Final' AND year = 2014
  UNION
  SELECT opponent_id AS team_id FROM games
  WHERE round = 'Eighth-Final' AND year = 2014
) AS junction
ON t.team_id = junction.team_id ORDER BY t.name;")"

echo -e "\nList of unique winning team names in the whole data set:"
echo "$($PSQL "SELECT name FROM 
teams 
JOIN 
(SELECT DISTINCT(winner_id) FROM games) AS trial 
ON teams.team_id = trial.winner_id ORDER BY name;")"

echo -e "\nYear and team name of all the champions:"
echo "$($PSQL "SELECT year, name 
FROM teams JOIN (
    SELECT winner_id, year FROM games WHERE round = 'Final'
) AS algo
ON teams.team_id=algo.winner_id ORDER BY year;")"

echo -e "\nList of teams that start with 'Co':"
echo "$($PSQL "SELECT name FROM teams WHERE name LIKE 'Co%';")"
