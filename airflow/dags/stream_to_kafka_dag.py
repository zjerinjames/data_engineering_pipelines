from datetime import timedelta, datetime
from airflow.operators.python_operator import PythonOperator
from airflow import DAG
from stream_to_kafka import start_streaming

default_args = {
    'owner': 'airflow',
    'start_date': datetime(2023, 1, 1),
    'retries': 1,
    'retry_delay': timedelta(seconds=5)
}

# you can use cron expression also for schedule_interval
with DAG(
        dag_id="randomnames",
        schedule_interval='0 1 * * *',
        default_args=default_args,
        catchup=False) as dag:
   
    data_stream_task = PythonOperator(
        task_id="kafka_data_stream",
        python_callable=start_streaming,
        dag=dag)

    data_stream_task

