cmake_minimum_required(VERSION 3.24)

project(arrmax
    VERSION 1.0.0
    LANGUAGES CXX C)

set(BUILD_SHARED_LIBS OFF)
set(CMAKE_CXX_STANDARD 20)

option(ARRMAX_BUILD_TEST "" OFF)

include(cmake/iwyu.cmake)

include(FetchContent)
FetchContent_Declare(googletest
    GIT_REPOSITORY https://github.com/google/googletest.git
    GIT_TAG v1.14.0
    FIND_PACKAGE_ARGS NAMES GTest)
FetchContent_MakeAvailable(googletest)

set(ARRMAX_COMPILER_FLAGS)
if(CMAKE_CXX_COMPILER_ID MATCHES "GNU")
    list(APPEND ARRMAX_COMPILER_FLAGS
        -Werror
        -Wall
        -Wextra
        -Wcast-align
        -Wcast-qual
        -Wconversion
        -Wextra-semi
        -Wsign-compare
        -Wsign-conversion
        -pedantic
        -pedantic-errors)
endif()

add_subdirectory(src)

if(${ARRMAX_BUILD_TEST})
    add_subdirectory(test)
endif()
