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
    -o local/out

echo "OS is `uname`"
if [ `uname` == "Linux" ] ; then
    echo "Linux requires sudo"
    set -x
    sudo mv $PWD/out/ ../pvault-sdk
else
    set -x
    mv $PWD/out/ ../pvault-sdk
fi