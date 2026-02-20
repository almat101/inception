#!bin/sh

set -eu

# Create a self-signed SSL certificate then move to a script.sh
echo "Create a self-signed SSL certificate"
openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=${DOMAIN_NAME}/UID=${USER}" > /dev/null 2>&1

# Start NGINX in foreground
echo "Start NGINX in foreground"
# nginx -g "daemon off;"

## Using 'exec "$@"' ensures the CMD from the Dockerfile becomes PID 1.
## This follows Docker best practices for proper signal handling and graceful shutdown.
exec "$@"

