import time

from celery import shared_task


@shared_task
def create_task(task_type):

    print(f"Starting task")
    time.sleep(int(task_type) * 10)
    return True
