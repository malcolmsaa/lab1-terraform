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

## Security hardening

The VM uses a basic hardening startup script with the following controls:

- UFW enabled
- Default deny incoming traffic
- SSH explicitly allowed
- Fail2ban installed
- Unattended upgrades enabled

### CIS note
This configuration is aligned with core CIS-style hardening principles for a basic Linux VM, especially around host firewalling, brute-force protection, and automated patching.

### Current limitations
A full CIS benchmark audit has not been automated in this lab environment, but the VM includes foundational controls that improve its security posture and move it toward CIS-aligned hardening.
