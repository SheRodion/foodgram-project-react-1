#!/bin/bash

# Collect static files
echo "Collect static files"
python manage.py collectstatic --noinput
# Apply database migrations
echo "Apply database migrations"
sleep 5
python manage.py makemigrations
python manage.py migrate


exec "$@"