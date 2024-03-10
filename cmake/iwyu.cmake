
function(target_check_iwyu target_name)
    find_program(IWYU NAMES include-what-you-use iwyu)

    if(NOT IWYU)
        message(WARNING "Could not find the program include-what-you-use")
    else()
        set_property(TARGET ${target_name} PROPERTY CXX_INCLUDE_WHAT_YOU_USE ${IWYU})
        message(STATUS "[${target_name}] Build with include-what-you-use")
    endif()
endfunction()
