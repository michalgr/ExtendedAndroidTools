# Copyright (c) Meta Platforms, Inc. and affiliates.

FROM ubuntu:bionic

COPY bionic-install-deps.sh /
COPY download-ndk.sh /
COPY install-buck.sh /

RUN bash -c "/bionic-install-deps.sh" && \
    bash -c "/download-ndk.sh /opt/ndk" && \
    bash -c "/install-buck.sh /opt/buck"

WORKDIR /ExtendedAndroidTools

ENTRYPOINT ["/bin/bash"]
