#! /bin/bash

# Stop on errors
set -e

# 1. Build site
hugo --gc --minify

# 2. Publish JSONs to Algolia (production only — avoids pushing
#    deploy-preview/branch content into the live search index)
# atomic-algolia is now a pinned dependency in package.json, installed
# once during the main "Installing npm packages" step — no separate
# install needed here.
if [ "$CONTEXT" = "production" ]; then
  # 2.1. Portuguese
  export ALGOLIA_INDEX_NAME=${ALGOLIA_INDEX_NAME_PT}
  export ALGOLIA_INDEX_FILE=./public/index.json
  npm run algolia

  # 2.2. English
  export ALGOLIA_INDEX_NAME=${ALGOLIA_INDEX_NAME_EN}
  export ALGOLIA_INDEX_FILE=./public/en/index.json
  npm run algolia
else
  echo "Skipping Algolia sync for context: ${CONTEXT}"
fi

# Link checking is handled by netlify-plugin-checklinks in netlify.toml
# (advisory-only — it reports broken links but does not fail the build).
# A prior attempt to run `hyperlink` directly here caused a production
# deploy failure: hyperlink exits non-zero on broken links (unlike the
# plugin), and several of its checks were false positives for this site
# (Hugo aliases resolved incorrectly, stale 301/302 expectations for
# third-party redirects, a 403 from a site blocking the bot's UA).
