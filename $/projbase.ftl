<#function get_page_type_name page>
  <#local pageId = page.id>
  <#local strs = pageId?split("/")>
  <#if (strs?size >= 3)>
    <#local ret = "">
    <#list 1..(strs?size-1) as index>
      <#if ret != "">
        <#local ret += "_">
      </#if>  
      <#local ret += strs[index]>
    </#list>
    <#return ret>
  </#if>
  <#return pageId>
</#function>