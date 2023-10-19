Contains docker-compose file and terraform configuration to create simple local PubSub+ <-> Kafka Bridges

# Docker Container Setup

Creates a Single Solace PubSub+ Event Broker and a cluster of two Kafka brokers (with zookeeper)

1. docker compose up -d

## Kafka Sender Set up

1. cd into the kafka sender directory
2. `terraform init`
3. `terraform apply`
   Create kafka sender, queue with topic subscription kafka/>, will attempt to send messages to topic.1 on the Kafka brokers
4. Log into the primary Kafka broker container
5. Create the topic `kafka-topics --create --bootstrap-server kafka-1:9092 --replication-factor 2 --partitions 1 --topic topic.1`
6. Read from the topic `kafka-console-consumer --bootstrap-server kafka-1:9092 --topic topic.1 --from-beginning`

## Kafka Receiver Set up

1. cd into the basic-kafka-receiver directory
2. `terraform init`
3. `terraform apply`
   - Creates a kafka receiver, queue with topic subscription kafka/received/>.
   - Kafka receiver receives messages from kafka topic 'topic.2'
   - Maps the Kafka messages to `kafka/received/${kafkaTopic()}`
   - Messages are received by the kafka.receiver.queue queue on the Solace Broker
4. Log into the primary Kafka broker container
5. Create the topic `kafka-topics --create --bootstrap-server kafka-1:9092 --replication-factor 2 --partitions 1 --topic topic.2`
6. Add messages to the topic `kafka-console-producer --bootstrap-server kafka-1:9092 --topic topic.2`
   - Enter each message on a new line
