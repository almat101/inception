# Inception

This project aims to broaden your knowledge of system administration by using Docker. You will virtualize several Docker images, creating them in your new personal virtual machine.

## Project Overview

Inception involves setting up and configuring multiple services using Docker containers, each serving a specific purpose. The project uses Docker Compose to manage the containers, networks, and volumes required.

## Containers

### Nginx
- **Description**: Acts as a reverse proxy server to handle HTTP and HTTPS requests.
- **Configuration**: Configured to use a self-signed SSL certificate.
- **Ports**: Exposes port 443 for HTTPS.
- **Dependencies**: Depends on the WordPress container.
- **Build Context**: `requirements/nginx`

### MariaDB
- **Description**: A relational database management system to store WordPress data.
- **Configuration**: Uses a custom configuration file.
- **Ports**: Exposes port 3306 for database connections.
- **Build Context**: `requirements/mariadb`

### WordPress
- **Description**: A content management system to create and manage websites.
- **Configuration**: Automatically configured using a script.
- **Ports**: Exposes port 9000 for PHP-FPM.
- **Dependencies**: Depends on the MariaDB and Redis containers.
- **Build Context**: `requirements/wordpress`

### Redis
- **Description**: An in-memory data structure store used as a cache for WordPress.
- **Configuration**: Uses a custom configuration file.
- **Ports**: Exposes port 6379 for Redis connections.
- **Build Context**: `requirements/bonus/redis`

### FTP
- **Description**: An FTP server to manage file uploads.
- **Configuration**: Uses a custom configuration file and script.
- **Ports**: Exposes ports 21 and 20 for FTP, and a range of ports for passive mode.
- **Dependencies**: Depends on the WordPress container.
- **Build Context**: `requirements/bonus/ftp`

### Hugo
- **Description**: A static site generator to create a portfolio website.
- **Configuration**: Uses a custom configuration file.
- **Ports**: Exposes port 1313 for the Hugo server.
- **Build Context**: `requirements/bonus/hugo`

### Adminer
- **Description**: A lightweight database management tool.
- **Configuration**: Accessed via the Nginx container for security.
- **Ports**: Exposes port 9001 for internal access.
- **Build Context**: requirements/bonus/adminer

### Prometheus
- **Description**: A monitoring tool for collecting and analyzing metrics from services and containers.
- **Configuration**: Uses a custom configuration file to monitor specific metrics.
- **Ports**: Exposes port 9090 for accessing the Prometheus web interface.
- **Build Context**: requirements/bonus/prometheus

### Node Exporter
- **Description**: An exporter for Prometheus to collect hardware and OS metrics from the host machine.
- **Ports**: Exposes port 9100 for internal communication with Prometheus.
- **Build Context**: requirements/bonus/node-exporter

### Grafana
- **Description**: A visualization tool to create dashboards using metrics collected by Prometheus.
- **Ports**: Exposes port 3000 for accessing the Grafana web interface.
- **Build Context**: requirements/bonus/grafana

## Docker Compose Configuration

The project uses Docker Compose to manage the containers. The configuration file is located at `srcs/docker-compose.yml`. It defines the services, networks, and volumes required for the project.

### Networks
- **inception**: A bridge network that connects all the containers.
### Volumes 
- **wordpress**: Mounted at /var/www/html for WordPress data.
- **mariadb**: Mounted at /var/lib/mysql for MariaDB data.
- **adminer**: Mounted at /var/www/adminer for Adminer files.

## Environment Variables

The project requires a `.env` file with the following environment variables:

```plaintext
USER
DOMAIN_NAME
CERTS
KEYS
MARIA_DB_NAME
MARIA_USER
MARIA_PASSWORD
MARIA_ROOT_PASSWORD
WP_TITLE
WP_USER
WP_PASSWORD
WP_EMAIL
WP_ROOT_USER
WP_ROOT_PASSWORD
WP_ROOT_EMAIL
FTP_USER
FTP_PASSWORD
```


