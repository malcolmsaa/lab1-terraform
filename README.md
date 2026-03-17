# Lab 1 Terraform

## Innehåll

- main.tf, main Terraform configuration  
- variables.tf, input variables  
- outputs.tf, Terraform outputs  
- startup.sh, startup hardening script  
- .github/workflows/terraform.yml, CI pipeline  

## How to run

```bash
terraform init
terraform validate
terraform plan
terraform apply
```

## Screenshots

### GitHub Actions pipeline
![Pipeline](screenshots/pipeline.png)

### VM i GCP
![VM](screenshots/vm.png)
terraform apply
