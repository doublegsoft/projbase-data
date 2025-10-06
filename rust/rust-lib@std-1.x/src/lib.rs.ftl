<#if license??>
${rust.license(license)}
</#if>
<#list dependencies as dep>
pub mod ${dep};
</#list>


