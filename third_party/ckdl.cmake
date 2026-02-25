include(ExternalProject)

ExternalProject_Add(libkdlpp
    GIT_REPOSITORY https://github.com/tjol/ckdl.git
    GIT_TAG 1.0
    CMAKE_ARGS
        -DCMAKE_C_COMPILER=${CMAKE_C_COMPILER}
        -DCMAKE_CXX_COMPILER=${CMAKE_CXX_COMPILER}
        -DBUILD_SHARED_LIBS=OFF
        -DBUILD_KDLPP=ON
        -DBUILD_TESTS=OFF
        -DCMAKE_BUILD_TYPE=Release
        -DCMAKE_INSTALL_PREFIX=<INSTALL_DIR>

    BUILD_BYPRODUCTS <INSTALL_DIR>/lib/libkdlpp.a
)

ExternalProject_Get_Property(libkdlpp install_dir)
add_library(kdlpp STATIC IMPORTED)
set_target_properties(kdlpp PROPERTIES
    IMPORTED_LOCATION ${install_dir}/lib/libkdlpp.a
    INTERFACE_INCLUDE_DIRECTORIES ${install_dir}/include
)
add_dependencies(kdlpp libkdlpp)