# Solace Terraform Modules
Learn more about the Solace Terraform Modules in this [codelab](https://codelabs.solace.dev/codelabs/terraform-modules)  

## The following environment variables are required 

| Env variable name  | Required/Optional | Description | Default |
| ------------- | ------------- | ------------- | ------------- |
| `TF_VAR_solace_url`  | Required  | Solace Broker URL | NA |
| `TF_VAR_semp_username`  | Required  | Solace Broker SEMP username | NA |
| `TF_VAR_semp_password`  | Required  | Solace Broker SEMP password | NA |
| `SOL_MSG_VPN`  | Required  | Solace Broker message VPN | terraform |