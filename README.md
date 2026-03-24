# Lab 1 Terraform

This project provisions a virtual machine in Google Cloud Platform using Terraform.

## What the project does

The Terraform configuration creates a Google Compute Engine VM in the project `chas-devsecops-2026`.

It also applies a daily snapshot backup policy and uses a startup script for basic hardening.

The goal is to demonstrate core DevSecOps principles:

- Infrastructure as Code
- Security by default
- Automated validation
- Recoverability
- Controlled lifecycle management

## Architecture

- Google Compute Engine VM
- Terraform-managed infrastructure
- Daily snapshot backup policy
- GitHub Actions CI pipeline
- Manual destroy workflow

## Files

- `main.tf`, main Terraform configuration
- `variables.tf`, input variables
- `outputs.tf`, Terraform outputs
- `startup.sh`, VM hardening script
- `.github/workflows/terraform.yml`, CI pipeline
- `.github/workflows/destroy.yml`, destroy workflow

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
- UFW firewall enabled with deny incoming by default
- Fail2ban installed for brute force protection
- Automatic updates enabled

## Security hardening

The VM uses a startup script with the following controls:

- Root login disabled
- Password authentication disabled
- UFW enabled
- Fail2ban enabled
- Automatic security updates enabled
- Basic kernel hardening applied

## CIS style hardening

The configuration follows common CIS style hardening principles:

- Least exposure
- Secure SSH configuration
- Host based firewall
- Patch management
- Brute force protection

## Disaster Recovery

RPO: 24 hours  
RTO: 1 hour  

Daily snapshots are configured using Terraform.

## Backup strategy

Snapshots are taken daily and retained for 7 days.

## CI/CD pipeline

The GitHub Actions pipeline performs:

- Terraform format check
- Terraform validation
- Trivy configuration scan

The pipeline fails if vulnerabilities are detected by Trivy.

## Auto destroy workflow

A GitHub Actions workflow is included to destroy infrastructure manually.

## Conclusion

This project demonstrates:

- Infrastructure as Code with Terraform
- Secure VM provisioning
- Backup and recovery strategy
- CI/CD validation with security scanning
- Controlled infrastructure lifecycle
