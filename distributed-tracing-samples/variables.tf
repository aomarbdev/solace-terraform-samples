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

variable "test_queue_name" {
  type    = string
  default = "q1"
}

variable "dt_collector_acl_profile_name" {
  type    = string
  default = "#telemetry-trace"
}

variable "dt_collector_client_profile_name" {
  type    = string
  default = "#telemetry-trace"
}

variable "dt_collector_client_username" {
  type    = string
  default = "trace"
}

variable "dt_collector_client_password" {
  type    = string
  default = "trace"
}

variable "dt_telemetry_profile_name" {
  type    = string
  default = "trace"
}

variable "dt_trace_filter_name" {
  type    = string
  default = "trace"
}

# 20231019 unable to initialize filter with wildcard, need to initialize and then update to include wildcard
variable "dt_trace_filter_subscription" {
  type    = string
  default = "test/>"
}
