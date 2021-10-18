FROM python:3.8-slim

WORKDIR /app

COPY ./requirements.txt .

RUN pip3 install --upgrade pip

RUN pip install --upgrade pip setuptools wheel python-dotenv
RUN pip3 install -r requirements.txt

COPY . .

ENTRYPOINT ["./docker-entrypoint.sh"]

#COPY ../static/redoc.yaml /static/

CMD gunicorn backend.wsgi:application --bind 0.0.0.0:8000