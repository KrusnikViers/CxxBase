set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(HEADERS
    cxxbase.h
    easylogging/src/easylogging++.h
)

set(SOURCES
    easylogging/src/easylogging++.cc
)

add_library( cxxbase ${SOURCES} ${HEADERS} )
cxxbase_strict_compile( cxxbase )
