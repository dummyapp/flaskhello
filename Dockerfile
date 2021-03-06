FROM python:3.7-alpine AS builder

WORKDIR /app

COPY hello.py /app
RUN python -m compileall -b .


FROM python:3.7-alpine

WORKDIR /app

COPY requirements.txt /app
RUN pip install -r requirements.txt

COPY --from=builder /app/hello.pyc .

ENV FLASK_APP hello
ENV FLASK_RUN_HOST 0.0.0.0
ENV FLASK_ENV development

ENTRYPOINT ["flask", "run"]
