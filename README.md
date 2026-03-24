# Lab 1 Terraform

This project provisions a virtual machine in Google Cloud Platform using Terraform.

## What the project does

The Terraform configuration creates a Google Compute Engine VM in the project `chas-devsecops-2026`.  
It also applies a daily snapshot backup policy and uses a startup script for basic hardening.

## Files

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

## Security decisions

- No public IP assigned to VM  
- UFW firewall enabled (deny incoming)  
- Fail2ban installed  
- Automatic updates enabled  

## Disaster Recovery

RPO: 24 hours  
RTO: 1 hour  

Daily snapshots are configured using Terraform.

## Backup strategy

Snapshots are taken daily and retained for 7 days.

## CI/CD pipeline

The pipeline performs:

- Terraform format check  
- Terraform validation  
- Security scanning using Trivy  

The pipeline fails if CRITICAL vulnerabilities are found.

## Auto destroy workflow

A manual GitHub Actions workflow is included to destroy infrastructure on demand.

## Conclusion

This project demonstrates:

- Infrastructure as Code with Terraform  
- Secure VM provisioning  
- Backup and recovery strategy  
- CI/CD validation with security scanning  
