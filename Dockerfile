# Dockerfile for microservice test server

# run as:
# docker run -d --rm -p 5000:5000 microtest

FROM python:3.7-alpine

RUN mkdir /app

COPY microtest.py /app

WORKDIR /app

CMD [ "python", "./microtest.py" ]
