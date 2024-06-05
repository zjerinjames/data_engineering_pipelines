# Kafka and Zookeeper Setup Workflow

# View and edit the Docker Compose file
vi docker-compose_kafka_wurstmeister.yml

# Start Kafka and Zookeeper containers
docker compose -f docker-compose_kafka_wurstmeister.yml up -d

# Check running containers
docker ps

# Create a Kafka topic named 'my-topic' in the Kafka container
docker exec -it <kafka-container-id> /opt/kafka/bin/kafka-topics.sh --create --zookeeper zookeeper:2181 --replication-factor 1 --partitions 1 --topic my-topic

# Replace <kafka-container-id> with the actual ID of your Kafka container

# List all topics in the Kafka cluster using kafka-topics.sh script
docker exec -it b5658f23d9eb /opt/kafka/bin/kafka-topics.sh --list --bootstrap-server localhost:9092

# Start a Kafka producer in the Kafka container
docker exec -it <kafka-container-id> /opt/kafka/bin/kafka-console-producer.sh --broker-list localhost:9092 --topic my-topic

# Start a Kafka consumer in the Kafka container to consume messages from 'my-topic'
docker exec -it <kafka-container-id> /opt/kafka/bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic my-topic --from-beginning

# Stop and remove the Kafka and Zookeeper containers
docker compose -f docker-compose_kafka_wurstmeister.yml down
