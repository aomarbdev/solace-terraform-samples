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

resource "solacebroker_msg_vpn_kafka_receiver" "kafka_receiver_1" {
  enabled                = true
  kafka_receiver_name    = var.kafka_receiver_name
  msg_vpn_name           = var.msg_vpn_name
  transport_tls_enabled  = false
  authentication_scheme  = "none"
  bootstrap_address_list = var.kafka_receiver_bootstrap_address_list
}

resource "solacebroker_msg_vpn_kafka_receiver_topic_binding" "kafka_receiver_topic_binding_1" {
  enabled             = true
  kafka_receiver_name = solacebroker_msg_vpn_kafka_receiver.kafka_receiver_1.kafka_receiver_name
  msg_vpn_name        = solacebroker_msg_vpn_kafka_receiver.kafka_receiver_1.msg_vpn_name
  topic_name          = var.kafka_receiver_topic_binding_topic_name
  initial_offset      = var.kafka_receiver_topic_binding_initial_offset
  local_topic         = var.kafka_receiver_topic_binding_local_topic
}

resource "solacebroker_msg_vpn_queue" "queue_1" {
  egress_enabled  = true
  ingress_enabled = true
  msg_vpn_name    = var.msg_vpn_name
  permission      = "consume"
  queue_name      = var.queue_name
}

resource "solacebroker_msg_vpn_queue_subscription" "queue_1_subscription" {
  msg_vpn_name       = solacebroker_msg_vpn_queue.queue_1.msg_vpn_name
  queue_name         = solacebroker_msg_vpn_queue.queue_1.queue_name
  subscription_topic = var.queue_q_kafka_message_topic_subscription
}


