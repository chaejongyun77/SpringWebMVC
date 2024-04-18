package org.fullstack4.springmvc.sample.service;

import lombok.extern.log4j.Log4j2;
import org.fullstack4.springmvc.dto.BbsDTO;
import org.fullstack4.springmvc.service.BbsServiceIf;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@Log4j2
@ExtendWith(SpringExtension.class) // spring에게 test위임
@ContextConfiguration(locations ="file:src/main/webapp/WEB-INF/root-context.xml") // context정보
public class BbsServiceTests
{
    @Autowired
   private BbsServiceIf bbsServiceIf;

    @Test
    public void testRegist(){
        BbsDTO bbsDTO = BbsDTO.builder()
                .user_id("test")
                .title("제목 테스트")
                .content("내용테스트")
                .display_date("2024-04-18")
                .read_cnt(0)
                .build();
        int result = bbsServiceIf.regist(bbsDTO);
    }
}
