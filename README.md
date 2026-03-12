# Lab 1 Terraform

## Syfte
## Infrastruktur
## Säkerhetsåtgärder
## Backup-strategi
## GitHub Actions
## Filer i projektet
## Kör lokalt
## Outputs
## Reflektion
Detta repo innehåller Terraform-kod för att skapa en VM i GCP för Lab 1.

## Innehåll

- Terraform-konfiguration för Google Cloud
- Ubuntu 22.04 VM
- Startup script för grundläggande hardening
- Daily snapshot policy
- GitHub Actions för validate och plan

## Filer

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `startup.sh`
- `.github/workflows/terraform.yml`

## Variabler

Exempel på `terraform.tfvars`:

```hcl
project_id = "chas-devsecops-2026"
region     = "europe-north1"
student_id = "malcolm"
