// generate-ts-sdk.js

const { execSync } = require('child_process');

const SPEC_PATHS = [
    { input: './services/leaderboard-api/v1/openapi.yaml', output: './output/model/typescript/leaderboard' },
    { input: './services/active-game-api/v1/openapi.yaml', output: './output/model/typescript/active-game' },
]

try {
    console.log('Generating TypeScript SDK...');

    SPEC_PATHS.forEach(({input, output}) => {
        // This command assumes you have @openapitools/openapi-generator-cli globally installed.
        // Alternatively, you can use a local installation or even a Docker image.
        execSync(`openapi-generator-cli generate -i ${input} -g typescript-fetch -o ${output}`);
        
        console.log('TypeScript SDK generated successfully!');
    })
} catch (error) {
    console.error('Error generating TypeScript SDK:', error);
}
