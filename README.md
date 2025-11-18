### DVWA Docker Deployment

This repository provides a simple setup for DVWA (Damn Vulnerable Web Application) using Docker. This deployment includes:

 * Docker Compose to manage multiple containers (PHP + Apache, MySQL).

 * Automated deployment of DVWA with reCAPTCHA integration.

 * Scripts for easy deployment, setup, and cleanup.

## Table of Contents

 1. Prerequisites

 2. Setup Instructions

   * Running the Deployment

   * Configuring reCAPTCHA

 3. Scripts

   * deploy.sh

   * destroy.sh

 4. Troubleshooting

 5. Credits

## Prerequisites

Before deploying DVWA, make sure you have the following installed:

Docker: Install Docker from here
.

Docker Compose: Install Docker Compose from here
.

Setup Instructions
Running the Deployment

Clone this repository to your local machine:

```
git clone https://github.com/yourusername/dvwa-docker-deployment.git
cd dvwa-docker-deployment
```

Start the deployment:
This will build and run the DVWA application using Docker Compose.

./deploy.sh <your-recaptcha-site-key> <your-recaptcha-secret-key>


Replace <your-recaptcha-site-key> and <your-recaptcha-secret-key> with your actual reCAPTCHA keys.

The DVWA will be accessible at:

http://localhost/DVWA

Configuring reCAPTCHA

To configure reCAPTCHA for the DVWA application:

Go to the Google reCAPTCHA
 site and create a reCAPTCHA key pair (v2 or v3, depending on your choice).

Use the provided site key and secret key when running the deploy.sh script.

The script automatically adds these keys to the config.inc.php file in the DVWA container.

Scripts
deploy.sh

This script automates the process of:

Updating the reCAPTCHA site key and secret key in the config.inc.php file.

Rebuilding and starting the Docker containers.

Usage:
./deploy.sh <your-recaptcha-site-key> <your-recaptcha-secret-key>

destroy.sh

This script is used to tear down the deployment and clean up the Docker environment:

Stops and removes the containers.

Removes all Docker images from the local machine.

Deletes the Docker volume used for the DVWA database.

Usage:
./destroy.sh

Troubleshooting

ERR_CONNECTION_RESET:

Ensure that your Docker containers are up and running (docker ps).

Try accessing the app with a clean URL: http://localhost/DVWA/.

If using a remote server, ensure that the security group/firewall allows inbound traffic on port 80.

MySQL Access Denied:

Make sure the database credentials in config.inc.php match the ones in your Docker Compose setup.

SQL Syntax Error:

If you encounter an SQL syntax error when creating the database, verify that the SQL commands are compatible with your MySQL version.

Credits

DVWA: Damn Vulnerable Web Application

Docker: Docker Documentation

reCAPTCHA: Google reCAPTCHA

Feel free to contribute or open an issue if you encounter any bugs or improvements you think of!
