#! /bin/bash
# Copyright (c) Meta Platforms, Inc. and affiliates.

echo "installing deps..."

apt-get update
apt-get install -y \
     autoconf \
     automake \
     autopoint \
     bison \
     flex \
     g++ \
     gettext \
     git \
     help2man \
     libssl-dev \
     libtool \
     make \
     openjdk-8-jdk \
     openjdk-8-jre \
     pkg-config \
     po4a \
     python \
     python3-distutils \
     texinfo \
     unzip \
     wget

echo "done"
