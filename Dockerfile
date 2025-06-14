FROM quay.io/astronomer/astro-runtime:10.0.0

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .
WORKDIR /usr/local/airflow