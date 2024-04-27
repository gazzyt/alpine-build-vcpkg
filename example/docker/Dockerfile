FROM gazzyt/alpine-build-vcpkg:1.5 as build

LABEL description="Build container"

COPY . /tmp/example/

ENV EXAMPLE_ROOT /tmp/example

RUN cd /tmp/example \
    && cmake --preset "Docker Linux Static Release" . \
    && cmake --build build/linux-static-release --parallel 14

FROM scratch as runtime

LABEL description="Run container"

COPY --from=build /tmp/example/build/linux-static-release/HelloVcpkg .
CMD [ "./HelloVcpkg" ]