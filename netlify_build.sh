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

# 3. Check links (production only — this is a ~600-page recursive
#    crawl and costs ~1m45s; not worth paying on every preview build).
#    This replaces the netlify-plugin-checklinks entry in netlify.toml,
#    using the same underlying engine (hyperlink) directly so we can
#    scope when it runs. See: https://github.com/Munter/netlify-plugin-checklinks
if [ "$CONTEXT" = "production" ]; then
  npx --yes hyperlink --root public --canonicalroot "https://abapinho.com" \
    public/index.html public/en/index.html
else
  echo "Skipping link check for context: ${CONTEXT}"
fi
