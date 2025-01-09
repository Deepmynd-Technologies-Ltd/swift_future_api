#!/bin/sh

set -o errexit
python manage.py makemigrations
python manage.py migrate
python manage.py collectstatic --no-input
gunicorn core.wsgi --bind 0.0.0.0:8000


if [[$CREATE_SUPERUSER]];
then
    echo "Creating superuser"
    python manage.py createsuperuser --no-input
fi
