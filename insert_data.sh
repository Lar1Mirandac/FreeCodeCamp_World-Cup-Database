#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
#apagar infos toda vez que executar o script
echo "$($PSQL "TRUNCATE TABLE games, teams;")"

#Ler infos do arquivo com dados
cat games.csv | while IFS="," read YEAR1 ROUND1 WINNER OPPONENT WINNER_GOALS1 OPPONENT_GOALS1
do
  #Desconsiderar os títulos
  if [[ $YEAR1 != year ]] 
  then
    #Verificar se os nomes dos times VENCEDORES já estão na BD usando team_id
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    #Se não encontrou o ID do time vencedor na tabela
    if [[ -z $TEAM_ID ]] 
    then
      #Inserir time na tabela
      INSERT_WINNER_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      #Mensagem confirmando inserçao de dados na tabela
      if [[ $INSERT_WINNER_RESULT == "INSERT 0 1" ]]
      then
        echo "Inserted into teams, $WINNER"
      fi
    fi
    #Verificar se os nomes dos times PERDEDORES já estão na BD usando team_id
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    #Se não encontrou o ID do time PERDEDOR na tabela
    if [[ -z $TEAM_ID ]] 
    then
      #Inserir time na tabela
      INSERT_OPPONENT_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
        #Mensagem confirmando inserçao de dados na tabela
        if [[ $INSERT_OPPONENT_RESULT == "INSERT 0 1" ]]
        then
          echo "Inserted into teams, $OPPONENT"
        fi
    fi  
    #Preencher tabela games
    #PEGAR ID DOS TIMES ENVOLVIDOS
    TAKE_ID_WINNER=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    TAKE_ID_OPPONENT=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    INSERT_GAME_DATA=$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES ($YEAR1, '$ROUND1', '$TAKE_ID_WINNER', '$TAKE_ID_OPPONENT', $WINNER_GOALS1, $OPPONENT_GOALS1)")
    if [[ $INSERT_GAME_DATA == "INSERT 0 1" ]]
    then
      echo "Inserted into games, '$YEAR1', '$ROUND1'"
    fi
  fi
done
