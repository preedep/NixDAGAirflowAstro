from airflow import DAG
from airflow.operators.python import PythonOperator
from datetime import datetime, timedelta

# ฟังก์ชันที่เราจะให้ DAG รัน
def say_hello():
    print("Hello, Airflow!")

# ค่า default สำหรับ DAG นี้
default_args = {
    'owner': 'airflow',
    'retries': 1,
    'retry_delay': timedelta(minutes=1),
}
# สร้าง DAG object
with DAG(
    dag_id='hello_world_dag',
    description='A simple Hello World DAG',
    default_args=default_args,
    start_date=datetime(2024, 1, 1),
    schedule_interval='@daily',  # รันทุกวัน
    catchup=False,
    tags=['example', 'hello']
) as dag:

    # สร้าง Task ด้วย PythonOperator
    hello_task = PythonOperator(
        task_id='say_hello',
        python_callable=say_hello
    )

    hello_task