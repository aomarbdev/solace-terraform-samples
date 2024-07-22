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

#Queue for Testing
resource "solacebroker_msg_vpn_queue" "testing_queue" {
  msg_vpn_name    = var.msg_vpn_name
  permission      = "consume"
  queue_name      = var.test_queue_name
  egress_enabled  = true
  ingress_enabled = true
}

resource "solacebroker_msg_vpn_queue_subscription" "testing_queue_subscription" {
  msg_vpn_name       = var.msg_vpn_name
  queue_name         = solacebroker_msg_vpn_queue.testing_queue.queue_name
  subscription_topic = var.dt_trace_filter_subscription
}

# Collector and Telemetry Set up
resource "solacebroker_msg_vpn_telemetry_profile" "trace_telemetry_profile_1" {
  msg_vpn_name                                      = var.msg_vpn_name
  receiver_acl_connect_default_action               = "allow"
  receiver_enabled                                  = true
  receiver_max_connection_count_per_client_username = 1000
  telemetry_profile_name                            = var.dt_telemetry_profile_name
  trace_enabled                                     = true

}

resource "solacebroker_msg_vpn_client_username" "trace_client_username_1" {
  acl_profile_name    = var.dt_collector_acl_profile_name
  client_profile_name = var.dt_collector_client_profile_name
  client_username     = var.dt_collector_client_username
  enabled             = true
  msg_vpn_name        = var.msg_vpn_name
  password            = var.dt_collector_client_password

  depends_on = [solacebroker_msg_vpn_telemetry_profile.trace_telemetry_profile_1]

}

resource "solacebroker_msg_vpn_client_username" "default_username_password" {
  acl_profile_name    = "default"
  client_profile_name = "default"
  client_username     = "default"
  enabled             = true
  msg_vpn_name        = var.msg_vpn_name
  password            = "default"
}

resource "solacebroker_msg_vpn_telemetry_profile_trace_filter" "trace_filter_1" {
  enabled                = true
  msg_vpn_name           = var.msg_vpn_name
  telemetry_profile_name = solacebroker_msg_vpn_telemetry_profile.trace_telemetry_profile_1.telemetry_profile_name
  trace_filter_name      = var.dt_trace_filter_name

}

resource "solacebroker_msg_vpn_telemetry_profile_trace_filter_subscription" "trace_filter_subscription_1" {
  msg_vpn_name           = var.msg_vpn_name
  subscription           = var.dt_trace_filter_subscription
  subscription_syntax    = "smf"
  telemetry_profile_name = solacebroker_msg_vpn_telemetry_profile.trace_telemetry_profile_1.telemetry_profile_name
  trace_filter_name      = solacebroker_msg_vpn_telemetry_profile_trace_filter.trace_filter_1.trace_filter_name
}
