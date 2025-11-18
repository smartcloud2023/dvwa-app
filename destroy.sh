#!/bin/bash

# Stop and remove all containers
echo "Stopping and removing Docker containers..."
docker-compose down

# Remove all Docker images (forcefully)
echo "Removing all Docker images..."
docker rmi -f $(docker images -aq)

# Remove the specified Docker volume (e.g., dvwa_db_data)
echo "Removing Docker volume dvwa_db_data..."
docker volume rm dvwa_db_data

echo "Cleanup complete."
