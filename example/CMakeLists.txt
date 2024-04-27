cmake_minimum_required(VERSION 3.10)

project(HelloVcpkg)

find_package(fmt CONFIG REQUIRED)

add_executable(HelloVcpkg hellovcpkg.cpp)

target_link_libraries(HelloVcpkg PRIVATE fmt::fmt)