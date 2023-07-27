ARG PYTHON_VERSION=3.11-slim-buster

FROM python:${PYTHON_VERSION}

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN mkdir -p /code

RUN apt-get update \
    && apt-get install -y libpq-dev gcc

WORKDIR /code

COPY requirements.txt /tmp/requirements.txt
RUN set -ex && \
    pip install --upgrade pip && \
    pip install -r /tmp/requirements.txt && \
    rm -rf /root/.cache/
COPY . /code

ENV SECRET_KEY "W95jsMoAbCJ2U896PcjoaSQtC5lbYDNZCH2x4hpttQLp0DXAlY"
ENV DEBUG "False"
ENV EMAIL_HOST_PASSWORD "edmzkqbidkmrdylk"
RUN python manage.py collectstatic --noinput

EXPOSE 8000

CMD ["gunicorn", "--bind", ":8000", "--workers", "2", "django_project.wsgi"]
