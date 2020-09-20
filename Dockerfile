FROM arm32v6/python:rc-alpine
COPY qemu-arm-static /usr/bin

RUN apk update --no-cache && apk add bash

COPY . /app
WORKDIR /app
RUN pip3 install -r requirements.txt 
RUN python3 populate-database.py
CMD [ "python3", "app.py"]