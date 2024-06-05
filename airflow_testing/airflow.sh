conda env list
   34  conda create -n airflow_env python=3.8
   35  conda activate airflow_env
   36  pip install apache-airflow
   37  airflow db init
   38  airflow webserver --port 8080

   conda env list
 1016  conda activate airflow_env
 1017  airflow scheduler
 1018  conda list airflow
 1019  # create an admin user
 1020  airflow users create     --username admin     --firstname Peter     --lastname Parker     --role Admin     --email spiderman@superhero.org
 1021  airflow scheduler
 1022  airflow dags trigger -r hello_world
 1023  airflow scheduler


# Setting up Apache Airflow Environment with Conda

# Create a new Conda environment named airflow_env with Python 3.8
conda create -n airflow_env python=3.8

# Activate the newly created Conda environment
conda activate airflow_env

# Install Apache Airflow using pip within the Conda environment
pip install apache-airflow

# Initialize the Airflow metadata database
airflow db init

# Start the Airflow web server on port 8080
airflow webserver --port 8080

## ANOTHER TERMINAL
# Activate the airflow_env Conda environment (if not already activated)
conda activate airflow_env

# Start the Airflow scheduler (ensure it's running in a separate terminal or background process)
airflow scheduler


# Create an admin user for Apache Airflow
airflow users create \
    --username admin \
    --firstname Peter \
    --lastname Parker \
    --role Admin \
    --email spiderman@superhero.org

# Start the Airflow scheduler (ensure it's running in a separate terminal or background process)
airflow scheduler

# To manually trigger
# Trigger a DAG run for the hello_world DAG
airflow dags trigger -r hello_world

credentials:
-admin
-root