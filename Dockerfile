FROM python:3.10-slim

WORKDIR /mlflow

RUN apt-get update && \
    apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

RUN pip install mlflow psycopg2-binary

EXPOSE 5000

CMD mlflow server \
    --backend-store-uri sqlite:///mlflow.db \
    --default-artifact-root /mlflow/artifacts \
    --host 0.0.0.0 \
    --port 5000