terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# Security Group für Datenbank
resource "aws_security_group" "db_sg" {
  name        = "SG-Database-KN09-Terraform"
  description = "Security Group fuer MariaDB"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "SG-Database-KN09-Terraform"
  }
}

# EC2 Instanz für Datenbank
resource "aws_instance" "db_server" {
  ami           = "ami-0e2c8caa4b6378d8c"
  instance_type = "t2.micro"
  key_name      = "nicolas3"

  vpc_security_group_ids = [aws_security_group.db_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              apt-get update
              apt-get install -y mariadb-server
              sleep 10
              mysql -sfu root -e "GRANT ALL ON *.* TO 'admin'@'%' IDENTIFIED BY 'password' WITH GRANT OPTION;"
              mysql -sfu root -e "CREATE DATABASE IF NOT EXISTS blog;"
              sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf
              systemctl restart mariadb
              EOF

  tags = {
    Name = "DB-Server-KN09-Terraform"
  }
}

# Output: Public IP anzeigen
output "db_server_public_ip" {
  value = aws_instance.db_server.public_ip
}