#!/bin/sh

# Array of OpenAPI spec file paths
SPEC_PATHS=(
    "./services/leaderboard-api/v1/openapi.yaml"
    "./services/active-game-api/v1/openapi.yaml"
    # Add more spec paths here
)

# Output directory base path
OUTPUT_BASE_PATH="./output/model/java"

echo "Generating Java SDKs..."

# Loop through each spec file
for SPEC_PATH in "${SPEC_PATHS[@]}"
do
    # Generate output path based on spec file name
    SPEC_NAME=$(basename "$SPEC_PATH" .yaml)
    OUTPUT_PATH="$OUTPUT_BASE_PATH/$SPEC_NAME"

    echo "Generating Java SDK for $SPEC_NAME..."

    # Generate Java SDK
    openapi-generator-cli generate \
    -i "$SPEC_PATH" \
    -g java \
    -o "$OUTPUT_PATH" \
    --additional-properties apis=None \
    --additional-properties supportingFiles=None \
    --additional-properties modelDocs=false \
    --additional-properties modelTests=false \
    --additional-properties modelPackage=com.bakeryleaderboard.service.servicemodel.model

    # Check if the generation was successful
    if [ $? -eq 0 ]; then
        echo "Java SDK for $SPEC_NAME generated successfully!"
    else
        echo "Error generating Java SDK for $SPEC_NAME."
    fi
done

echo "Java SDK generation process completed."
