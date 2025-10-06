<#import "/$/projbase.ftl" as projbase>
<#if license?? && bash??>
${base.license(license)}
</#if>
cmake_minimum_required(VERSION 3.13)

project(${app.name} C)

set(CMAKE_C_STANDARD            99)
set(CMAKE_C_FLAGS               "${r"${"}CMAKE_C_FLAGS${r"}"}")

if (CMAKE_SYSTEM_NAME STREQUAL "Darwin")
  set(BUILD                    "build/darwin")
endif()    

set(${app.name?upper_case?replace('-', '_')}_SRC
<#list dependencies as dep>
  <#if dep == "poco">
  "src/${app.name}-poco.c"
  <#elseif dep == "sql">
  "src/${app.name}-sql.c"
  </#if>  
</#list>
)

include_directories(
  "src"
)

link_directories(

)

add_library(${app.name} STATIC ${r"${"}${app.name?upper_case?replace('-', '_')}_SRC${r"}"})
add_library(${app.name}_shared SHARED ${r"${"}${app.name?upper_case?replace('-', '_')}_SRC${r"}"})
set_target_properties(${app.name}_shared PROPERTIES OUTPUT_NAME ${app.name})

target_link_libraries(${app.name} PRIVATE
  
)