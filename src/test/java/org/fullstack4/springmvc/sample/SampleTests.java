package org.fullstack4.springmvc.sample;

import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import javax.sql.DataSource;
import java.sql.Connection;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")

public class SampleTests {
    @Autowired
    private SampleService sampleService;

    @Autowired
    private DataSource dataSource;



    @Test
    public void testService(){
        System.out.println("============================");
        log.info("sampleService test : " + sampleService); //객체가 생성 됐는지 의존성 주입이 됐는지 학인



        System.out.println(sampleService);
        Assertions.assertNotNull(sampleService);
    }
    @Test
    public void testConnection() throws Exception{
        Connection connection = dataSource.getConnection();
        System.out.println(connection);

        Assertions.assertNotNull(connection);
        connection.close();
    }

}
