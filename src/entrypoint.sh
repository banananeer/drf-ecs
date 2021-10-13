#!/bin/sh

python manage.py migrate
echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.create_superuser('admin1', 'admin@myproject.com', 'passwordxyz')" | python manage.py shell

exec "$@"