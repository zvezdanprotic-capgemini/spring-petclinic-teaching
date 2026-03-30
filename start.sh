#!/bin/bash

# Start Spring PetClinic Application
echo "Starting Spring PetClinic application..."

# Check if port 8080 is already in use
if lsof -Pi :8080 -sTCP:LISTEN -t >/dev/null ; then
    echo "Port 8080 is already in use. Stopping existing process..."
    lsof -ti:8080 | xargs kill -9
    sleep 2
fi

# Run the application
./mvnw spring-boot:run
