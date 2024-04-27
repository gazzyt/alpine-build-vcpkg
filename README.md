Purpose
=======
This is a container image for building statically-linked C++ applications that use vcpkg (in manifest mode). It is intented for building minimalist (i.e. [FROM scratch](https://hub.docker.com/_/scratch)) multi-arch Docker containers.
Currently supports:
* x64 Linux - for your development machine
* 64 bit ARM - for Raspberry PI 4 and later
* 32 bit ARM - for older Raspberry PIs


Setup Docker to build the container
===================================
You will need to do this if you have not previously setup `buildx`:
```
docker buildx create --name mybuilder --bootstrap --use
```

Or, to limit concurrency (if you are short on RAM):
```
docker buildx create --name mybuilder --bootstrap --use --config buildkitd.toml
```

To build and push the container
======================
docker buildx build --platform linux/amd64,linux/arm/v7,linux/arm64/v8 -t <yourdockerhubaccount>/alpine-build-vcpkg:1.5 --push .

To build the example application
================================
Build the example application from the `example` folder.
```
cd example
```

Build a local container
-----------------------
Build an x64 container that you can run locally:
```
docker buildx build --no-cache --platform linux/amd64 -t <yourdockerhubaccount>/vcpkghelloworld:0.1 --load -f docker/Dockerfile .
```

Test the built container by running it:
```
docker run <yourdockerhubaccount>/vcpkghelloworld:0.1
```
It should output the following and terminate:
```
Hello Vcpkg!
```

Build and Push a Multi-Arch Container
-------------------------------------
This builds your container for each platform and pushes the image to Docker Hub:
```
docker buildx build --no-cache --platform linux/amd64,linux/arm/v7,linux/arm64/v8 -t <yourdockerhubaccount>/vcpkghelloworld:0.1 --push -f docker/Dockerfile .
```
