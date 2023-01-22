#!/bin/bash
echo $PWD
docker run --rm \
    -v $PWD:/local openapitools/openapi-generator-cli generate \
    -i /local/openapi.yaml \
    --global-property apiDocs=true,apiTests=false,modelDocs=false,modelTests=false \
    -p gemLicense="MPL-2.0" \
    -p gemName=pvault-sdk \
    -p gemVersion=1.0.0 \
    -p moduleName=PvaultSdk \
    -p gemRequiredRubyVersion=">=3" \
    -p gemHomepage="https://piiano.com" \
    -g ruby \
    -o ../pvault-sdk
