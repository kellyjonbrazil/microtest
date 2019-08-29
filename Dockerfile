# Dockerfile for microservice test server

# run as:
# docker run -d --rm -p 8080:8080 kellybrazil/microtest

FROM python:3.7-alpine

RUN mkdir /app

COPY microtest.py /app

WORKDIR /app

CMD [ "python", "-u", "./microtest.py" ]
