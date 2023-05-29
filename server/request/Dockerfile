FROM python:3.11

COPY ./app.py /app/app.py
COPY ./static /app/static
COPY ./templates /app/templates

RUN pip3 install flask flask-cors

WORKDIR /app

CMD ["python3", "app.py"]
