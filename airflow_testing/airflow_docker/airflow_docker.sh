#!/bin/bash

# Step 1: Create Necessary Directories

# Create a directory for Dockerfiles
mkdir dockerfiles

# Create a directory for DAGs (Directed Acyclic Graphs)
mkdir dags

# Step 2: Create and Edit Docker Compose File

# Create and open the docker-compose.yml file in the editor
vi docker-compose.yml

# Step 3: Check Docker Compose Status

# Check the status of Docker Compose services
docker compose ps

# Step 4: Build and Start Docker Compose Services

# Build and start Docker Compose services
docker compose up --build -d

# Step 5: Create and Edit First DAG

# Create and open the first DAG Python file in the editor
vi first_dag.py
