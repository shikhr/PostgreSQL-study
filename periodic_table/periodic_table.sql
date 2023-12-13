#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t -c"
if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  ELEMENT_LIST=$($PSQL "select * from elements")
  while read atomic_number bar symbol bar name
  do
      if [[ $1 == $atomic_number || $1 == $name || $1 == $symbol ]]
      then
        type=$($PSQL "select t.type from properties p inner join types t on p.type_id = t.type_id where atomic_number=$atomic_number" | xargs)
        mass=$($PSQL "select atomic_mass from properties where atomic_number=$atomic_number" | xargs)
        mp=$($PSQL "select melting_point_celsius from properties where atomic_number=$atomic_number" | xargs)
        bp=$($PSQL "select boiling_point_celsius from properties where atomic_number=$atomic_number" | xargs)

        echo "The element with atomic number $atomic_number is $name ($symbol). It's a $type, with a mass of $mass amu. $name has a melting point of $mp celsius and a boiling point of $bp celsius."
        flag=1
        break
      fi
  done <<< "$ELEMENT_LIST"
  if [[ -z $flag ]]
  then
    echo "I could not find that element in the database."
  fi
fi
