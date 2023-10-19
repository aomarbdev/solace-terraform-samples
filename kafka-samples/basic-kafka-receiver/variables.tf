variable "username" {
  type    = string
  default = "admin"
}

variable "password" {
  type    = string
  default = "admin"
}

variable "url" {
  type    = string
  default = "http://localhost:8080"
}

variable "msg_vpn_name" {
  type    = string
  default = "default"
}

variable "kafka_receiver_name" {
  type    = string
  default = "kafka-receiver-1"
}

variable "kafka_receiver_bootstrap_address_list" {
  type    = string
  default = "kafka-1:9092,kafka-2:9092"
}

variable "kafka_receiver_topic_binding_topic_name" {
  type    = string
  default = "topic.2"
}

variable "kafka_receiver_topic_binding_initial_offset" {
  type    = string
  default = "end"
}

variable "kafka_receiver_topic_binding_local_topic" {
  type    = string
  default = "kafka/received/$${kafkaTopic()}"
}

variable "queue_name" {
  type    = string
  default = "kafka.receiver.queue"
}

variable "queue_q_kafka_message_topic_subscription" {
  type    = string
  default = "kafka/received/>"
}
