#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=salon -t -c"

MAIN() {
  if [[ ! -z $1 ]]
  then
    echo -e $1
  fi
  SERVICES_LIST=$($PSQL "select * from services")
  echo "$SERVICES_LIST" | while read SERVICE_ID bar SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done
  SERVICE
}

SERVICE() {
  echo -e "Enter service id"
  read SERVICE_ID_SELECTED
  SERVICE_NAME=$($PSQL "select name from services where service_id=$SERVICE_ID_SELECTED")
  if [[ -z $SERVICE_NAME ]]
  then
    MAIN "\nThe picked service does not exist. Try again."
  else
    echo -e "\nEnter phone number"
    read CUSTOMER_PHONE
    CUSTOMER_NAME=$($PSQL "select name from customers where phone='$CUSTOMER_PHONE'")
    if [[ -z $CUSTOMER_NAME ]]
    then
      echo -e "\nEnter name"
      read CUSTOMER_NAME
      NAME_INSERTED=$($PSQL "Insert into customers (name, phone) VALUES ('$CUSTOMER_NAME' ,'$CUSTOMER_PHONE')")
    fi
    CUSTOMER_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE'")
    echo -e "\nEnter service time"
    read SERVICE_TIME
    APPOINTMENT_INSERTED=$($PSQL "Insert into appointments (customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
    if [[ $APPOINTMENT_INSERTED ]]
    then
      echo -e "\nI have put you down for a $(echo $SERVICE_NAME | sed -E 's/^ +| +$//g' ) at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed -E 's/^ +| +$//g')."
    fi
  fi
}

MAIN
