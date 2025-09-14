<#import "/$/modelbase.ftl" as modelbase>
<#import "/$/modelbase4go.ftl" as modelbase4go>
<#assign libname = app.name>
<#if libname?starts_with("lib")>
  <#assign libname = libname?substring(3)>
</#if>
module ${libname}

go 1.23