#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"

BOOK_APPOINTMENT(){
  SERVICE_ID_SELECTED=$1
  
  # get customer info
  echo -e "\nWhat is your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")

  # if customer does not exist
  if [[ -z $CUSTOMER_NAME ]]
  then
      # get new customer name
      echo -e "\nWhat is your name?"
      read CUSTOMER_NAME

      # insert new customer
      INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
      echo "Inserted a new customer: $INSERT_CUSTOMER_RESULT"

  fi

  # get customer_id
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

  # get appointment time
  echo -e "\nWhen is your appointment?"
  read SERVICE_TIME

  # insert appointment
  INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

  # send to main menu
  if [[ $INSERT_APPOINTMENT_RESULT == 'INSERT 0 1' ]]
  then
      SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
      echo -e "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
  fi
}

MAIN_MENU(){
  if [[ $1 ]]
  then
      echo $1
  fi
  echo -e "\n~~~~~ Day Care Hair Salon ~~~~~\n"

  SERVICES=$($PSQL "SELECT * FROM services ORDER BY service_id")
  echo "$SERVICES" | while read service_id BAR service
  do
    echo "$service_id) $service"
  done
  # ask for service to do
  read SERVICE_ID_SELECTED

  #if input is not a number
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
      # send to main menu
      MAIN_MENU "That is not a valid service number."
  else
      BOOK_APPOINTMENT $SERVICE_ID_SELECTED
  fi
}
MAIN_MENU
