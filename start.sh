#!/bin/bash

# Ensure reCAPTCHA keys are passed as arguments
if [ $# -ne 2 ]; then
  echo "Usage: $0 <recaptcha_site_key> <recaptcha_secret_key>"
  exit 1
fi

RECAPTCHA_SITE_KEY=$1
RECAPTCHA_SECRET_KEY=$2

# Path to config.inc.php
CONFIG_FILE="./config.inc.php"

# Check if config file exists
if [ ! -f "$CONFIG_FILE" ]; then
  echo "Error: config.inc.php file not found."
  exit 1
fi

# Update the reCAPTCHA keys in config.inc.php using sed
echo "Updating reCAPTCHA keys in config.inc.php..."

sed -i "s/\$_DVWA\['recaptcha_public_key'\] = getenv('RECAPTCHA_PUBLIC_KEY') ?: '';/\$_DVWA\['recaptcha_public_key'\] = '$RECAPTCHA_SITE_KEY';/" "$CONFIG_FILE"
sed -i "s/\$_DVWA\['recaptcha_private_key'\] = getenv('RECAPTCHA_PRIVATE_KEY') ?: '';/\$_DVWA\['recaptcha_private_key'\] = '$RECAPTCHA_SECRET_KEY';/" "$CONFIG_FILE"

# Run docker-compose up with --build flag
echo "Bringing up the Docker containers..."
docker-compose up -d --build

echo "Deployment complete."
