#! /bin/bash
if [ "$*" == "" ]; then
    echo "Please provide post name"
    exit 1
fi
hugo new --kind post-bundle posts/$1
