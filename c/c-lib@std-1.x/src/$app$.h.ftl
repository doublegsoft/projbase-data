<#import "/$/projbase.ftl" as projbase>
<#if license??>
${c.license(license)}
</#if>
#ifndef __${app.name?upper_case}_H__
#define __${app.name?upper_case}_H__

#ifdef __cplusplus
extern "C" 
{
#endif



#ifdef __cplusplus
}
#endif

#endif // __${app.name?upper_case}_H__