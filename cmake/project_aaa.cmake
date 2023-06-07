
include(ExternalProject)

set(aaa_config_command "cd ${CMAKE_SOURCE_DIR}/deps/src/aaa && cmake .")
ExternalProject_Add(aaa
    PREFIX ${CMAKE_SOURCE_DIR}/deps
    DOWNLOAD_NAME aaa-1.0.tar.gz
    DOWNLOAD_NO_PROGRESS 1
    URL https://github.com/bolanbujing/test_a/archive/refs/tags/1.0.tar.gz
        
    URL_HASH SHA256=3d848a2d0d13d4562a6c8670cfafc9a57201e814cf4bb55c810c8660247d93f9
    CMAKE_COMMAND ${CMAKE_COMMAND}
    CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=<INSTALL_DIR>
               # Build static lib but suitable to be included in a shared lib.
    BUILD_IN_SOURCE 1
    CONFIGURE_COMMAND ${CMAKE_COMMAND} .
    LOG_CONFIGURE 1
    LOG_BUILD 1
    BUILD_COMMAND make
    #${_overwrite_install_command}
    LOG_INSTALL 1
    INSTALL_COMMAND ""
)

# Create rapidjson imported library
ExternalProject_Get_Property(aaa SOURCE_DIR)
add_library(AAA STATIC IMPORTED)

set(AAA_LIBRARY ${SOURCE_DIR}/${CMAKE_STATIC_LIBRARY_PREFIX}aaa${CMAKE_STATIC_LIBRARY_SUFFIX})
set(AAA_INCLUDE_DIR ${SOURCE_DIR})
file(MAKE_DIRECTORY ${AAA_INCLUDE_DIR})  # Must exist.
set_property(TARGET AAA PROPERTY IMPORTED_LOCATION ${AAA_LIBRARY})
set_property(TARGET AAA PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${AAA_INCLUDE_DIR})
add_dependencies(AAA aaa)
unset(INSTALL_DIR)