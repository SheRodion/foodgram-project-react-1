FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt .

RUN pip3 install -r requirements.txt

COPY . .

ENTRYPOINT ["./docker-entrypoint.sh"]

#COPY ../static/redoc.yaml /static/

CMD gunicorn backend.wsgi:application --bind 0.0.0.0:8000