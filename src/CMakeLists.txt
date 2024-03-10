
##########################################
# arrmax library
##########################################

file(GLOB_RECURSE ARRMAX_LIB_SOURCES "${CMAKE_CURRENT_SOURCE_DIR}/arrmax/*.cpp")

add_library(arrmax-lib ${ARRMAX_LIB_SOURCES})

target_include_directories(arrmax-lib
    PUBLIC
        "${CMAKE_CURRENT_SOURCE_DIR}/arrmax")

target_compile_options(arrmax-lib
    PRIVATE
        ${ARRMAX_COMPILER_FLAGS})

target_check_iwyu(arrmax-lib)

##########################################
# arrmax executable
##########################################

add_executable(${PROJECT_NAME} "${CMAKE_CURRENT_SOURCE_DIR}/main.cpp")

target_link_libraries(${PROJECT_NAME}
    PRIVATE
        arrmax-lib)

target_compile_options(${PROJECT_NAME}
    PRIVATE
        ${ARRMAX_COMPILER_FLAGS})

target_compile_definitions(${PROJECT_NAME}
    PRIVATE 
        ARRMAX_VERSION="${arrmax_VERSION}")

target_check_iwyu(${PROJECT_NAME})
