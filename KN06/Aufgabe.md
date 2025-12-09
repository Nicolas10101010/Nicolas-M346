# KN06: Skalierung

## 1. Erklärung Reverse Proxy

Ein **Reverse Proxy** ist ein Server, der die Anfragen von Nutzern entgegennimmt und an die richtigen Server weiterleitet.

**Vorteile:**

- Schnellere Zugriffe durch Caching
- Bessere Sicherheit (z. B. Schutz der Backend-Server)
- Lastverteilung auf mehrere Server

---

## 2. Screenshot von Swagger – Übersicht

![Swagger](Images/swagger.png)

---

## 3. Screenshot von Swagger – Products

![Swagger-Products](Images/swagger-products.png)

---

## 4. Auszug der Collections in der Datenbank

![MongoDB-Products](Images/mongodb-products.png)

---

## 6. Cloud-init: Was macht keinen Sinn in produktiver Umgebung?

- Passwörter/Secrets im Klartext im Cloud-Init (MongoDB Connection String mit Username/Passwort)
- disable_root: false - Root sollte deaktiviert sein
- SSH-Keys direkt im Script statt über Secrets Manager
- git clone eines öffentlichen Repos - sollte private Registry sein

# B) Vertikale Skalierung (10%)

## Mehr Disk-Space – Dokumentation der Einstellungen

### Screenshots:

![Speicher-8gb](Images/Speicher-8gb.png)
![Speicher-Edit](Images/Volume-ändern.png)
![Speicher-20gb-ändern](Images/Speicher-20gb-ändern.png)
![Speicher-20gb](Images/Speicher-20gb.png)
Geht das im laufenden Betrieb?

Ja, das Volume kann erweitert werden während die Instanz läuft
Aber das Dateisystem muss danach noch angepasst werden (mit resize2fs)

---

## Vorher–Nachher (Medium)

### Vorher:

![Webserver-t3.Micro](Images/Webserver-t3.Micro.png)

### Wie/Wo:

![Instanztyp-verändern](Images/Instanztyp-verändern.png)
![Instanztyp-veränder2](Images/Instanztyp-verändern2.png)

### Nachher:

![Webserver-t2.Medium](Images/Webserver-t2.Medium.png)

Geht das im laufenden Betrieb?

Nein, die Instanz muss gestoppt werden

# C) Horizontale Skalierung (20%)

Erklärung DNS:

Man erstellt einen CNAME-Eintrag, der `app.tbz-m346.ch` auf die Load Balancer URL `LB-WebAPI-KN06-1491355170.us-east-1.elb.amazonaws.com` weiterleitet.

![Load-Balancer-Swagger](Images/Load-Balancer-Swagger.png)

# D) Auto Scaling (20%)

![Instanz-running1](Images/instanz-running1.png)
![Instanz-delelte](Images/instanz-delete.png)
![Instanz-running2](Images/instanz-running2.png)
