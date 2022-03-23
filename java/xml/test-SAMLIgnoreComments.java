// License: MIT (c) GitLab Inc.
// scaffold: dependencies=org.springframework.security.spring-security-core@5.6.2
// scaffold: dependencies=org.opensaml.xmltooling@1.3.2, org.opensaml.openws@1.4.2 
import org.opensaml.xml.parse.BasicParserPool;
import org.opensaml.xml.parse.ParserPool;
import org.springframework.context.annotation.Bean;

public class SAMLIgnoreComments {
  @Bean
  ParserPool parserPool() {
    BasicParserPool pool = new BasicParserPool();
    pool.setIgnoreComments(false);
    return pool;
  }

  @Bean
  void parserPool2() {
    Boolean shouldIgnore = false;
    BasicParserPool pool = new BasicParserPool();
    pool.setIgnoreComments(shouldIgnore);
  }
}
