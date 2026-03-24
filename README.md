# Lab 1 Terraform

This project provisions and secures a virtual machine in Google Cloud Platform using Terraform, with integrated CI/CD validation and security scanning.

## Project overview

The solution creates a Google Compute Engine VM using Infrastructure as Code.  
It applies baseline hardening, automated backups, and validation through a CI pipeline.

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

- `main.tf` - main Terraform configuration
- `variables.tf` - input variables
- `outputs.tf` - Terraform outputs
- `startup.sh` - VM hardening script
- `.github/workflows/terraform.yml` - CI pipeline
- `.github/workflows/destroy.yml` - destroy workflow

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

## Security hardening

The VM uses a basic hardening startup script with the following controls:

- UFW enabled
- Default deny incoming traffic
- SSH explicitly allowed
- Fail2ban installed
- Unattended upgrades enabled

## Security decisions

- UFW reduces exposed attack surface
- Fail2ban reduces brute-force attempts
- Unattended upgrades improve patch hygiene
- Daily snapshots improve recoverability
- CI pipeline validates Terraform before deployment

## CIS alignment

The configuration aligns with key CIS principles:

- Host-based firewall enforcement
- Principle of least exposure
- Patch management enabled
- Basic intrusion protection

### Limitation

A full CIS benchmark scan is not automated in this lab environment.  
However, the implemented controls improve the system toward a more CIS-aligned posture.

## Disaster Recovery

RPO: 24 hours  
RTO: 1 hour  

The infrastructure uses daily snapshots to ensure recovery in case of failure.

## Backup and recovery

### Backup strategy
A daily snapshot policy is applied using Terraform.

- Frequency: once per day
- Retention: 7 days

## CI/CD pipeline

The GitHub Actions pipeline performs:

- Terraform format validation
- Terraform configuration validation
- Security scanning using Trivy

The pipeline is configured to fail if CRITICAL or HIGH issues are found.

## Auto destroy workflow

A manual GitHub Actions workflow is included:

- Triggered on demand
- Executes `terraform destroy`
- Ensures controlled teardown of infrastructure

This supports:

- Cost control
- Environment cleanup
- Safe lifecycle management

## Remote state note

Terraform remote state in Google Cloud Storage was planned as a VG improvement.

Implementation is currently blocked due to missing permissions for creating Cloud Storage buckets in the provided GCP project.

## Conclusion

This project demonstrates:

- Infrastructure as Code with Terraform
- Secure VM provisioning
- Backup and recovery strategy
- CI/CD validation with security scanning
- Controlled infrastructure lifecycle
- Basic DevSecOps practices

## Security hardening (CIS inspired)

This VM is hardened based on common CIS Linux principles:

- Root login disabled
- Password authentication disabled (SSH keys only)
- UFW firewall enabled (deny incoming by default)
- Fail2ban installed and active
- Automatic security updates enabled
- Unnecessary services disabled
- Kernel protections enabled (rp_filter, kptr_restrict, dmesg_restrict)

Result:
- Reduced attack surface
- Protection against brute force attacks
- Secure default configuration

---

## DevSecOps pipeline

The pipeline enforces security:

- terraform fmt check
- terraform validate
- Trivy security scan

The pipeline fails if HIGH or CRITICAL vulnerabilities are found.

---

## Disaster Recovery (RPO / RTO)

- RPO: 24 hours (daily snapshots)
- RTO: ~15 minutes (restore from snapshot)

Snapshots are managed via Terraform resource policy.

---

## Network security decision

- No public IP assigned to VM
- Access is restricted to internal network
- SSH access controlled via firewall rules

This eliminates exposure to the public internet.

## Security decisions

- Removed public IP from VM
- UFW firewall enabled (deny incoming)
- Fail2ban installed for brute-force protection
- Automatic security updates enabled
