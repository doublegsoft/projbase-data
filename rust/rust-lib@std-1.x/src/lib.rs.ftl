<#if license??>
${rust.license(license)}
</#if>
<#list helper.listFiles("src") as filename>
  <#assign modname = filename?replace("src/", "")?replace(".rs", "")>
  <#if modname == "lib"><#continue></#if>
pub mod ${modname};
</#list>


