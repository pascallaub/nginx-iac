# Nginx Infrastructure as Code mit Terraform

Dieses Projekt erstellt eine Nginx-Container-Infrastruktur mit Terraform und Docker.

## Übersicht

Das Projekt nutzt Terraform, um einen Nginx-Container auf Port 8001 zu deployen. Es demonstriert verschiedene Terraform-Konzepte:

- **Provider**: Kreuzwerker Docker Provider
- **Module**: Wiederverwendbare Nginx-Container-Konfiguration
- **Variables**: Konfigurierbare Parameter
- **Outputs**: Wichtige Infrastrukturdaten
- **Locals**: Interne Werte und Berechnungen

## Projekt-Struktur

```
nginx-iac/
├── main.tf                    # Haupt-Terraform-Konfiguration
├── variables.tf               # Input-Variablen
├── outputs.tf                 # Output-Definitionen
├── locals.tf                  # Lokale Werte
├── modules/
│   └── nginx_container/
│       ├── main.tf           # Container-Ressourcen
│       ├── variables.tf      # Modul-Variablen
│       └── outputs.tf        # Modul-Outputs
├── screenshots/              # Dokumentations-Screenshots
├── .gitignore                # Git-Ignore-Regeln
└── README.md                 # Diese Datei
```

## Voraussetzungen

- [Terraform](https://www.terraform.io/downloads) >= 1.0
- [Docker Desktop](https://www.docker.com/products/docker-desktop) (läuft)
- Git für Versionskontrolle

## Schnellstart

### 1. Repository klonen
```bash
git clone <your-repo-url>
cd nginx-iac
```

### 2. Terraform initialisieren
```bash
terraform init
```

### 3. Konfiguration validieren
```bash
terraform fmt -recursive
terraform validate
```

### 4. Plan erstellen
```bash
terraform plan
```

### 5. Infrastruktur deployen
```bash
terraform apply
```

### 6. Nginx testen
Nach erfolgreichem Deployment:
- Öffnen Sie http://localhost:8001
- Oder testen Sie mit: `curl http://localhost:8001`

### 7. Aufräumen
```bash
terraform destroy
```

## Variablen

| Variable | Beschreibung | Standard | Typ |
|----------|--------------|----------|-----|
| `container_name` | Name des Nginx-Containers | `nginx-from-tf` | string |
| `image_name` | Docker-Image für Nginx | `nginx:latest` | string |
| `external_port` | Externer Port für HTTP | `8001` | number |

### Eigene Werte setzen

Erstellen Sie eine `terraform.tfvars` Datei:
```hcl
container_name = "mein-nginx"
external_port  = 9000
```

## Outputs

Das Projekt gibt folgende Werte aus:
- `nginx_url`: URL zum Zugriff auf Nginx
- `container_name`: Name des erstellten Containers
- `external_port`: Verwendeter externer Port

## Vollständige Workflow-Dokumentation

### Terraform Formatierung und Validierung
![Terraform Format](screenshots/terraFMT.png)
*Code-Formatierung und Validierung*

### 1. Terraform Plan (Erstellung)
![Terraform Plan Create](screenshots/terraPlan.png)
*Plan zeigt neue Ressourcen mit `+` Symbolen*

### 2. Terraform Apply (Erstellung)
![Terraform Apply Create](screenshots/terraApply.png)
*Erfolgreiche Ressourcen-Erstellung mit Outputs*

### 3. Infrastruktur-Verifikation
![Docker PS](screenshots/PS.png)
*Docker Container läuft erfolgreich*

### 4. Nginx Funktionstest
![Curl Test](screenshots/curl1.png)
*Nginx antwortet erfolgreich auf Port 8001*

### 5. Terraform Plan (Update)
![Terraform Plan Update](screenshots/terraPlan2.png)
*Plan zeigt Änderungen mit `~` Symbolen*

### 6. Terraform Apply (Update)
![Terraform Apply Update](screenshots/upt.png)
*Erfolgreiche Ressourcen-Aktualisierung*

### 7. Terraform Destroy
![Terraform Destroy](screenshots/dest.png)
*Vollständige Infrastruktur-Zerstörung*

## Wichtige Befehle

```bash
# Terraform initialisieren
terraform init

# Code formatieren
terraform fmt -recursive

# Konfiguration validieren
terraform validate

# Plan anzeigen
terraform plan

# Änderungen anwenden
terraform apply

# Ressourcen anzeigen
terraform show

# Outputs anzeigen
terraform output

# Infrastruktur zerstören
terraform destroy

# Docker-Container prüfen
docker ps
```

## Docker-Befehle zur Verifikation

```bash
# Laufende Container anzeigen
docker ps

# Container-Logs anzeigen
docker logs nginx-updated-tf

# Container stoppen (manuell)
docker stop nginx-updated-tf

# Container entfernen (manuell)
docker rm nginx-updated-tf
```

## Lernziele erreicht

-  **Provider-Konfiguration**: Kreuzwerker Docker Provider v3.0
-  **Ressourcen-Management**: Docker Image und Container
-  **Variablen**: Konfigurierbare Parameter
-  **Outputs**: Wichtige Infrastrukturdaten
-  **Locals**: Interne Port-Definition
-  **Module**: Wiederverwendbare Container-Konfiguration
-  **Vollständiger Workflow**: init → plan → apply → destroy

## Problembehandlung

### Port bereits belegt
Falls Port 8001 belegt ist, ändern Sie `external_port` in `variables.tf`:
```hcl
variable "external_port" {
  default = 8002  # Anderen Port verwenden
}
```

### Docker nicht verfügbar
Stellen Sie sicher, dass Docker Desktop läuft:
```bash
docker --version
docker ps
```

### Provider-Probleme
Bei Provider-Konflikten:
```bash
rm -rf .terraform/
rm .terraform.lock.hcl
terraform init
```

## Entwicklungs-Workflow

1. **Änderungen vornehmen** in `.tf` Dateien
2. **Formatieren**: `terraform fmt -recursive`
3. **Validieren**: `terraform validate`
4. **Planen**: `terraform plan`
5. **Anwenden**: `terraform apply`
6. **Testen**: Container-Funktionalität prüfen
7. **Committen**: Git-Commit erstellen

## Herausforderungen und Lösungen

### Provider-Konflikte
**Problem**: Doppelte Provider-Konfigurationen  
**Lösung**: Provider nur im Root-Modul definieren

### Port-Konflikte
**Problem**: Port 8000 bereits belegt  
**Lösung**: Standard-Port auf 8001 geändert

### Modul-Struktur
**Problem**: Konsistente Modul-Organisation  
**Lösung**: Klare Trennung von Root- und Modul-Konfiguration

## Nützliche Links

- [Terraform Docker Provider](https://registry.terraform.io/providers/kreuzwerker/docker/latest)
- [Terraform Documentation](https://www.terraform.io/docs)
- [Docker Hub - Nginx](https://hub.docker.com/_/nginx)

## Lizenz

Dieses Projekt dient Lernzwecken und ist frei verwendbar.

