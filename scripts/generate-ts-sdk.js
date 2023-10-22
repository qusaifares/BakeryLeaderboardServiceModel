// generate-ts-sdk.js

const { execSync } = require('child_process');

const SPEC_PATH = './services/leaderboard-api/v1/openapi.yaml';
const OUTPUT_PATH = './output/model/typescript';

try {
    console.log('Generating TypeScript SDK...');

    // This command assumes you have @openapitools/openapi-generator-cli globally installed.
    // Alternatively, you can use a local installation or even a Docker image.
    execSync(`openapi-generator-cli generate -i ${SPEC_PATH} -g typescript-fetch -o ${OUTPUT_PATH}`);

    console.log('TypeScript SDK generated successfully!');
} catch (error) {
    console.error('Error generating TypeScript SDK:', error);
}
