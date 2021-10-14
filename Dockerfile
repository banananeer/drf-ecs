# pull official base image
FROM python:3.9.7 as BASE
ENV VIRTUAL_ENV=/venv \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    POETRY_VERSION=1.1.8

COPY poetry.lock pyproject.toml ./

RUN pip install "poetry==$POETRY_VERSION"
RUN python3 -m venv $VIRTUAL_ENV

ENV PATH="$VIRTUAL_ENV/bin:$PATH"

RUN poetry install --no-interaction --no-ansi --no-dev

FROM python:3.9.7-slim-buster
ENV VIRTUAL_ENV=/venv \
    PYTHONUNBUFFERED=1

COPY --from=BASE /venv /venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# set work directory
WORKDIR /usr/src/app

# install psycopg2 dependencies
RUN apt-get update \
  && apt-get -y install gcc postgresql \
  && apt-get clean

# copy project
COPY src /usr/src/app/

# run entrypoint.sh
ENTRYPOINT ["/usr/src/app/entrypoint.sh"]
