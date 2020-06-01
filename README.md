To build and push the container
======================
docker buildx build --platform linux/amd64,linux/arm/v7 -t gazzyt/alpine-build-vcpkg:1.0 --push .

To run a cmake build
====================
docker run -i -v /home/pi/dev/studentofferservice:/etc/code gazzyt/alpine-build-vcpkg:1.0 ash -c "VCPKG_FORCE_SYSTEM_BINARIES=1;cd /etc/code/build;cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_TOOLCHAIN_FILE=/opt/vcpkg/scripts/buildsystems/vcpkg.cmake -DVCPKG_TARGET_TRIPLET=x64-linux-static ..;make"
