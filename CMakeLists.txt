cmake_minimum_required(VERSION 3.12)

project(test_b)

set(CHAIN_CMAKE_DIR "${CMAKE_CURRENT_LIST_DIR}/cmake" CACHE PATH "The path to the cmake directory")
list(APPEND CMAKE_MODULE_PATH ${CHAIN_CMAKE_DIR})

set(CMAKE_CXX_COMPILER "/usr/bin/g++")
set(CMAKE_CXX_FLAGS "-std=c++17 -pthread -fPIC -fvisibility-inlines-hidden -fexceptions")

#include(project_aaa)

add_library(bbb y.cpp)
target_include_directories(bbb PUBLIC ${PROJECT_SOURCE_DIR}/test_b)
#target_link_libraries(bbb PUBLIC AAA)
