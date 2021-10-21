#!/bin/bash

# Section to future implement waitng db coonection
#set -e
#
#host="db"
#port="5432"
#
#>&2 echo "!!!!!!!! Check conteiner_a for available !!!!!!!!"
#
#until curl -s "$host":"$port"; do
#  >&2 echo "Postgre is unavailable - sleeping"
#  sleep 1
#done
#
#>&2 echo "Postgre is up - executing command"

# Collect static files
echo "Collect static files"
python manage.py collectstatic --noinput
sleep 5
# Apply database migrations
echo "Apply database migrations"
python manage.py makemigrations
python manage.py migrate


exec "$@"