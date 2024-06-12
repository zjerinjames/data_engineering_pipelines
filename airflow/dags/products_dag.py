# dag.py
from airflow import DAG
from airflow.operators.bash import BashOperator
import os
path = os.environ['AIRFLOW_HOME']

from datetime import timedelta, datetime

default_args = {
                'owner': 'your_user',
                'depends_on_past': False,
                'email': ['your@email.com'],
                'email_on_failure': False,
                'email_on_retry': False,
                'retries': 2,
                'retry_delay': timedelta(minutes=1)
                }

# Define the DAG, its ID and when should it run.
dag = DAG(
            dag_id='products_dag',
            start_date=datetime(year=2023, month=12, day=11, hour=10),
            schedule_interval="30 */12 * * *",
            default_args=default_args,
            catchup=False
            )

# Define the task 1 (collect the data) id. Run the bash command because the task is in a .py file.
task1 = BashOperator(
                        task_id='get_data',
                        bash_command=f'python {path}/dags/src/get_data.py --num_pages=1',
                        dag=dag
                    )

# Define Task 2 (insert the data into the database)
task2 = BashOperator(
                     task_id='insert_data',
                     bash_command=f'python {path}/dags/src/insert_data.py'
                    )

task1 >> task2