#! /bin/bash

# 1. Build site
hugo --gc --minify

# 2. Publish JSONs to Algolia
npm install atomic-algolia

# 2.1. Portuguese
export ALGOLIA_INDEX_NAME=${ALGOLIA_INDEX_NAME_PT}
export ALGOLIA_INDEX_FILE=./public/index.json
DEBUG=true npm run algolia

# 2.2. English
#export ALGOLIA_INDEX_NAME=${ALGOLIA_INDEX_NAME_EN}
#export ALGOLIA_INDEX_FILE=./public/en/index.json
#npm run algolia

