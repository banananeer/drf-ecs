# gunicorn config

bind = ["0.0.0.0:8000"]
workers = 1
timeout = 60
graceful_timeout = 60
proc_name = "demo_django_app"
accesslog = "-"
errorlog = "-"
