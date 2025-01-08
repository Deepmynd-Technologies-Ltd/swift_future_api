#!/bin/sh

set -o errexit
pip install --no-deps -r requirements.txt || true
python manage.py makemigrations
python manage.py migrate
python manage.py collectstatic --no-input
gunicorn core.wsgi --bind 0.0.0.0:8000
