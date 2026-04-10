FROM alpine:3.23
RUN apk update; apk upgrade; apk add build-base openssh zip unzip linux-headers cmake git binutils perl curl flex bison ninja pkgconf bash openssl-dev autoconf automake libtool curl-dev
COPY ./fix.patch /opt/fix.patch
WORKDIR /opt
RUN git clone --branch 2026.03.18 https://github.com/microsoft/vcpkg.git
WORKDIR /opt/vcpkg
# Patch for https://github.com/microsoft/vcpkg-tool/issues/1922
RUN git apply /opt/fix.patch
ENV VCPKG_FORCE_SYSTEM_BINARIES=1
ENV VCPKG_ROOT=/opt/vcpkg
RUN ./bootstrap-vcpkg.sh

