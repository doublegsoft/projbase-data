<#if license??>
${java.license(license)}
</#if>
package ${namespace}.${app.name}.aop;

import jakarta.annotation.Resource;
import jakarta.servlet.http.HttpServletRequest;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.*;

import java.util.concurrent.TimeUnit;

@Aspect
@Component
public class DuplicateSubmitAspect {
  
  @Resource
  private RedisTemplate redisTemplate;

  @Around("@annotation(prevent)")
  public Object around(ProceedingJoinPoint pjp,
                       PreventDuplicateSubmit prevent) throws Throwable {

    HttpServletRequest request =
      ((ServletRequestAttributes)
        RequestContextHolder.getRequestAttributes())
        .getRequest();

    String userId = getCurrentUserId(request);
    String uri = request.getRequestURI();
    String token = request.getHeader("X-Request-Token");

    if (prevent.requireToken() && (token == null || token.isBlank())) {
      // TODO: throw new DuplicateSubmitException("Missing X-Request-Token header");
    }

    String key;

    if (token != null && !token.isBlank()) {
      key = "dup:" + userId + ":" + uri + ":" + token;
    } else {
      key = "dup:" + userId + ":" + uri;
    }

    Boolean success = redisTemplate.opsForValue()
      .setIfAbsent(key, "1",
        prevent.expire(), TimeUnit.SECONDS);

    if (Boolean.FALSE.equals(success)) {
      // TODO: throw new DuplicateSubmitException("Duplicate submission");
    }

    return pjp.proceed();
  }

  private String getCurrentUserId(HttpServletRequest request) {
    // 示例：从 header 读取用户ID
    // 实际项目中可从 JWT / SecurityContext 获取
    String userId = request.getHeader("X-User-Id");
    if (userId == null || userId.isBlank()) {
      userId = "anonymous";
    }
    return userId;
  }
}