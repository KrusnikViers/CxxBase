set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)

add_subdirectory( gtest )
enable_testing()

set(SOURCES
    logging_tests.cpp
)

add_executable( cxxbase_tests ${SOURCES} )
target_link_libraries( cxxbase_tests cxxbase gtest gtest_main )
target_include_directories( cxxbase_tests PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/../src
                                                  gtest/googletest
                                                  gtest/googletest/include )
cxxbase_strict_compile( cxxbase_tests )
