# file: dags/hello_world.py

from airflow.sdk import DAG
from airflow.providers.standard.operators.python import PythonOperator
from datetime import datetime

def say_hello():
    print("Hello, Airflow! 🎉")

with DAG(
    dag_id="hello_world_dag",
    description="A simple Hello World DAG compatible with Airflow 3.x",
    start_date=datetime(2024, 1, 1),
    schedule="@daily",      # ✅ ใช้ schedule= แทน schedule_interval
    catchup=False,          # ไม่ทำ backfill ย้อนหลัง
    tags=["example", "hello"],
) as dag:

    hello_task = PythonOperator(
        task_id="say_hello",
        python_callable=say_hello,
    )

    hello_task