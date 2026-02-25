cmake_minimum_required(VERSION 4.2.3)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

project(makit
    VERSION 0.1.0
    DESCRIPTION "A simple build system written in C++"
    LANGUAGES CXX
)

find_package(blake3 CONFIG REQUIRED)
find_package(argparse CONFIG REQUIRED)

include(third_party/ckdl.cmake)

add_executable(makit
    src/Main.cpp
)
target_link_libraries(makit 
    PRIVATE 
        c++
        c++abi
)