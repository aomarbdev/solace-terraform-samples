terraform {
  required_providers {
    solacebroker = {
      source = "registry.terraform.io/solaceproducts/solacebroker"
    }
  }
}

provider "solacebroker" {
  username = var.username
  password = var.password
  url      = var.url
}

resource "solacebroker_msg_vpn_kafka_sender" "kafka_sender_1" {
  bootstrap_address_list = var.kafka_sender_bootstrap_address_list
  enabled                = true
  idempotence_enabled    = true
  kafka_sender_name      = var.kafka_sender_name
  msg_vpn_name           = var.msg_vpn_name
  authentication_scheme  = "none"
  transport_tls_enabled  = false

}

resource "solacebroker_msg_vpn_queue" "kafka_sender_queue_1" {
  egress_enabled  = true
  ingress_enabled = true
  msg_vpn_name    = solacebroker_msg_vpn_kafka_sender.kafka_sender_1.msg_vpn_name
  permission      = "consume"
  queue_name      = var.kafka_sender_queue_name
}

resource "solacebroker_msg_vpn_kafka_sender_queue_binding" "kafka_sender_queue_binding_1" {
  enabled           = true
  kafka_sender_name = solacebroker_msg_vpn_kafka_sender.kafka_sender_1.kafka_sender_name
  msg_vpn_name      = solacebroker_msg_vpn_kafka_sender.kafka_sender_1.msg_vpn_name
  queue_name        = solacebroker_msg_vpn_queue.kafka_sender_queue_1.queue_name
  remote_topic      = var.kafka_sender_queue_binding_remote_topic
  remote_key        = var.kafka_sender_queue_binding_remote_key
}

resource "solacebroker_msg_vpn_queue_subscription" "mq_kafka_sender_queue_1_subscription" {
  msg_vpn_name       = solacebroker_msg_vpn_queue.kafka_sender_queue_1.msg_vpn_name
  queue_name         = solacebroker_msg_vpn_queue.kafka_sender_queue_1.queue_name
  subscription_topic = var.kafka_sender_queue_topic_subscription

}
