<?xml version="1.0" encoding="UTF-8" ?>

<!--suppress SpringFacetInspection -->
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:context="http://www.springframework.org/schema/context"
       xmlns:mvc="http://www.springframework.org/schema/mvc"
       xmlns:jdbc="http://www.springframework.org/schema/jdbc"
       xsi:schemaLocation="
       http://www.springframework.org/schema/beans
       http://www.springframework.org/schema/beans/spring-beans.xsd
       http://www.springframework.org/schema/context
       http://www.springframework.org/schema/context/spring-context.xsd
       http://www.springframework.org/schema/mvc
       http://www.springframework.org/schema/mvc/spring-mvc.xsd
       http://www.springframework.org/schema/jdbc
       http://www.springframework.org/schema/jdbc/spring-jdbc.xsd">
  
  <context:annotation-config />
  <context:component-scan base-package="${namespace}.${app.name}" />
  
  <jdbc:initialize-database data-source="dataSource">
    <jdbc:script location="classpath:/sql/install-database-${app.name}-mysql.sql"/>
  </jdbc:initialize-database>  
  
  <!-- 替换成您的真实数据库配置 -->
  <bean name="dataSource" class="org.springframework.jdbc.datasource.DriverManagerDataSource">
    <property name="driverClassName" value="org.h2.Driver" />
    <property name="url" value="jdbc:h2:mem:test;MODE=MYSQL;DB_CLOSE_DELAY=-1" />
  </bean>
  <!--bean name="dataSource" class="org.springframework.jdbc.datasource.DriverManagerDataSource">
    <property name="driverClassName" value="com.mysql.cj.jdbc.Driver"/>
    <property name="url" value="jdbc:mysql://localhost:3306/${app.name}?serverTimezone=Asia/Shanghai&amp;allowMultiQueries=true&amp;useSSL=false&amp;allowPublicKeyRetrieval=true&amp;autoReconnect=true&amp;failOverReadOnly=false&amp;zeroDateTimeBehavior=convertToNull&amp;maxReconnect=3&amp;autoReconnectForPools=true"/>
    <property name="username" value="root"/>
    <property name="password" value="ganguo"/>
  </bean-->  

  <bean id="sqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean">
    <property name="dataSource" ref="dataSource"/>
    <property name="mapperLocations" value="classpath*:orm/*.xml"/>
  </bean>

  <bean class="org.mybatis.spring.mapper.MapperScannerConfigurer">
    <property name="basePackage" value="${namespace}.${app.name}.dao"/>
  </bean>

</beans>
