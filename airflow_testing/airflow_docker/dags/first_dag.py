from datetime import timedelta
from airflow.operators.python_operator import PythonOperator
from datetime import datetime
from airflow import DAG


def first_function_execute():
    print("Hello world!")
    return "Hello World"


# you can use cron expression also for schedule_interval
with DAG(
        dag_id="first_dag",
        schedule_interval="@daily",
        default_args={
            "owner": "airflow",
            "retries": 1,
            "retry_delay": timedelta(minutes=5),
            "start_date": datetime(2023, 1, 1)
        },
        catchup=False) as f:
   
    first_function_execute = PythonOperator(
        task_id="execute_first_function",
        python_callable=first_function_execute)



