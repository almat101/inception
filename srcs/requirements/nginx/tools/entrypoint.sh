#!bin/sh

# Create a self-signed SSL certificate then move to a script.sh
openssl req -x509 -nodes -out ${CERTS} -keyout ${KEYS} -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=${DOMAIN_NAME}/UID=${USER}" > /dev/null 2>&1

# Start NGINX in foreground
nginx -g "daemon off;"
