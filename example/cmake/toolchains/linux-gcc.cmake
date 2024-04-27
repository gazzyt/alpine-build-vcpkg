if(NOT _VCPKG_LINUX_TOOLCHAIN)
set(_VCPKG_LINUX_TOOLCHAIN 1)
if(CMAKE_HOST_SYSTEM_NAME STREQUAL "Linux")
    set(CMAKE_CROSSCOMPILING OFF CACHE BOOL "")
endif()
set(CMAKE_SYSTEM_NAME Linux CACHE STRING "")
if(VCPKG_TARGET_ARCHITECTURE STREQUAL "x64")
   set(CMAKE_SYSTEM_PROCESSOR x86_64 CACHE STRING "")
elseif(VCPKG_TARGET_ARCHITECTURE STREQUAL "x86")
   set(CMAKE_SYSTEM_PROCESSOR x86 CACHE STRING "")
   string(APPEND VCPKG_C_FLAGS " -m32")
   string(APPEND VCPKG_CXX_FLAGS " -m32")
   string(APPEND VCPKG_LINKER_FLAGS " -m32")
elseif(VCPKG_TARGET_ARCHITECTURE STREQUAL "arm")
    set(CMAKE_SYSTEM_PROCESSOR armv7l CACHE STRING "")
    if(CMAKE_HOST_SYSTEM_NAME STREQUAL "Linux")
        if(NOT DEFINED CMAKE_CXX_COMPILER)
            set(CMAKE_CXX_COMPILER "g++")
        endif()
        if(NOT DEFINED CMAKE_C_COMPILER)
            set(CMAKE_C_COMPILER "gcc")
        endif()
        if(NOT DEFINED CMAKE_ASM_COMPILER)
            set(CMAKE_ASM_COMPILER "gcc")
        endif()
        if(NOT DEFINED CMAKE_ASM-ATT_COMPILER)
            set(CMAKE_ASM-ATT_COMPILER "as")
        endif()
        message(STATUS "Cross compiling arm on host ${CMAKE_HOST_SYSTEM_PROCESSOR}, use cross compiler: ${CMAKE_CXX_COMPILER}/${CMAKE_C_COMPILER}")
    endif()
elseif(VCPKG_TARGET_ARCHITECTURE STREQUAL "arm64")
    set(CMAKE_SYSTEM_PROCESSOR aarch64 CACHE STRING "")
    if(CMAKE_HOST_SYSTEM_NAME STREQUAL "Linux")
        if(NOT DEFINED CMAKE_CXX_COMPILER)
            set(CMAKE_CXX_COMPILER "g++")
        endif()
        if(NOT DEFINED CMAKE_C_COMPILER)
            set(CMAKE_C_COMPILER "gcc")
        endif()
        if(NOT DEFINED CMAKE_ASM_COMPILER)
            set(CMAKE_ASM_COMPILER "gcc")
        endif()
        if(NOT DEFINED CMAKE_ASM-ATT_COMPILER)
            set(CMAKE_ASM-ATT_COMPILER "as")
        endif()
        message(STATUS "Cross compiling arm64 on host ${CMAKE_HOST_SYSTEM_PROCESSOR}, use cross compiler: ${CMAKE_CXX_COMPILER}/${CMAKE_C_COMPILER}")
    endif()
endif()

get_property( _CMAKE_IN_TRY_COMPILE GLOBAL PROPERTY IN_TRY_COMPILE )
if(NOT _CMAKE_IN_TRY_COMPILE)
    string(APPEND CMAKE_C_FLAGS_INIT " -fPIC ${VCPKG_C_FLAGS} ")
    string(APPEND CMAKE_CXX_FLAGS_INIT " -fPIC ${VCPKG_CXX_FLAGS} ")
    string(APPEND CMAKE_C_FLAGS_DEBUG_INIT " ${VCPKG_C_FLAGS_DEBUG} ")
    string(APPEND CMAKE_CXX_FLAGS_DEBUG_INIT " ${VCPKG_CXX_FLAGS_DEBUG} ")
    string(APPEND CMAKE_C_FLAGS_RELEASE_INIT " ${VCPKG_C_FLAGS_RELEASE} ")
    string(APPEND CMAKE_CXX_FLAGS_RELEASE_INIT " ${VCPKG_CXX_FLAGS_RELEASE} ")

    string(APPEND CMAKE_MODULE_LINKER_FLAGS_INIT " ${VCPKG_LINKER_FLAGS} ")
    string(APPEND CMAKE_SHARED_LINKER_FLAGS_INIT " ${VCPKG_LINKER_FLAGS} ")
    string(APPEND CMAKE_EXE_LINKER_FLAGS_INIT " ${VCPKG_LINKER_FLAGS} ")
    if(VCPKG_CRT_LINKAGE STREQUAL "static")
        string(APPEND CMAKE_MODULE_LINKER_FLAGS_INIT "-static ")
        string(APPEND CMAKE_SHARED_LINKER_FLAGS_INIT "-static ")
        string(APPEND CMAKE_EXE_LINKER_FLAGS_INIT "-static ")
    endif()
    string(APPEND CMAKE_MODULE_LINKER_FLAGS_DEBUG_INIT " ${VCPKG_LINKER_FLAGS_DEBUG} ")
    string(APPEND CMAKE_SHARED_LINKER_FLAGS_DEBUG_INIT " ${VCPKG_LINKER_FLAGS_DEBUG} ")
    string(APPEND CMAKE_EXE_LINKER_FLAGS_DEBUG_INIT " ${VCPKG_LINKER_FLAGS_DEBUG} ")
    string(APPEND CMAKE_MODULE_LINKER_FLAGS_RELEASE_INIT " ${VCPKG_LINKER_FLAGS_RELEASE} ")
    string(APPEND CMAKE_SHARED_LINKER_FLAGS_RELEASE_INIT " ${VCPKG_LINKER_FLAGS_RELEASE} ")
    string(APPEND CMAKE_EXE_LINKER_FLAGS_RELEASE_INIT " ${VCPKG_LINKER_FLAGS_RELEASE} ")
endif()
endif()
