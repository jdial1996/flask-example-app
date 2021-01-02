FROM python:3.8

MAINTAINER jdial1996

COPY . /app

WORKDIR /app/

RUN pip install -r requirements.txt

ENTRYPOINT ["python"]

CMD ["app.py"]
