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
--additional-properties apis=None \
--additional-properties supportingFiles=None \
--additional-properties modelDocs=false \
--additional-properties modelTests=false \
--additional-properties modelPackage=com.bakeryleaderboard.service.servicemodel.model


if [ $? -eq 0 ]; then
    echo "Java SDK generated successfully!"
else
    echo "Error generating Java SDK."
fi


# # Paths for the spec and the output directory
# SPEC_PATH="./services/leaderboard-api/v1/openapi.yaml"
# OUTPUT_PATH="./output/model/java"

# echo "Generating Java SDK..."

# # This command assumes you have the OpenAPI Generator CLI installed. 
# # If not, you can use a Docker image or a local installation.
# openapi-generator-cli generate \
# -i $SPEC_PATH \
# -g java \
# -o $OUTPUT_PATH \
# --additional-properties apis=None \
# --additional-properties supportingFiles=None \
# --additional-properties modelDocs=false \
# --additional-properties modelTests=false \
# --additional-properties modelPackage=com.bakeryleaderboard.service.servicemodel.model \
# --additional-properties withXml=false \
# --additional-properties dateLibrary=java8 \
# --additional-properties hideGenerationTimestamp=true \
# --additional-properties serializableModel=true \
# --additional-properties useBeanValidation=true \
# --additional-properties toModelNameSuffix=Model \
# --additional-properties toModelNamePrefix="" \
# --additional-properties generateBuilders=true

# if [ $? -eq 0 ]; then
#     echo "Java SDK generated successfully!"
# else
#     echo "Error generating Java SDK."
# fi
