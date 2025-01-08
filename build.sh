#!/bin/sh

set -o errexit
# Redirect APT cache to a temporary directory
export APT_CACHE_DIR=$(mktemp -d)
mkdir -p "$APT_CACHE_DIR/apt/lists/partial"
ln -sfT "$APT_CACHE_DIR/apt" /var/lib/apt

# Update and install required system packages
apt-get update
apt-get install -y libsystemd-dev pkg-config build-essential
pip install --only-binary :all: -r requirements.txt
python manage.py makemigrations
python manage.py migrate
python manage.py collectstatic --no-input
gunicorn core.wsgi --bind 0.0.0.0:8000
