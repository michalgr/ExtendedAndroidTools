#! /bin/bash
# Copyright (c) Meta Platforms, Inc. and affiliates.

BUCK_VERSION="v2022.05.05.01"
ANT_VERSION="1.9.16"

dest="${1:-$(pwd)/buck}"
echo "installing buck to ${dest}..."

git clone --depth 1 --branch "${BUCK_VERSION}" \
    https://github.com/facebook/buck.git \
    /tmp/buck
wget -q -P /tmp/buck \
    "https://dlcdn.apache.org//ant/binaries/apache-ant-${ANT_VERSION}-bin.zip"

cd /tmp/buck && unzip "apache-ant-${ANT_VERSION}-bin.zip"
cd /tmp/buck && "apache-ant-${ANT_VERSION}/bin/ant"
cd /tmp/buck && ./bin/buck build buck --out "${dest}"
rm -rf /tmp/buck

echo "done"
