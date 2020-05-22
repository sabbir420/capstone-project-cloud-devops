#!/usr/bin/env bash

## Complete the following steps to get Docker running locally

# Step 1:
# Build image and add a descriptive tag
docker build -t capstone-app .

# Step 2: 
# List docker images
docker images

# Step 3: 
# Run app
docker run -p 80:80 capstone-app