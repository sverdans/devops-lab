
project(arrmax-test)

file(GLOB_RECURSE ARRMAX_TEST_SOURCES "${CMAKE_CURRENT_SOURCE_DIR}/*.cpp")

add_executable(${PROJECT_NAME} ${ARRMAX_TEST_SOURCES})

target_link_libraries(${PROJECT_NAME}
    PRIVATE
        arrmax-lib
        gtest)

target_check_iwyu(${PROJECT_NAME})
