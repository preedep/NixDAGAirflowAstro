FROM quay.io/astronomer/astro-runtime:latest

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .
WORKDIR /usr/local/airflow