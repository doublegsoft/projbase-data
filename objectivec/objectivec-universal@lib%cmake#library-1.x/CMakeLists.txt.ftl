<#import "/$/projbase.ftl" as projbase>
<#if license?? && bash??>
${base.license(license)}
</#if>
cmake_minimum_required(VERSION 3.13)

project(${app.name} CXX)

set(CMAKE_CXX_STANDARD          17)
set(CMAKE_CXX_FLAGS               "${r"${"}CMAKE_CXX_FLAGS${r"}"}")

set(GFC                         "gfc")
set(ARGPARSE                    "argparse")

set(WITH_GFC_CRYPTO OFF CACHE BOOL "gfc crypto" FORCE)
set(WITH_GFC_JVM OFF CACHE BOOL "gfc jvm" FORCE)
set(WITH_GFC_LUA OFF CACHE BOOL "gfc lua" FORCE)
add_subdirectory("3rd/${r"${"}GFC${r"}"}")
add_subdirectory("3rd/${r"${"}ARGPARSE${r"}"}")

if (CMAKE_SYSTEM_NAME STREQUAL "Darwin")
  set(BUILD                    "build/darwin")
endif()    

set(${app.name?upper_case?replace('-', '_')}_SRC
  "src/${app.name}.c" 
)

include_directories(
  "src"
  "3rd/${r"${"}GFC${r"}"}/include"
  "3rd/${r"${"}ARGPARSE${r"}"}"
)

link_directories(

)

add_executable(${app.name}
  ${r"${"}${app.name?upper_case?replace('-', '_')}_SRC${r"}"}
)

add_dependencies(${app.name}
  gfc
  argparse
)

target_link_libraries(${app.name} PRIVATE
  gfc
  argparse
)