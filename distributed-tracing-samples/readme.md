Contains docker compose and terraform configuration for a simple Distributed Tracing example.

1. cd into /docker
2. docker compose up -d
   - Broker accessible at http://localhost:8080
   - Jaegar accessible at http://localhost:16686
3. On the broker, update the default message vpn to use Internal Database for Basic Authentication
4. Update default client username password to default
5. In main directory run `terraform init` followed by `terraform apply`
   - Gotchas:
     - Appears to be some sort of race condition between profile set up and trace filter configuration. Might need to run apply multiple times to succeed
     - Appears to be a bug with the trace filter subscription, must not include any wildcards upon initialization. Can be updated at a later time to include wildcards if desired
6. Messages published to var.dt_trace_filter_subscription in variables.tf will be traced
