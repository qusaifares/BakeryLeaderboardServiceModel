const parser = require('@apidevtools/swagger-parser');
const path = require('path');

// List all your API specs here
const specs = [
  '../services/leaderboard-api/v1/openapi.yaml',
];

async function validateSpec(filePath) {
  try {
    let api = await parser.validate(filePath);
    console.log(`Successfully validated ${filePath}`);
  } catch (err) {
    console.error(`Error validating ${filePath}:`);
    console.error(err.message);
    process.exit(1);  // Exit with a failure mode
  }
}

// Entry point: Validate all specs
(async function() {
  for (let spec of specs) {
    await validateSpec(path.resolve(__dirname, spec));
  }
  console.log('All specs are valid.');
})();
