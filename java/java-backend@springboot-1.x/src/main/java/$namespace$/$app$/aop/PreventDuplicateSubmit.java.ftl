<#if license??>
${java.license(license)}
</#if>
package ${namespace}.${app.name}.aop;

import java.lang.annotation.*;

@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface PreventDuplicateSubmit {

  // 过期时间（秒）
  int expire() default 3;

  // 是否必须要求前端传 token
  boolean requireToken() default false;
}
