#!/bin/sh

# Paths for the spec and the output directory
SPEC_PATH="./services/leaderboard-api/v1/openapi.yaml"
OUTPUT_PATH="./output/model/java"

echo "Generating Java SDK..."

# This command assumes you have the OpenAPI Generator CLI installed. 
# If not, you can use a Docker image or a local installation.
openapi-generator-cli generate \
-i $SPEC_PATH \
-g java \
-o $OUTPUT_PATH \
-D models \
-D modelDocs=false \
-D modelTests=false \
-D apis= \
-D supportingFiles= \
-D modelPackage=com.bakeryleaderboard.service.model

if [ $? -eq 0 ]; then
    echo "Java SDK generated successfully!"
else
    echo "Error generating Java SDK."
fi
