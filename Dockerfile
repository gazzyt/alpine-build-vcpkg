FROM gazzyt/alpine-build-cmake:1.2
RUN apk update; apk add perl curl flex bison ninja pkgconf bash
WORKDIR /opt
RUN git clone https://github.com/microsoft/vcpkg.git
WORKDIR /opt/vcpkg/triplets
RUN sed 's/dynamic/static/g' x64-linux.cmake > x64-linux-static.cmake
RUN sed 's/x64/arm/g' x64-linux-static.cmake > arm-linux-static.cmake
WORKDIR /opt/vcpkg
RUN ./bootstrap-vcpkg.sh --useSystemBinaries
ENV VCPKG_FORCE_SYSTEM_BINARIES 1
COPY vcpkg-install.sh .
RUN chmod +x vcpkg-install.sh
RUN ./vcpkg-install.sh
