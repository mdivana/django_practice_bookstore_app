FROM python:3.11.4-slim-bullseye

ENV PIP_DISABLE_PIP_VERSION_CHECK 1
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN apt-get update && apt-get install -y build-essential libpq-dev

WORKDIR /django_projects

COPY ./requirements.txt .
RUN pip install -r requirements.txt

COPY . .