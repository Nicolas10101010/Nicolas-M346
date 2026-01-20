# KN09 - CLI Befehle

# Instanz stoppen
aws ec2 stop-instances --region us-east-1 --instance-ids i-01b68e9a78c9c5238

# Instanz starten
aws ec2 start-instances --region us-east-1 --instance-ids i-01b68e9a78c9c5238

# Neue DB-Instanz erstellen mit Cloud-Init
aws ec2 run-instances --region us-east-1 --image-id ami-0e2c8caa4b6378d8c --instance-type t2.micro --key-name nicolas3 --security-group-ids sg-034b94d70eb5a47a2 --user-data file://db-cloud-init.yaml --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=DB-Server-KN09-CLI}]"

# Security Group Port 3306 öffnen
aws ec2 authorize-security-group-ingress --region us-east-1 --group-id sg-034b94d70eb5a47a2 --protocol tcp --port 3306 --cidr 0.0.0.0/0