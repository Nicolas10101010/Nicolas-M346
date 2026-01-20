# KN05 - Konzeptionelle CLI Befehle
# (Referenzen sind Beispiele, werden nicht ausgeführt)

# 1. Security Group für Webserver erstellen
aws ec2 create-security-group --group-name SG-Webserver-KN05-CLI --description "Security Group fuer Webserver" --vpc-id vpc-081e3db3ff68add6e

# 2. Security Group Regeln für Webserver (SSH + HTTP)
aws ec2 authorize-security-group-ingress --group-id sg-WEBSERVER-EXAMPLE --protocol tcp --port 22 --cidr 0.0.0.0/0
aws ec2 authorize-security-group-ingress --group-id sg-WEBSERVER-EXAMPLE --protocol tcp --port 80 --cidr 0.0.0.0/0

# 3. Security Group für Datenbank erstellen
aws ec2 create-security-group --group-name SG-Database-KN05-CLI --description "Security Group fuer Datenbank" --vpc-id vpc-081e3db3ff68add6e

# 4. Security Group Regeln für Datenbank (SSH + MySQL)
aws ec2 authorize-security-group-ingress --group-id sg-DATABASE-EXAMPLE --protocol tcp --port 22 --cidr 0.0.0.0/0
aws ec2 authorize-security-group-ingress --group-id sg-DATABASE-EXAMPLE --protocol tcp --port 3306 --cidr 0.0.0.0/0

# 5. Elastic IP erstellen
aws ec2 allocate-address --domain vpc --tag-specifications "ResourceType=elastic-ip,Tags=[{Key=Name,Value=EIP-Webserver-KN05-CLI}]"

# 6. DB-Server Instanz erstellen
aws ec2 run-instances --image-id ami-0e2c8caa4b6378d8c --instance-type t2.micro --key-name nicolas3 --security-group-ids sg-DATABASE-EXAMPLE --private-ip-address 172.31.48.20 --user-data file://db-cloud-init.yaml --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=DB-Server-KN05-CLI}]"

# 7. Webserver Instanz erstellen
aws ec2 run-instances --image-id ami-0e2c8caa4b6378d8c --instance-type t2.micro --key-name nicolas3 --security-group-ids sg-WEBSERVER-EXAMPLE --private-ip-address 172.31.48.10 --user-data file://web-cloud-init.yaml --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=Webserver-KN05-CLI}]"

# 8. Elastic IP dem Webserver zuweisen
aws ec2 associate-address --instance-id i-WEBSERVER-EXAMPLE --allocation-id eipalloc-EXAMPLE