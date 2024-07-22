module "exclusive_queue" {
  # update with the module location
  source = "SolaceProducts/queue-endpoint/solacebroker"

  msg_vpn_name  = "default"
  endpoint_type = "queue"
  endpoint_name = "testEQ"

  # permission "consume" enables a messaging client to connect, read and consume messages to/from the queue
  permission = "consume"

  # access_type "exclusive" is the default queue access type. While it has been specified here for clarity, it is not strictly required.
  access_type = "exclusive"

  # ingress and egress are enabled by default in the module, no need to enable here
  # ingress_enabled = true
  # egress_enabled = true
}

output "provisioned_queue" {
  value       = module.exclusive_queue.queue
  description = "The provisioned queue resource"
}
