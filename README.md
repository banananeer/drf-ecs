## Description
Example repo showing how you can deploy a celery application with an 
api, worker and scheduler to ECS using Fargate and Django as the web framework.

The infrastructure layout can be used with any of the following 
languages as they all have their own implementation of celery.

The commands for the task definitions will be different.

- python
- rust
- golang
- nodejs

## To Do

These are things to add to this example in no particular order of importance.

- Use encryption on redis cluster
- Add unit tests with pytest
- Add github workflow for running unit tests
- Fix logging to cloudwatch