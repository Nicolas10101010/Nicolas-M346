# Cloud-Init und SSH-Key Aufgabe

## A) Cloud-init Datei verstehen (10%)

Die YAML-Datei befindet sich im YAML-Ordner.

## B) SSH-Key und Cloud-init (15%)

### 1. Angepasste YAML

Die angepasste YAML-Datei finden Sie im YAML-Ordner.
Der öffentliche SSH-Key wurde für die Cloud-Init Konfiguration angepasst.

### 2. Details der Instanz

![Instanz-Details](Images/Instanz-Details.png)

### 3. SSH-Befehl mit dem ersten Schlüssel (funktioniert)

![SSH-Key1](Images/SSH-Key1.png)

### 4. SSH-Befehl mit dem zweiten Schlüssel (funktioniert nicht)

![SSH-Key2](Images/SSH-Key2.png)

### 5. Cloud-Init Log

![Instanz-Log](Images/Instanz-log.png)

```bash
sudo less /var/log/cloud-init-output.log
```

## D) Installation automatisieren (70%)

### Datenbank

![bind-address](Images/bind-address.png)

Der Befehl zum Anzeigen:

```bash
sudo grep "bind-address" /etc/mysql/mariadb.conf.d/50-server.cnf
```

### Webserver

db.php
![db.php](Images/db.php.png)

index.html
![index.html](Images/index.html.png)

info.php
![info.php](Images/info.php.png)

Admin Login DB
![adminer](Images/adminer.png)
