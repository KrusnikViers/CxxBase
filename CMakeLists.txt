project( cxxbase )
cmake_minimum_required( VERSION 3.0 )

include( cmake/utils.cmake )
cxxbase_require_cpp_standart(11)

# cxxbase
add_subdirectory(src)

# cxxbase_tests
add_subdirectory(tests)
