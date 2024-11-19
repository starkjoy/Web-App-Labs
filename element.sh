#!/bin/bash

# Database connection
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# Check if an argument was provided
if [[ -z $1 ]]; then
  echo "Please provide an element as an argument."
  exit
fi

# Query the database
ELEMENT_INFO=$($PSQL "
  SELECT elements.atomic_number, elements.name, elements.symbol, properties.types, 
         properties.atomic_mass, properties.melting_point_celsius, properties.boiling_point_celsius 
  FROM elements 
  INNER JOIN properties ON elements.atomic_number = properties.atomic_number 
  WHERE elements.atomic_number::text = '$1' 
     OR elements.symbol = '$1' 
     OR elements.name = '$1';
")

# Check if the query returned a result
if [[ -z $ELEMENT_INFO ]]; then
  echo "I could not find that element in the database."
else
  # Extract fields from the result
  IFS="|" read -r ATOMIC_NUMBER NAME SYMBOL TYPES MASS MELTING_POINT BOILING_POINT <<< "$ELEMENT_INFO"
  
  # Output the element details
  echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPES, with a mass of $MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
fi
