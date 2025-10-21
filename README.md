# 🕶️ Nivell 1 — Exercici 1: Òptica “Cul d’Ampolla”

## 📄 Enunciat
Una òptica, anomenada **“Cul d’Ampolla”**, vol informatitzar la gestió dels **clients**, **proveïdors**, **ulleres** i **vendes**.

### Requisits del sistema

#### 🧾 Proveïdors
- Nom  
- Adreça (carrer, número, pis, porta, ciutat, codi postal i país)  
- Telèfon  
- Fax  
- NIF  

#### 🕶️ Ulleres
- Marca  
- Graduació de cada vidre  
- Tipus de muntura (flotant, pasta o metàl·lica)  
- Color de la muntura  
- Color de cada vidre  
- Preu  

#### 👥 Clients
- Nom  
- Adreça postal  
- Telèfon  
- Correu electrònic  
- Data de registre  
- Client recomanador (si n’hi ha)

#### 💼 Vendes
- Cada venda ha d’indicar el **client**, l’**empleat/da** i les **ulleres** venudes.

#### 💡 Política de compres
- Les ulleres d’una **marca** es compraran a un **únic proveïdor**.  
- Un **proveïdor** pot vendre ulleres de **diverses marques**.

---

## 🧱 Estructura de la base de dades

El disseny segueix una estructura **relacional normalitzada**, amb les següents taules principals:

| Taula | Descripció |
|--------|-------------|
| `proveidor` | Informació dels proveïdors |
| `marca` | Cada marca està associada a un proveïdor |
| `ulleres` | Ulleres associades a una marca |
| `client` | Clients amb autoreferència per recomanació |
| `empleat` | Empleats de l’òptica |
| `venda` | Registre de vendes (client, empleat, data, preu) |
| `venda_detall` | Ulleres incloses en cada venda |

---

## 🔗 Relacions entre taules

- **proveidor → marca** → 1:N  
- **marca → ulleres** → 1:N  
- **client → client** → autoreferència (client recomanador)  
- **client → venda** → 1:N  
- **empleat → venda** → 1:N  
- **venda → venda_detall → ulleres** → N:M

---

## 🧩 Diagrama relacional

![Model relacional de l'òptica](src/culdampolla_optics_model.png)

---

## 🧰 Eines utilitzades

- 🐳 **Docker Desktop** — Contenidor MySQL 8.0  
- 💾 **MySQL Workbench 8.0** — Disseny de taules i execució de consultes  
- 🧩 **EER Diagram** — Exportat des de Workbench en format `.png`  

---

## ⚙️ Configuració del contenidor MySQL

Fitxer `docker-compose.yml` utilitzat:

```yaml
version: '3.9'

services:
  mysql:
    image: mysql:8.0
    container_name: my-mysql
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: admin123
      MYSQL_DATABASE: culdampolla_optics
      MYSQL_USER: esther
      MYSQL_PASSWORD: key123
    ports:
      - "3307:3306"
    volumes:
      - mysql_data:/var/lib/mysql

volumes:
  mysql_data:

