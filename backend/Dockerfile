FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt .

RUN apt-get update && apt-get install build-essential -y
RUN pip3 install -r requirements.txt

COPY . .
ENTRYPOINT ["./docker-entrypoint.sh"]

CMD gunicorn backend.wsgi:application --bind 0.0.0.0:8000