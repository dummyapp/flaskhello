FROM python:3.7-alpine

WORKDIR /app

ENV FLASK_APP hello.py
ENV FLASK_RUN_HOST 0.0.0.0

COPY requirements.txt /app
RUN pip install -r requirements.txt

COPY hello.py /app

EXPOSE 5000

ENTRYPOINT ["flask", "run"]
