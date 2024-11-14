# Terraform AWS VPC Projekt

Dieses Projekt erstellt eine AWS-Infrastruktur mithilfe von Terraform, die eine VPC mit öffentlichen und privaten Subnetzen, ein Internet-Gateway, ein NAT-Gateway, Sicherheitsgruppen und EC2-Instanzen umfasst.
Voraussetzungen: Installieren Sie [Terraform](https://www.terraform.io/downloads) und [AWS CLI](https://aws.amazon.com/cli/), und konfigurieren Sie die AWS-Anmeldeinformationen mit `aws configure`. 
Klonen Sie das Repository mit `git clone https://github.com/IhrBenutzername/IhrRepository.git`, und wechseln Sie in das Verzeichnis. Initialisieren Sie Terraform mit `terraform init`.
Die Konfiguration kann bei Bedarf in `main.tf` oder `variables.tf` angepasst werden (z.B. Region, AMI-ID für Ubuntu 24.04, oder EC2-Instanztyp).
Um die Infrastruktur zu erstellen, führen Sie `terraform apply -auto-approve` aus, und verwenden Sie `terraform destroy -auto-approve`, um sie zu entfernen.
Nach erfolgreicher Bereitstellung zeigt Terraform die Ressourcen-IDs an, einschließlich der `igw_id`, `private_route_table_id` und `public_route_table_id`.
Weitere Informationen finden Sie in der Projektstruktur: `main.tf` (Hauptdatei), `variables.tf` (Variablen) und `outputs.tf` (Ausgaben). Das Projekt steht unter der MIT-Lizenz.

