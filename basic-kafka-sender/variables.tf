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
  default = "vpn4"
}

variable "kafka_sender_name" {
  type    = string
  default = "kafka-sender"
}

variable "kafka_sender_bootstrap_address_list" {
  type    = string
  default = "kafka-1:9092,kafka-2:9092"
}

variable "kafka_sender_queue_name" {
  type    = string
  default = "kafka.sender.queue"
}

variable "kafka_sender_queue_binding_remote_topic" {
  type    = string
  default = "topic.1"
}

variable "kafka_sender_queue_binding_remote_key" {
  type    = string
  default = "$${topic()}"
}

variable "kafka_sender_queue_topic_subscription" {
  type    = string
  default = "kafka/>"

}


