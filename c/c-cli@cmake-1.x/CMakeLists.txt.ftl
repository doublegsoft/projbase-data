<#import "/$/projbase.ftl" as projbase>
<#if license?? && bash??>
${base.license(license)}
</#if>
cmake_minimum_required(VERSION 3.16)

project(${app.name} LANGUAGES C CXX)

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
<#list helper.listThirdParties("3rd") as thirdparty>
  <#if thirdparty.name == "googletest"><#continue></#if>
  <#assign libs = thirdparty.libraries>

################################################################################
##                                                                            ##
##${thirdparty.name?left_pad(((76 + thirdparty.name?length) / 2)?int)?right_pad(76)}##
##                                                                            ##
################################################################################
set(${(thirdparty.name?upper_case + "_ROOT")?right_pad(32, " ")}"${r"${"}CMAKE_CURRENT_SOURCE_DIR}/3rd/${thirdparty.name}<#if thirdparty.version??>-${thirdparty.version}</#if>")
set(${(thirdparty.name?upper_case + "_INCLUDE_DIR")?right_pad(32, " ")}"${r"${"}${thirdparty.name?upper_case}_ROOT}/include")
set(${(thirdparty.name?upper_case + "_LIBRARY_DIR")?right_pad(32, " ")}"${r"${"}${thirdparty.name?upper_case}_ROOT}/${r"${"}BUILD}")
<#list libs as lib>
  <#if lib?index == 0>
set(${(thirdparty.name?upper_case + "_LIBRARIES")?right_pad(32)}"${r"${"}${thirdparty.name?upper_case}_LIBRARY_DIR}/lib${lib}.a"<#if lib?index == libs?size - 1>)</#if>
  <#else>
    ${""?right_pad(32)}"${r"${"}${thirdparty.name?upper_case}_LIBRARY_DIR}/lib${lib}.a"<#if lib?index == libs?size - 1>)</#if>
  </#if>
</#list>
</#list>

<#list helper.listThirdParties("3rd") as thirdparty>
  <#if thirdparty.name == "googletest"><#continue></#if>
add_subdirectory("${r"${"}${thirdparty.name?upper_case}_ROOT}" "${r"${"}${thirdparty.name?upper_case}_ROOT}/${r"${"}BUILD}")  
</#list>

set(${app.name?upper_case?replace('-', '_')}_SRC
<#list helper.listFiles("src") as srcFile>
  <#if srcFile?ends_with(".c")>
  "${srcFile}"
  </#if>
</#list>
)

include_directories(
  "src"
<#list helper.listThirdParties("3rd") as thirdparty>
  <#if thirdparty.name == "googletest"><#continue></#if>
  ${r"${"}${thirdparty.name?upper_case + "_INCLUDE_DIR"}}
</#list>
)

link_directories(
<#list helper.listThirdParties("3rd") as thirdparty>
  <#if thirdparty.name == "googletest"><#continue></#if>
  ${r"${"}${thirdparty.name?upper_case + "_LIBRARY_DIR"}}
</#list>  
)

add_executable(${app.name} ${r"${"}${app.name?upper_case?replace('-', '_')}_SRC${r"}"})
target_link_libraries(${app.name} PRIVATE
<#list helper.listThirdParties("3rd") as thirdparty>
  <#if thirdparty.name == "googletest"><#continue></#if>
  ${r"${"}${thirdparty.name?upper_case + "_LIBRARIES"}}
</#list>    
)

add_dependencies(${app.name} 
<#list helper.listThirdParties("3rd") as thirdparty>
  <#if thirdparty.name == "googletest"><#continue></#if>
  ${thirdparty.name}
</#list>    
)