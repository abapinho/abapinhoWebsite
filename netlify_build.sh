#! /bin/bash

# 1. Build site
hugo --gc --minify

# 2. Publish JSONs to Algolia
npm install atomic-algolia

# 2.1. Portuguese
ALGOLIA_INDEX_NAME=${ALGOLIA_INDEX_NAME_PT}
ALGOLIA_INDEX_FILE=./public/index.json
npm run algolia

# 2.2. English
ALGOLIA_INDEX_NAME=${ALGOLIA_INDEX_NAME_EN}
ALGOLIA_INDEX_FILE=./public/en/index.json
npm run algolia
