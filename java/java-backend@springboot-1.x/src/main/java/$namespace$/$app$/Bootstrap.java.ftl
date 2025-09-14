<#if license??>
${java.license(license)}
</#if>
package ${namespace}.${app.name};

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ImportResource;

/**
 * The startup entry for application.
 *
 * @author <a href="mailto:guo.guo.gan@gmail.com">Christian Gann</a>
 *
 * @since 1.0
 */
@SpringBootApplication
@ImportResource({"file:${r"${"}user.dir}/spring.xml"})
public class Bootstrap {

  public static void main(String[] args) throws Exception {
    SpringApplication.run(Bootstrap.class, args);
  }

}
