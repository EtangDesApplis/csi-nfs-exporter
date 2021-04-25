FROM python:3.6-alpine
WORKDIR /app
RUN mkdir /storage
RUN pip install prometheus_client
COPY ./src/main.py /app/main.py
EXPOSE 8000
ENTRYPOINT python -u main.py
