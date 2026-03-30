#!/bin/bash

# Stop Spring PetClinic Application
echo "Stopping Spring PetClinic application..."

# Find and kill the Spring Boot process
PID=$(ps aux | grep "[m]vnw spring-boot:run" | awk '{print $2}')

if [ -z "$PID" ]; then
    echo "No running Spring Boot application found."
else
    echo "Stopping process $PID..."
    kill -9 $PID
    echo "Application stopped successfully."
fi
