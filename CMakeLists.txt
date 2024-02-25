cmake_minimum_required(VERSION 3.15)

set(PROJECT_NAME arrmax)

project(${PROJECT_NAME}
    VERSION 1.0.0
    LANGUAGES CXX C)

add_executable(${PROJECT_NAME} source/main.cpp)

target_compile_definitions(${PROJECT_NAME} PUBLIC 
    ARRMAX_VERSION="${arrmax_VERSION}")

target_compile_options(${PROJECT_NAME} PUBLIC
    -Wall
    -Wextra
    -Werror
    -O2)
