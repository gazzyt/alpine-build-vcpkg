#!/bin/sh -e

ARCH=`uname -m`

TRIPLET="x64-linux-static"

if [ -z $(echo "$ARCH"|sed "/arm/d") ]; then
TRIPLET="arm-linux-static"
fi

echo "$TRIPLET"

./vcpkg install libpqxx --triplet "$TRIPLET"
./vcpkg install nlohmann-json --triplet "$TRIPLET"
./vcpkg install restbed --triplet "$TRIPLET"
./vcpkg install librdkafka --triplet "$TRIPLET"
