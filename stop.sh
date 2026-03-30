#!/bin/bash

# Stop Spring PetClinic Application
echo "Stopping Spring PetClinic application..."

# Kill process on port 8080
if lsof -Pi :8080 -sTCP:LISTEN -t >/dev/null ; then
    echo "Killing process on port 8080..."
    lsof -ti:8080 | xargs kill -9
    echo "✓ Application stopped successfully."
else
    echo "No application running on port 8080."
fi

# Also kill any mvnw spring-boot:run processes
PID=$(ps aux | grep "[m]vnw spring-boot:run" | awk '{print $2}')
if [ ! -z "$PID" ]; then
    echo "Stopping Maven process $PID..."
    kill -9 $PID
fi
