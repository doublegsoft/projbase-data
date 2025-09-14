<?xml version="1.0" encoding="UTF-8"?>
<configuration>
  <appender name="ConsoleAppender" class="ch.qos.logback.core.ConsoleAppender">
    <encoder>
      <charset>UTF-8</charset>
      <pattern>%d{yyyy-MM-dd HH:mm:ss.SSS} [%t] [%level] [%logger{36}] - %msg%n</pattern>
    </encoder>
  </appender>

  <appender name="RollingFileAppender" class="ch.qos.logback.core.rolling.RollingFileAppender">
    <file>${r"${"}user.dir}/log/${app.name}.log</file>
    <rollingPolicy class="ch.qos.logback.core.rolling.TimeBasedRollingPolicy">
      <!-- daily rollover -->
      <fileNamePattern>${r"${"}user.dir}/log/pcm.%d{yyyy-MM-dd}.log</fileNamePattern>
      <maxHistory>30</maxHistory>
    </rollingPolicy>

    <encoder>
      <charset>UTF-8</charset>
      <pattern>%d{yyyy-MM-dd HH:mm:ss.SSS} [%t] [%level] [%logger{36}] - %msg%n</pattern>
    </encoder>
  </appender>

  <root level="info">
    <appender-ref ref="ConsoleAppender"></appender-ref>
    <appender-ref ref="RollingFileAppender"></appender-ref>
  </root>
</configuration>
