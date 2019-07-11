
import com.yealink.ymall.payment.PaymentApplication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.MediaType;
import org.springframework.http.RequestEntity;
import org.springframework.test.context.testng.AbstractTestNGSpringContextTests;

import java.net.URI;
import java.util.HashMap;

/**
 * 支付基础测试
 */
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT, classes = {BaseApplication.class})
public class BaseTestApplication extends AbstractTestNGSpringContextTests {

    @Autowired
    TestRestTemplate testRestTemplate;

    protected <T, S> S post(String url, T req, ParameterizedTypeReference<S> reference) {
        return testRestTemplate.exchange(RequestEntity.post(URI.create(url))
                .contentType(MediaType.APPLICATION_JSON_UTF8)
                .body(req), reference).getBody();
    }

    protected <S> S get(String url, ParameterizedTypeReference<S> reference) {
        return testRestTemplate.exchange(RequestEntity.get(URI.create(url)).build(), reference).getBody();
    }


}
