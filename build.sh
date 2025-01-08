#!/bin/sh

set -o errexit
apt-get update 
apt-get install -y libsystemd-dev pkg-config build-essential
pip install -r requirements.txt
python manage.py makemigrations
python manage.py migrate
python manage.py collectstatic --no-input
gunicorn core.wsgi --bind 0.0.0.0:8000
