add_subdirectory(concurrentqueue)
add_subdirectory(detour)
# add_subdirectory(lua) # Handled globally 
# add_subdirectory(mysql) # Handled globally
add_subdirectory(recast)
add_subdirectory(sol)
add_subdirectory(spdlog)
# add_subdirectory(zmq) # Handled globally

# CPM Modules
CPMAddPackage(
    NAME argparse
    GITHUB_REPOSITORY p-ranav/argparse
    GIT_TAG f5ea927f6b3beae2ac924ffde27f570bb9a7d294
) # defines: argparse

CPMAddPackage(
    NAME efsw
    GITHUB_REPOSITORY SpartanJ/efsw
    GIT_TAG 74ca09bff89bc8de1f7b8bf3faaa6275ce23b4c5
    OPTIONS
        "VERBOSE OFF"
        "NO_ATOMICS OFF"
        "BUILD_SHARED_LIBS OFF"
        "BUILD_TEST_APP OFF"
        "EFSW_INSTALL OFF"
) # defines: efsw

set(EXTERNAL_LIBS
    concurrentqueue
    mariadbclient
    spdlog
    recast
    detour
    sol2_single
    argparse
    efsw
)

if (WIN32)
    #add wepoll for epoll support on windows
    add_subdirectory(wepoll)

    list(APPEND EXTERNAL_LIBS
        wepoll
    )
# backwards needs these to add to linker
elseif (APPLE)
    # MacOS has bfd built in clang
    list(APPEND EXTERNAL_LIBS
        dl
    )
elseif(UNIX)
    # Linux needs bfd as it's not native like MacOS
    list(APPEND EXTERNAL_LIBS
        bfd
        dl
    )
endif()

# copy external libs to parent scope
set(EXTERNAL_LIBS
    ${EXTERNAL_LIBS}
    PARENT_SCOPE
)
