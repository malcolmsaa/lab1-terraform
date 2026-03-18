# Lab 1 Terraform

This project provisions and secures a virtual machine in Google Cloud Platform using Terraform, with integrated CI/CD validation and security scanning.

---

## Project overview

The solution creates a Google Compute Engine VM using Infrastructure as Code.  
It applies baseline hardening, automated backups, and validation through a CI pipeline.

The goal is to demonstrate core DevSecOps principles:

- Infrastructure as Code  
- Security by default  
- Automated validation  
- Recoverability  
- Controlled lifecycle management  

---

## Architecture

- Google Compute Engine VM  
- Terraform-managed infrastructure  
- Daily snapshot backup policy  
- GitHub Actions CI pipeline  
- Manual destroy workflow  

---

## Files

- `main.tf` – main Terraform configuration  
- `variables.tf` – input variables  
- `outputs.tf` – Terraform outputs  
- `startup.sh` – VM hardening script  
- `.github/workflows/terraform.yml` – CI pipeline  
- `.github/workflows/destroy.yml` – destroy workflow  

---

## How to run

```bash
terraform init
terraform validate
terraform plan
terraform apply
