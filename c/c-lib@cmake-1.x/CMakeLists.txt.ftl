<#import "/$/projbase.ftl" as projbase>
<#if license?? && bash??>
${base.license(license)}
</#if>
cmake_minimum_required(VERSION 3.16)

project(MyCProject LANGUAGES C CXX)

set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

if (CMAKE_SYSTEM_NAME STREQUAL "Darwin")
  set(BUILD "build/darwin")
elseif (CMAKE_SYSTEM_NAME STREQUAL "Linux")
  set(BUILD "build/linux")
elseif (MINGW)
  set(BUILD "build/mingw")
elseif (WIN32)
  set(BUILD "build/windows")
else()
  message(FATAL_ERROR "Unsupported operating system: '${r"${CMAKE_SYSTEM_NAME}"}'. Configuration halted.")
endif() 

set(${app.name?upper_case?replace('-', '_')}_SRC
<#list helper.listFiles("src") as srcFile>
  <#if srcFile?ends_with(".c")>
  "${srcFile}"
  </#if>
</#list>
)

include_directories(
  "src"
)

add_library(${app.name} STATIC ${r"${"}${app.name?upper_case?replace('-', '_')}_SRC${r"}"})
add_library(${app.name}_shared SHARED ${r"${"}${app.name?upper_case?replace('-', '_')}_SRC${r"}"})
set_target_properties(${app.name}_shared PROPERTIES OUTPUT_NAME ${app.name})

target_link_libraries(${app.name} PRIVATE
  
)

set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)

add_subdirectory(3rd/googletest-1.18.0)

enable_testing()
include(GoogleTest)

add_executable(${app.name}_tests 
<#list helper.listFiles("test") as testFile>
  <#if testFile?ends_with(".cpp")>
  "${testFile}"
  </#if>
</#list>
)

target_link_libraries(${app.name}_tests PRIVATE 
  ${app.name} 
  gtest_main
)

gtest_discover_tests(${app.name}_tests)