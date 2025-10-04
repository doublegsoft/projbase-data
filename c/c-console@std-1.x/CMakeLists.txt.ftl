<#import "/$/projbase.ftl" as projbase>
<#if license?? && bash??>
${base.license(license)}
</#if>
cmake_minimum_required(VERSION 3.13)

project(${app.name} C)

set(CMAKE_C_STANDARD            99)
set(CMAKE_C_FLAGS               "${r"${"}CMAKE_C_FLAGS${r"}"}")

# set(GFC                         "gfc")
set(ARGPARSE                    "argparse-1.1.0")

set(WITH_GFC_CRYPTO OFF CACHE BOOL "gfc crypto" FORCE)
set(WITH_GFC_JVM OFF CACHE BOOL "gfc jvm" FORCE)
set(WITH_GFC_LUA OFF CACHE BOOL "gfc lua" FORCE)
# add_subdirectory("3rd/${r"${"}GFC${r"}"}")
add_subdirectory("3rd/${r"${"}ARGPARSE${r"}"}")

if (CMAKE_SYSTEM_NAME STREQUAL "Darwin")
  set(BUILD                    "build/darwin")
endif()    

set(${app.name?upper_case?replace('-', '_')}_SRC
  "src/${app.name}.c"
<#list dependencies as dep>
  <#if dep == "poco">
  "src/${app.name}-poco.c"
  </#if>  
</#list>
)

include_directories(
  "src"
  "include"
  "3rd/${r"${"}GFC${r"}"}/include"
  "3rd/${r"${"}ARGPARSE${r"}"}"
)

link_directories(

)

# add_library(${app.name} STATIC ${r"${"}LIB${app.name?upper_case}_SOURCES})
# add_library(${app.name}_shared SHARED ${r"${"}LIB${app.name?upper_case}_SOURCES})
# set_target_properties(app.name}_shared PROPERTIES OUTPUT_NAME ${app.name})

add_executable(${app.name}
  ${r"${"}${app.name?upper_case?replace('-', '_')}_SRC${r"}"}
)

target_link_libraries(${app.name} PRIVATE
  argparse
)