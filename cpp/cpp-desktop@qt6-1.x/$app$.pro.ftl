QT += core gui widgets

CONFIG += c++17

TARGET = ${cpp.nameType(app.name)}
TEMPLATE = app

macx {
  QMAKE_CXXFLAGS += -include arm_acle.h
  QMAKE_CXXFLAGS += -Wno-error=implicit-function-declaration -Wno-implicit-function-declaration
}

SOURCES += \
<#list helper.listFiles("src") as filepath>
  <#if filepath?ends_with(".cpp") && !filepath?ends_with("main.cpp")>
  src/${filepath} \
  </#if>
</#list>
  src/main.cpp

HEADERS += \
<#list helper.listFiles("src") as filepath>
  <#if filepath?ends_with(".hpp") && !filepath?ends_with("error.hpp")>
  ${filepath} \
  </#if>
</#list>
  src/${namespace}-error.hpp
