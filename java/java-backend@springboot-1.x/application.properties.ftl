server.port = 8810

spring.main.allow-circular-references=true
spring.jackson.date-format=yyyy-MM-dd HH:mm:ss
spring.jackson.default-property-inclusion=non_empty
spring.http.encoding.charset=UTF-8
spring.http.encoding.enabled=true 
spring.http.encoding.force=true 

server.servlet.context-path=/api
logging.level.${namespace}.${app.name}.dao=DEBUG