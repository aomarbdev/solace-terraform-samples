# solace-terraform-samples

Samples for basic Solace + Distributed Tracing and Solace + Integrated Kafka Bridge functionality

1. distributed-tracing-samples includes docker compose project for simple Solace Software Broker, OpenTelemetry Colelctor, and Jaegar. Terraform creates Telemetery profiles, otel collector username, and test queue
2. kafka-samples includes docker compose project for simple Solace Software Broker and Kafka cluster with 2 brokers. Separate folders exist for setting up a kafka sender and a kafka receiver. 
