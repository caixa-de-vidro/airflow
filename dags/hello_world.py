from datetime import datetime, timedelta
from airflow.sdk import DAG
from airflow.decorators import task

with DAG(
    dag_id="hello_world",
    default_args={
        "depends_on_past": False,
        "retries": 2,
        "retry_delay": timedelta(minutes=2)
    },
    description="Hello world",
    start_date=datetime(2026, 6,16),
    end_date=datetime(2026, 6,18),
    schedule="@daily",
    catchup=False,
) as dag:

    @task
    def hello():
        print("Hello")

    @task
    def world():
        print("world")


    hello() >> world()
