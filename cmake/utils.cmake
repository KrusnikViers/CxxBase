
# Requires |NUMBER| standart for C++.
macro( cxxbase_require_cpp_standart NUMBER )
    set( CMAKE_CXX_STANDARD ${NUMBER} )
    set( CMAKE_CXX_STANDARD_REQUIRED on )
endmacro()

# Set output directories for all configurations to |PATH|/[bin|lib].
macro( cxxbase_set_output_directories PATH )
    message( STATUS "Output directories set to ${PATH}" )
    set( CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PATH}/bin )
    set( CMAKE_LIBRARY_OUTPUT_DIRECTORY ${PATH}/bin )
    set( CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${PATH}/lib )
    foreach( OUTPUTCONFIG ${CMAKE_CONFIGURATION_TYPES} )
        string( TOUPPER ${OUTPUTCONFIG} OUTPUTCONFIG )
        set( CMAKE_RUNTIME_OUTPUT_DIRECTORY_${OUTPUTCONFIG} ${CMAKE_RUNTIME_OUTPUT_DIRECTORY} )
        set( CMAKE_LIBRARY_OUTPUT_DIRECTORY_${OUTPUTCONFIG} ${CMAKE_LIBRARY_OUTPUT_DIRECTORY} )
        set( CMAKE_ARCHIVE_OUTPUT_DIRECTORY_${OUTPUTCONFIG} ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY} )
    endforeach()
endmacro()

# Set strict compilation flags for |TARGET|.
macro( cxxbase_strict_compile TARGET )
    if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
        # -Wall: Enable all warnings.
        # -Wextra: Additional warnings for GCC.
        # -Werror: Treat warnings as errors.
        message( STATUS "Using GCC or *Clang compiler for ${TARGET}" )
        target_compile_options( ${TARGET} PRIVATE -Wall -Wextra -Werror )
    elseif(MSVC)
        # -W3: Enable all warnings except for informational.
        # -WX: Treat warnings as errors.
        message( STATUS "Using Visual C++ compiler for ${NAME}" )
        target_compile_options( ${NAME} PRIVATE -W3 -WX )
    else()
        message( WARNING "Unknown compiler! No compilation flags set from cxxbase.")
    endif()
endmacro()
