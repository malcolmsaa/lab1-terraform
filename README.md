# Lab 1, Terraform + GCP VM

## Syfte

Detta projekt använder Terraform för att skapa en Linux VM i Google Cloud Platform. Projektet visar Infrastructure as Code, grundläggande hardening, snapshot backup policy och en GitHub Actions pipeline för lint, security scan och validate.

## Innehåll

Projektet innehåller:

- Terraform-konfiguration för en Ubuntu VM i GCP
- Startup script för grundläggande hardening
- Daglig snapshot backup policy
- GitHub Actions pipeline
- Trivy security scan av Terraform-konfigurationen

## Filer

- `main.tf` , huvudresurser för VM och backup policy
- `variables.tf` , variabler
- `outputs.tf` , outputs från Terraform
- `startup.sh` , startup script med hardening
- `.github/workflows/terraform.yml` , CI pipeline

## Hur man kör projektet

Initiera Terraform:

```bash
terraform init
