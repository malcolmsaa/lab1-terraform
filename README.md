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

## Säkerhetsbeslut

Följande säkerhetsåtgärder används i projektet:

- UFW brandvägg aktiveras
- all inkommande trafik blockeras som standard
- endast SSH tillåts
- root login via SSH stängs av
- lösenordsinloggning via SSH stängs av
- fail2ban skyddar mot brute force-försök
- unattended-upgrades installerar säkerhetsuppdateringar automatiskt

## Disaster Recovery

Projektet använder en daglig snapshot policy i GCP.

- backup körs varje dag
- snapshots sparas i 7 dagar
- on_source_disk_delete = KEEP_AUTO_SNAPSHOTS

### RPO
24 timmar

### RTO
1 timme

### Recovery-förslag
1. identifiera senaste fungerande snapshot
2. skapa ny disk från snapshot
3. koppla disken till en ny eller återställd VM
4. verifiera SSH och systemloggar
5. validera att tjänsten fungerar igen

## Status

Terraform-konfigurationen validerar korrekt lokalt och i GitHub Actions.

GitHub Actions passerar:
- lint
- security
- validate

Deployment till GCP är för närvarande blockerad av IAM-behörigheter i kursprojektet.
