FROM alpine:3.21
RUN apk update; apk upgrade; apk add build-base openssh zip unzip linux-headers cmake git binutils perl curl flex bison ninja pkgconf bash openssl-dev
WORKDIR /opt
RUN git clone --branch 2025.01.13 https://github.com/microsoft/vcpkg.git
WORKDIR /opt/vcpkg
ENV VCPKG_FORCE_SYSTEM_BINARIES 1
ENV VCPKG_ROOT /opt/vcpkg
RUN ./bootstrap-vcpkg.sh

