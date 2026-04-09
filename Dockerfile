FROM alpine:3.23
RUN apk update; apk upgrade; apk add build-base openssh zip unzip linux-headers cmake git binutils perl curl flex bison ninja pkgconf bash openssl-dev autoconf automake libtool
WORKDIR /opt
RUN git clone --branch 2026.03.18 https://github.com/microsoft/vcpkg.git
WORKDIR /opt/vcpkg
ENV VCPKG_FORCE_SYSTEM_BINARIES 1
ENV VCPKG_ROOT /opt/vcpkg
RUN ./bootstrap-vcpkg.sh

