package org.fullstack4.springmvc.service;

import lombok.extern.log4j.Log4j2;
import org.fullstack4.springmvc.dto.BbsDTO;
import org.fullstack4.springmvc.dto.BbsReplyDTO;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@Log4j2
@ExtendWith(SpringExtension.class) // spring에게 test위임
@ContextConfiguration(locations ="file:src/main/webapp/WEB-INF/root-context.xml") // context정보
public class BbsReplyServiceTests {
    @Autowired
    private BbsReplyServiceIf bbsReplyServiceIf;
    @Test
    public void testReplyRegist(){
        BbsReplyDTO bbsReplyDTO = BbsReplyDTO.builder()
                .bbs_idx(51)
                .user_id("test")
                .title("제목 테스트")

                .build();
        int result = bbsReplyServiceIf.replyRegist(bbsReplyDTO);

        System.out.println(result);
    }
}
