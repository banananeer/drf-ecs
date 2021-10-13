from celery.result import AsyncResult
from rest_framework.decorators import api_view
from rest_framework.response import Response

from demo_task_app.tasks import create_task

import logging

logger = logging.getLogger()


@api_view(["POST"])
def run_task(request):
    logger.info(request)
    logger.info(request.data)
    if request.data:
        task_type = request.data.get("type")
        task = create_task.delay(int(task_type))
        return Response({"task_id": task.id}, status=202)
    else:
        return Response({"error": "invalid method"})


@api_view(["GET"])
def get_status(request, task_id):
    task_result = AsyncResult(task_id)
    result = {
        "task_id": task_id,
        "task_status": task_result.status,
        "task_result": task_result.result
    }
    return Response(result, status=200)
